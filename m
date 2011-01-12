From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 12 Jan 2011 16:43:09 +0100
Subject: [Buildroot] /dev/ttyprinkt usage in BR
Message-ID: <4D2DCC0D.30409@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As of kernel 2.6.37 there is a new pseudo tty device /dev/ttyprinkt, that can make user output through pritnk() routine. How can it be used in BR? What entries should /etc/inittab contain to redirect the console output to /dev/ttyprinkt?

Best regards,
Yegor
