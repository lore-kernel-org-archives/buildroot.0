From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 30 Mar 2007 21:12:27 +0200
Subject: [Buildroot] Including AT91 *.h files in arm-linux-gcc
References: <61c0054e0703301158sdb771a8p9ffa4150289d7de0@mail.gmail.com>
Message-ID: <010e01c772ff$6bf3b870$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Paul Kavan" <pkavan@gmail.com>
To: <buildroot@uclibc.org>
Sent: Friday, March 30, 2007 8:58 PM
Subject: [Buildroot] Including AT91 *.h files in arm-linux-gcc


> Hello All:
> 
> I am working on some code that requires me to include some of the
> AT91-specific header files (e.g. gpio.h) that are in the
> buildroot/build_arm/linux-2.6.20.3/include/asm-arm directory. I am
> more of a hardware engineer than a software engineer, so this may seem
> basic, but what is the best way to be able to include these files and
> the others (e.g. asm/irq.h) without having to specify the paths, which
> can get sticky when one *.h gile calls another and so on?
> 
> By the way, I am using buildroot configured for an AT91SAM9260.
> 
> 
> Thanks.
> 
> Paul
> 

You would be better off taking the linux-2.4.6.20 and applying my patch
from www.at91.com Project AT91 buildroot

I think that adding the directory is the proper way to do things.
Other people may disagree



Best Regards
Ulf Samuelsson
