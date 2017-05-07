From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 07 May 2017 22:27:31 +0200
Subject: [Buildroot] Xorg libs and proto
References: <1494183428.953970867@f205.i.mail.ru>
Message-ID: <jic4udxkgi.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 07 May 2017 21:57:08 +0300 schrieb ONE TWO:

> What libraries and proto depend for xorg-server! Write these names of
> libs and proto! :D

Hi,

the packages xserver_xorg-server depends on are selected by the package:

https://git.buildroot.net/buildroot/tree/package/x11r7/xserver_xorg-
server/Config.in

Regards, Bernd
