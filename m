From: Hai Zaar <haizaar@haizaar.com>
Date: Mon, 20 Oct 2008 18:15:04 +0200
Subject: [Buildroot] bug in uclibc.mk in latest tree
Message-ID: <76d9e2a30810200915s327c04a8we682872f5ff60795@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After updating to r23746, make fails with the following:
toolchain/uClibc/uclibc.mk:654: *** extraneous `endif'.  Stop.

It appears that there is extraneous 'endif' at line 559.
-- 
Zaar
