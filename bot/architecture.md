# Telegram Bot

## Requirements

1. Store data about meeting timings & project deadlines
2. Read data about meetings & projects
3. Understand if tomorrow / today is a deadline / has a meeting
4. Send messages to group via API

## Databases

- Meetings
- Projects

## Happy Path

1. Spin up, read config and instantiate logger.
2. Read database to get meeting timings and project deadlines.
3. See if tomorrow / today has a meeting / is a deadline.
4. For all meetings and project deadlines, notify group ad include template message.
5. Exit.
