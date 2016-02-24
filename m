From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 23:45:08 +0100
Subject: [Buildroot] [PATCH 0/9] Olimex A20 OlinuXino updates
In-Reply-To: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Tue, 23 Feb 2016 01:24:24 +0100")
References: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87si0hybgr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Hi,
 > here's a series of updates to the Olimex OlinuXino A20 board support
 > in Buildroot.

 > Patches 1 and 5 are just cleanups.

 > Patches 2-4 revive the -MICRO board by upgrading the kernel and U-Boot
 > and enabling DHCP autoconfiguration.

 > Patch 6 enables genimage to generate an SD card image. It also
 > documents how to write the SD, but the old, manual SD writing
 > instructions are not removed since they are still needed for the -LIME
 > and -LIME2 boards.

 > Everything up to here is build- and run-time tested. Following patches
 > are build-tested only since I don't own these boards.

 > Patches 7 and 8 enable genimage for the other two boards, and patch 9
 > removes the manual SD card writing instructions.

 > Francois, Jan, or anybody having acces to these boards, if you could
 > test patches 7 and 8 report whether they work, you would help in
 > making simpler and more uniform the support for the whole family of
 > boards. Thanks!

Committed the rest of the series to next, thanks.

-- 
Bye, Peter Korsgaard
