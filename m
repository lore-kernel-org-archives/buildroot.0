From: Charles Krinke <charles.krinke@gmail.com>
Date: Fri, 13 Jul 2012 06:51:34 -0700
Subject: [Buildroot] Qt tribulations take 2
Message-ID: <CALo-6+iZBhkaZJCOG8BLNOGfV36C_ZOHx+-U7hzuArLbrTmN4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let me start over with my Qt question.

I downloaded buildroot-2011.05 and ran several tests, each with "make
clean && make" and each with C++ support checked, both with powerpc
and arm and the results are the same, so either my understanding of
what to click in xconfig is faulty (probable) or there is an issue in
the Qt package scripts. In both cases, I can compile successfully
without Qt checked and in both cases, I get into problems with Qt
checked. I would have expected one of powerpc or arm to successfully
compile and wonder if a suggestion could be made.

You have asked to use pkg-config and are cross-compiling.
Please make sure you have a correctly set-up pkg-config
environment!


This is the Qt for Embedded Linux Open Source Edition.

You are licensed to use this software under the terms of
the Lesser GNU General Public License (LGPL) versions 2.1.
You are also licensed to use this software under the terms of
the GNU General Public License (GPL) versions 3.

Type '3' to view the GNU General Public License version 3.
Type 'L' to view the Lesser GNU General Public License version 2.1.
Type 'yes' to accept this license offer.
Type 'no' to decline this license offer.

Do you accept the terms of either license? yes

Creating qmake. Please wait...
make[1]: Entering directory
`/home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/qmake'
make[1]: c: Command not found
make[1]: [project.o] Error 127 (ignored)
make[1]: c: Command not found
make[1]: [property.o] Error 127 (ignored)



-- 
Charles Krinke
