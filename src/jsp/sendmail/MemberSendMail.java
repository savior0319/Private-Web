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
					"C:\\Users\\savio\\Documents\\webworkspace\\web1\\src\\properties\\email.properties"));
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(prop.getProperty("id"), prop.getProperty("password"));
			}
		});
		// System.out.println("??");
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("kh.message.smtp@gmail.com"));//
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail));
			message.setSubject("[KH] 이메일 확인 인증번호가 발급되었습니다");
			message.setText("\n이메일 인증을 완료하기 위해 아래 인증번호를 입력해주세요\n\n인증번호 : [" + authNumber
					+ "]\n\n※ 본 메일은 발신전용 메일입니다.\n기타 문의사항은 고객센터를 이용해주시기 바랍니다");
			// System.out.println("전송 시작");
			Transport.send(message);
			System.out.println("이메일이 성공적으로 보내졌습니다");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
