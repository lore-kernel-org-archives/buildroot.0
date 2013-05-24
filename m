From: Carlo Rajko <carlo.rajko@scen.it>
Date: Fri, 24 May 2013 09:36:11 +0200
Subject: [Buildroot] AT91SAM9G20-EK and aplay
Message-ID: <519F186B.3060606@scen.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have a board AT91SAM9G20-EK Rev C.

With buildroot-2013.02 use kernel 3.1.6 and use toolchain
CODESOURCERY_ARM201203

The kernel detects sound card, but when use prg aplay or use mpg123 to
play a file, receive a "Segmentation fault"

if I run the command "cat file.wav > /dev/dsp" the sound card works fine.

With buildroot-2011.11 is all ok.

Can you help me ?


Best regards,
carlo
