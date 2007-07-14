From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 14 Jul 2007 14:28:51 +0200
Subject: [Buildroot] RFC: Building mtd-20061022
In-Reply-To: <1184413844.4954.37.camel@elrond.sweden.atmel.com>
References: <1184413844.4954.37.camel@elrond.sweden.atmel.com>
Message-ID: <1184416131.4954.41.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2007-07-14 klockan 13:50 +0200 skrev Ulf Samuelsson:
> The current default mtd does not support dataflash properly.
> The mtd from 20061022 does a better job but the current mtd.mk
> is incompatible with 20061022 since among other things
> the directory structure has changed.
> 
> This proposed patch will allow the user to select a new build
> script by adding the BR2_PACKAGE_MTD_EXPERIMENTAL config option
> and if set, then 20061022 will be used, if not set,
> then the original mtd build script will be used.
> 
> This will allow people to test the mtd before making
> it a standard part of buildroot.
> 
> Comments?
> 

Forget about this,   will send a new patch shortly.


> 
> Best Regards
> Ulf Samuelsson
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
