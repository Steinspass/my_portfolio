
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class SendEmailManager{

  final String name;
  final String email;
  final String message;

  const SendEmailManager({
    this.name,
    this.email,
    this.message
  });

  launchMailto() async {
    final mailToLink = Mailto(
      to: ['naimdridideveloper@gmail.com'],
      cc: ['$email'],
      subject: 'Project request for $name',
      body: message,
      validate: MailtoValidate.never
    );

    await launch('$mailToLink');

  }


}