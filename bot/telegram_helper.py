import telegram
from telegram import Bot

import config


class TelegramFacade(object):
    def __init__(self, token=config.TELEGRAM_TOKEN, cid=config.TELEGRAM_CHAT_ID):
        self.token = token
        self.chat_id = cid
        self.client = Bot(self.token)

    def send_message(self, message):
        return self.client.send_message(
            self.chat_id, message, parse_mode=telegram.ParseMode.HTML
        )
