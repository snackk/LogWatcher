import smtplib
from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText

class GmailReporter(object):

    def __init__(self, email, emailTo, subject, passwd, message):
        self.email = email
      	self.emailTo = emailTo
      	self.subject = subject
      	self.passwd = passwd
      	self.message = message
	self.msg = MIMEMultipart()
    

    def sendEmail(self): 
	self.msg['From'] = self.email
	self.msg['To'] = self.emailTo
	self.msg['Subject'] = self.subject

	body = self.message
	self.msg.attach(MIMEText(body, 'plain'))

	server = smtplib.SMTP('smtp.gmail.com', 587)
	server.starttls()
	server.login(self.email, self.passwd)
	text = self.msg.as_string()
	server.sendmail(self.email, self.emailTo, text)
	server.quit()
