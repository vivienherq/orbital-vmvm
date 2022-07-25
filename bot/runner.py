import datetime
import logging

import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

import telegram_helper

# Set up logging
logging.basicConfig(
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s", level=logging.INFO
)

logger = logging.getLogger(__name__)
# logging.basicConfig(
#     filename=config.LOGFILE,
#     level=logging.INFO,
#     format="%(asctime)s %(levelname)-8s %(message)s",
#     datefmt="%Y-%m-%d %H:%M:%S",
# )

# Database configuration
if not firebase_admin._apps:
    cred = credentials.Certificate("serviceAccountKey.json")
    firebase_admin.initialize_app(cred)

db = firestore.client()


def get_projects_due_today(db, today):
    projects_ref = db.collection("deadline")
    query_ref = projects_ref.where("deadline", "==", today)
    return query_ref


def get_projects_due_tomorrow(db, tomorrow):
    projects_ref = db.collection("deadline")
    query_ref = projects_ref.where("deadline", "==", tomorrow)
    return query_ref


def get_meetings_for_today(db, today):
    meetings_ref = db.collection("deadline")
    query_ref = meetings_ref.where("deadline", "==", today)
    return query_ref


def get_meetings_for_tomorrow(db, tomorrow):
    meetings_ref = db.collection("deadline")
    query_ref = meetings_ref.where("deadline", "==", tomorrow)
    return query_ref


def main():

    # 2. Read database to get meeting timings and project deadlines.
    # 3. See if tomorrow / today has a meeting / is a deadline.
    today = datetime.datetime.today()
    tomorrow = datetime.datetime.today() + datetime.timedelta(days=1)
    projects_due_today = get_projects_due_today(db, today).get()
    projects_due_tomorrow = get_projects_due_today(db, tomorrow).get()
    meetings_for_today = get_meetings_for_today(db, today).get()
    meetings_for_tomorrow = get_meetings_for_tomorrow(db, tomorrow).get()

    # test
    for project in projects_due_today:
        print("{} => {}".format(project.id, project.to_dict()))

    for meeting in meetings_for_tomorrow:
        print("{} => {}".format(meeting.id, meeting.to_dict()))

    print(meetings_for_tomorrow)

    #  4. For all meetings and project deadlines, notify group ad include template message.
    if projects_due_today:
        bot = telegram_helper.TelegramFacade()
        message = "Project is due today"
        response = bot.send_message(message)
        logging.info(response)
    else:
        bot = telegram_helper.TelegramFacade()
        response = bot.send_message(
            "[Project Deadline Reminder] \n Project: Orbital Milestone 3 \n 25 July 2022"
        )
        logging.info(response)

    if projects_due_tomorrow:
        bot = telegram_helper.TelegramFacade()
        message = "Project is due tomorrow"
        response = bot.send_message(message)
        logging.info(response)

    if meetings_for_today:
        bot = telegram_helper.TelegramFacade()
        message = "Meeting is scheduled for today"
        response = bot.send_message(message)
        logging.info(response)

    if meetings_for_tomorrow:
        bot = telegram_helper.TelegramFacade()
        message = "Meeting is scheduled for tomorrow"
        response = bot.send_message(message)
        logging.info(response)


if __name__ == "__main__":
    main()
