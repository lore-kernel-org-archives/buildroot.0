From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Nov 2014 23:01:37 +0100
Subject: [Buildroot] [PATCH 0/3] Update armadeus_apf9328_defconfig
In-Reply-To: <1415649026-30847-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 10 Nov 2014 20:50:23 +0100")
References: <1415649026-30847-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r3x9l7lq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > Here is a set of patches updating armadeus_apf9328_defconfig. What
 > prompted me to do this series is that this defconfig explicitly uses
 > gcc 4.4.x, but gcc 4.4.x has been marked as deprecated in
 > Buildroot. Therefore, this defconfig is now constantly failing to
 > build in our automated Jenkins setup.

 > In addition to using the default gcc version, two other patches remove
 > the usage of sstrip, and update the kernel to the latest stable
 > version.

 > Note that I don't have the APF9328 platform, so those changes were
 > only built tested. However, knowing that the platform uses an old
 > ARMv4 Freescale, I doubt it's still widely used.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
