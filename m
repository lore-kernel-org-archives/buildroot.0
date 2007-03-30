From: Paul Kavan <pkavan@gmail.com>
Date: Fri, 30 Mar 2007 12:58:52 -0600
Subject: [Buildroot] Including AT91 *.h files in arm-linux-gcc
Message-ID: <61c0054e0703301158sdb771a8p9ffa4150289d7de0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All:

I am working on some code that requires me to include some of the
AT91-specific header files (e.g. gpio.h) that are in the
buildroot/build_arm/linux-2.6.20.3/include/asm-arm directory. I am
more of a hardware engineer than a software engineer, so this may seem
basic, but what is the best way to be able to include these files and
the others (e.g. asm/irq.h) without having to specify the paths, which
can get sticky when one *.h gile calls another and so on?

By the way, I am using buildroot configured for an AT91SAM9260.


Thanks.

Paul

-- 
***************************************
Paul David Kavan
Project Engineer
GRH Electronics, Inc.
402-734-4900
pkavan at gmail.com
***************************************
