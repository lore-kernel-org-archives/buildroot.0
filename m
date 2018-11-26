From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 18:03:21 +0100
Subject: [Buildroot] [PATCH 4/6]
 configs/olimex_a20_olinuxino_lime_legacy: use gcc 6.x and not the default
 version
In-Reply-To: <20181122094150.10403-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 22 Nov 2018 10:41:47 +0100")
References: <20181122094150.10403-1-thomas.petazzoni@bootlin.com>
 <20181122094150.10403-4-thomas.petazzoni@bootlin.com>
Message-ID: <87lg5fvkiu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The old 3.4 Linux kernel used by this defconfig doesn't build with gcc 7.x:
 > include/linux/compiler-gcc.h:106:1: fatal error: linux/compiler-gcc7.h: No such file or directory

 > So let's use gcc 6.x for the time being.

 > Long term, we should use a newer or different kernel source for this
 > defconfig, or get rid of the defconfig entirely if there's no updated
 > kernel with a fix.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/123771091

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
