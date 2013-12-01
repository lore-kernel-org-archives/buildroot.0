From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Dec 2013 23:47:48 +0100
Subject: [Buildroot] [PATCH 00/15] Improvements to x86 bootloaders,
	and x86 boards support
In-Reply-To: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 Nov 2013 17:47:24 +0100")
References: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vbz8tch7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > This commit brings a number of improvements into the world of x86
 > bootloaders, and adds support for two x86 boards.

 > In details:

 >  * It improves the existing 'grub' package by making sure that we can
 >    build a 32 bits Grub even if the selected target architecture is
 >    x86-64. This is done by using the host compiler. It also makes
 >    various other improvements to the 'grub', and especially adds a
 >    HOWTO in the Config.in help text to explain how to install Grub
 >    into a disk image, and test it under Qemu.

Committed part 1..10, thanks!

-- 
Bye, Peter Korsgaard
