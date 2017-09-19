import sys
import os

from GmailReporter import GmailReporter

def main(argv):
    message = "A new ssh session was created, check the log bellow.\n" + argv[1]
    email = os.environ["log_email_from"]
    emailTo = os.environ["log_email_to"]
    subject = "Owncloud - New SSH session created"
    passwd = os.environ["log_passwd"]
    
    if message:
    	report = GmailReporter(email, emailTo, subject, passwd, message)
    	report.sendEmail()

if __name__ == "__main__":
    main(sys.argv)
