From: Sergey Naumov <sknaumov@gmail.com>
Date: Tue, 28 Dec 2010 11:10:00 +0300
Subject: [Buildroot] gcc-4.4.5-target unworkable
Message-ID: <AANLkTi=c_x+k8Oe+UBwVvQnAF6geYV2nevy8Ea7mLN_t@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

I want to ask whether someone tested BR2_HAVE_DEVFILES option for
buildroot-2010.11? I make gcc-4.4.5-target compile with correcting
TARGET_CFLAGS to use -isystem instead of -I, but now it seems that
compiler and linker do not look for headers/libraries in standard
places like /usr/include, /usr/lib, /lib and so on: compiler can
include <stdio.h> for helloworld only with -I/usr/include provided and
linker complains that "this linker was not configured to use
sysroots". Have anybody some clue about it?

Thanks in advance,

Sergey Naumov.
