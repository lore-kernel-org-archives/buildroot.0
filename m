From: Alejandro <alejandro.gonzalez.correo@gmail.com>
Date: Sun, 30 Aug 2020 22:59:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/watchdog: new package
In-Reply-To: <20200829143536.6e7e0ce5@windsurf.home>
References: <20200808214815.1358140-1-alejandro.gonzalez.correo@gmail.com>
 <20200829143536.6e7e0ce5@windsurf.home>
Message-ID: <CA+wirGpaEVKoF9_HBzaieTLwusVpBSY16XCM1wPwXqcwus25qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El s?b., 29 ago. 2020 a las 9:14, Asaf Kahlon (<asafka7@gmail.com>) escribi?:
> Why does AUTORECONF is needed?

It is not. I added it by mistake, sorry about that!

El s?b., 29 ago. 2020 a las 14:35, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
> Thanks, I've applied to next. I've handled the potential conflict with
> Busybox, which also has a "watchdog" applet.
> I've also addressed the comments from Asaf about the DEVELOPERS entry
> and the AUTORECONF =3D YES, but I forgot to do that initially, so I did
> follow-up commits for these.

Thank you very much for the extra changes. Next time I add a package
I will remember adding a DEVELOPERS entry :)

Cheers!
