From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Feb 2014 08:57:56 +0100
Subject: [Buildroot] [PATCH] webkit: disable on < ARMv5t
In-Reply-To: <1392847730-14412-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 19 Feb 2014 23:08:50 +0100")
References: <1392847730-14412-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ob22xlkr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > webkit needs the ARM blx instruction, which is only available on >=
 > ARMv5t, so we have to make sure the webkit package cannot be enabled
 > on < ARMv5t. In order to achieve this, this commit introduces the
 > BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS hidden Config.in knob, which avoids
 > duplicating all over the place the complex architecture dependencies
 > of webkit.

 > Fixes:

 >   http://autobuild.buildroot.org/results/fdf/fdf8bc7660ac251792d0542d2729ea22753d3789/build-end.log

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
