From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Jul 2018 20:55:15 +0200
Subject: [Buildroot] Bootlin toolchains updated to binutis 2.31
Message-ID: <20180717205515.0b424f58@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have just rebuilt the Bootlin bleeding-edge toolchains with the
recent update of binutils to version 2.31. Only the ARMv7-M, m68k
Coldfire and Xtensa toolchains have not been rebuilt, due to build
issues with binutils 2.31.

In addition, those toolchains include the ncurses fix from Hollis
Blanchard fixing gdb problems.

The toolchains are available at https://toolchains.bootlin.com/.

Thanks to Romain Naour and Hollis Blanchard for the binutils update and
ncurses fix!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
