package jsp.sendmail;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class MemberSendMail {

	private Properties prop = new Properties();

	public void sendMail(String mail, int authNumber) {

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "25");
		props.put("mail.debug", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.EnableSSL.enable", "true");
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "true");
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");

		try {
			prop.load(new FileReader(
					"C:\\Users\\user1\\Documents\\webworkspace\\web2\\src\\properties\\email.properties"));
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(prop.getProperty("id"), prop.getProperty("password"));
			}
		});
		System.out.println("??");
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("kh.message.smtp@gmail.com"));//
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail));
			message.setSubject("-- 인증번호 입니다 --");
			message.setText("인증번호 : [" + authNumber + "]");
			System.out.println("sendstart");
			Transport.send(message);
			System.out.println("SEND");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
