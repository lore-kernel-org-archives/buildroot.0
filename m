From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Jun 2008 09:28:32 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <20080612051430.GD12527@cloud.net.au> (Hamish Moffatt's message
	of "Thu\, 12 Jun 2008 15\:14\:30 +1000")
References: <20080611130704.379E93C65A@busybox.net>
	<20080612051430.GD12527@cloud.net.au>
Message-ID: <87d4mnf6xr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 >> +U_BOOT_ARCH=$(shell echo $(KERNEL_ARCH)|$(HOST_SED_DIR)/bin/sed 's/powerpc/ppc/')

 Hamish> How about
 Hamish> U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)

 Hamish> anyway.. less ugly than calling the shell + sed.

Ah yes, ofcause - Fixed. U-boot supports ARCH=powerpc from 1.3.3 on
though.

-- 
Bye, Peter Korsgaard
