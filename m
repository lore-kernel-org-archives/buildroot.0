From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Nov 2008 14:18:20 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/pciutils
In-Reply-To: <20081031121440.1F41B3C831@busybox.net> (correa@uclibc.org's
	message of "Fri\, 31 Oct 2008 05\:14\:40 -0700 \(PDT\)")
References: <20081031121440.1F41B3C831@busybox.net>
Message-ID: <87tzaq1d2b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "correa" == correa  <correa@uclibc.org> writes:

 correa> Author: correa
 correa> Date: 2008-10-31 05:14:39 -0700 (Fri, 31 Oct 2008)
 correa> New Revision: 23880

 correa> Log:
 correa> Improve pciutils based on Bernhard Reutner-Fischer's git repository (http://repo.or.cz/w/buildroot.git?a=tree;f=package/pciutils;hb=HEAD). Thanks

A better log message would probably be:

pciutils: fix build without zlib.

 correa>  config BR2_PACKAGE_PCIUTILS
 correa>  	bool "pciutils"
 correa> -	depends on BR2_PACKAGE_ZLIB
 correa> +	default n

'n' is default in Kconfig, so don't add it here.

-- 
Bye, Peter Korsgaard
