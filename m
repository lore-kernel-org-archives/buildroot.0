From: =?ISO-8859-2?B?o3VrYXN6IFB1s2th?= <lukasz@oxnet.pl>
Date: Sun, 30 Oct 2011 20:27:24 +0100
Subject: [Buildroot] PKG_CONFIG_PATH question
Message-ID: <CALX2uoNbshTRLzEXYJMOKuKF2WOxks+Q3w5Rz83YXoku3z_ueA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

My name is Luke and I am new here.

After two encouraging sessions about buildroot on ELCE, I decided to
give it a try.
I am usually using OpenEmbedded but just for fun I decided to build
similar image with buildroot, I downloaded buildroot-2011.08.
Compiled my own toolchain with crostool-ng (btw, all new CodeSourcery
arm toolchains have ICE when iwmmxt optimization is enabled). And.. i
get stuck for the while.

For the build system I use quite ancient host machine (slackware),
maybe it causes some problems.

I could not compile libxcb, getting error from configure that
xcb-proto version is less than 1.5 (buildroot is looking for
xcb-proto.pc file (during configure) inside " /usr/lib/pkgconfig/" -
on my build system) is that nomal ?

I could move forward by setting environment variable PKC_CONFIG_PATH
to the STAGING_DIR/usr/lib/pkgconfig/, butI do not like this solution.

Best regards,
Luke Pulka
