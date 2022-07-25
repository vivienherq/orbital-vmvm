import os

import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Sets the log file to the path provided or defaults to the tmp folder.
LOGFILE = os.environ.get("LOGFILE", "/tmp/birfdaylog")


# Database configuration
cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

# Telegram constants
TELEGRAM_TOKEN = "5461195092:AAGmJL6K4mpD8Uh47xBZUzbqO-1sD4Ss-G4"
# TELEGRAM_TOKEN = os.environ.get("TELEGRAM_TOKEN")
TELEGRAM_CHAT_ID = -605619926  # 68142582
# TELEGRAM_CHAT_ID = os.environ.get("TELEGRAM_CHAT_ID")
