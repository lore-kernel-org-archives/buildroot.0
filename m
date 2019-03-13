From: yann.morin at orange.com <yann.morin@orange.com>
Date: Wed, 13 Mar 2019 16:09:27 +0100
Subject: [Buildroot] add two user
In-Reply-To: <CAOqJNTcsbw9bHCgEO7YAZJFBe_=5JDR1j1KVoZUnKCU8V_BBWQ@mail.gmail.com>
References: <CAOqJNTcsbw9bHCgEO7YAZJFBe_=5JDR1j1KVoZUnKCU8V_BBWQ@mail.gmail.com>
Message-ID: <24542_1552489771_5C891D2B_24542_13_3_20190313150927.GD3315@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

??????, All,

On 2019-03-13 15:31 +0200, ?????? ????? spake thusly:
> Hello, people. I want to add two user in my system. One user added successful. I added second user to user table. First user
> created, but second user doesn't created.
> my user table
> user 8000 ntc 2000 =useruser /home/user /usr/bin/sh dialout,input user
> dev 8001 dev 2001 =userdev /home/dev /usr/bin/sh sudo dev user

Can you check that your device table is correctly terminated with a
proper \n ?

Some editors will incorrectly omit the last \n when saving text files.

Regards,
Yann E. MORIN.

> Regards,
> Sakhno Serhii

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
