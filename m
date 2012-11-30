From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Nov 2012 08:03:04 -0800
Subject: [Buildroot] [PATCH v5 0/6] Add support for the snowball board
In-Reply-To: <1354279156-20649-1-git-send-email-gregory.hermant@calao-systems.com>
 (Gregory Hermant's message of "Fri, 30 Nov 2012 13:39:10 +0100")
References: <1354279156-20649-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <877gp3axjb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gregory" == Gregory Hermant <gregory.hermant@calao-systems.com> writes:

 Gregory> Snowball board is a low power, low cost Single Board Computer based
 Gregory> on the ST-Ericsson Nova A9500 processor (Dual Cortex-A9 + MALI 400 GPU).
 Gregory> More info at www.igloocommunity.org

 Gregory> The snowball board boots from eMMC, loads the linux kernel and mounts
 Gregory> its root filesystem either from eMMC or from a microSD card.
 Gregory> The user should prepare a microSD card with two partitions.
 Gregory> On the fist partition he will install the kernel image and on the second
 Gregory> one the root filesystem.

 Gregory> TO DO:

 Gregory> * Add the GPS support.
 Gregory> * Add the possibility to build an eMMC image directly from buildroot.
 Gregory> * Add the riff tool package

Committed to next, thanks!

-- 
Bye, Peter Korsgaard
