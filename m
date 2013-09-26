From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Sep 2013 22:28:10 +0200
Subject: [Buildroot] [PATCH] Allow Buildroot to update toolchain
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C639AD62E9@ex-mb1.corp.adtran.com>
 (ANDY KENNEDY's message of "Thu, 26 Sep 2013 20:12:09 +0000")
References: <F9C551623D2CBB4C9488801D14F864C639AD62E9@ex-mb1.corp.adtran.com>
Message-ID: <87vc1n49b9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ANDY" == ANDY KENNEDY <ANDY.KENNEDY@adtran.com> writes:

 ANDY> Sometimes it is useful to self contain a toolchain.  To do this, one
 ANDY> must somehow build in the extra libraries needed to make the toolchain
 ANDY> complete.  This patch adjusts Buildroot to, by configuration, modify the
 ANDY> external toolchain while building additional libraries.

I'm not sure I understand the use case here. How is it different that
setting BR2_HOST_DIR to something, do a build and then use the toolchain
in BR2_HOST_DIR/usr/bin outside buildroot?

-- 
Bye, Peter Korsgaard
