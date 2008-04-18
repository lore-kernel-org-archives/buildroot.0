From: Azra Aiyl <azraiyl@gmail.com>
Date: Fri, 18 Apr 2008 19:12:18 +0200
Subject: [Buildroot] gcj on any platform
Message-ID: <a9067d050804181012h7b686733i4bcfde2cfb9f253e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

While looking through this archive I can see at least 3 persons who
try to compile a gcj (they got no answers). I've tried the same thing
for ppc and i386 but always get the same compile error. While googling
i was able to collect the following statements.

- libgcj needs unicode
- uClibc does not support unicode
- glibc supports unicode
- glibc does not support full statical linking

I conclude from this statements:

- it is currently not possible no build a gcj with uclibc
- nor is it possible to build a statically linked programm with
glibc-gcj and let it run on a platform with uclibc

If anyone here says I'm wrong then I'll try to build it on my own
