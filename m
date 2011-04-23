From: Charles Krinke <charles.krinke@gmail.com>
Date: Sat, 23 Apr 2011 11:51:00 -0700
Subject: [Buildroot] building uclibc with CodeSourcery toolchain
Message-ID: <BANLkTikBDnrcDzAXcynePoojkjaQbLbgSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is there a way to build the uclibc files using the CodeSourcery toolchain?

I am in the midst of reading how the Makefile fit together a little bit,
although I am not a makefile guru by any means, but it seems to me that it
should be possible to use say the CodeSourcery toolchain to trigger a build
of the uclibc .so binaries.

Admiteddly the CodeSourcery toolchain is glibc, but, ... it seems to me that
in a similar way that we build uclibc or glibc root file systems when
buildroot builds its own toolchain, that we should be able to use the
CodeSourcery toolchain to accomplish a similar task.

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110423/084e856b/attachment.html>
