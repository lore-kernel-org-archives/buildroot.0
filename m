From: Simon Pasch <fpasch@googlemail.com>
Date: Fri, 24 Aug 2007 15:38:01 +0200
Subject: [Buildroot] configure is never called from Makefile.autotools.in
Message-ID: <f90898420708240638w6f3ed01bld3aee41bacf00374@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

x11r7-building fails with current snapshot because of commit 19657
(Makefile.autotools.in)

"if $(PKG)_SKIP_CONFIGURE is non-empty then ./configure is skipped"
doesn't seem to work.

Instead ./configure is never called...Although I tried playing around
with the variable LIBXCB_SKIP_CONFIGURE, etc.


Just by the way...You do a great job here...Fast and reliable. It is a
pleasure to work with buildroot, uclibc, busybox!
