From: Marcel <korgull@home.nl>
Date: Sun, 16 May 2010 15:51:54 +0200
Subject: [Buildroot] uClibc errors
Message-ID: <201005161551.55321.korgull@home.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have one system set up with a fully working buildroot and try to build the 
same on another but run into some issues with uClibc.

I have tried the daily snapshot of uClibc and versions 0.9.29 and 0.9.30 but 
none of them compiles.

Since I don't want the daily snapshot I would like to fix my setup to version 
0.9.30 but I get an error while compiling :

make[1]: Entering directory 
`/home/marcel/arm/toolchain_build_arm/uClibc-0.9.30'
  AS lib/crt1.o
cc1: error: bad value (ap) for -march= switch

Any ideas on this ?

Best regards,
Marcel
