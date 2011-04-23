From: Charles Krinke <charles.krinke@gmail.com>
Date: Sat, 23 Apr 2011 13:01:36 -0700
Subject: [Buildroot] barking up a different tree
Message-ID: <BANLkTi=EYF+b=d-LdM=bPXzaZ-7oZh-87A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maybe I am barking up the wrong tree.

Being able to do "make clean" and *not* have to re-compile the uclibc
toolchain would get buildroot to an acceptable point for the uclibc part of
my project.

Would I be correct in assuming that removing "$(TOOLCHAIN_DIR) from the
Makefile clean target would get to a place where I can do "make clean &&
make" and still have the previously compiled uclibc toolchain?

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110423/84526b7d/attachment.html>
