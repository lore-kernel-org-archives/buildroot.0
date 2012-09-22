From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Sep 2012 21:39:43 +0200
Subject: [Buildroot] Upgrade of the Xorg-server to newest version
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk> (Allan W. Nielsen's
 message of "Wed, 6 Apr 2011 12:03:14 +0200")
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <87a9whc0e8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Allan" == Allan W Nielsen <a@awn.dk> writes:

Hi,

 Allan> This patch series upgrades the XorgServer and all the xlibs +
 Allan> xprotos to newest version. For test purposes I have also
 Allan> upgraded the ATI driver to its newest version, it might be
 Allan> necessary to upgrade the remaining part of the x drivers.  To
 Allan> solve compilation errors it was necessary to upgrade the udev
 Allan> daemon, here I have chosen version 151 (newest version is
 Allan> 167). The only reason for this is that 151 is the default
 Allan> version on my system, and therefor I knew this version could
 Allan> play well together with the remaining components.

Better late than never - Committed with minor changes, thanks!

-- 
Bye, Peter Korsgaard
