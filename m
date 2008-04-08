From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Apr 2008 16:37:13 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  bootutils
In-Reply-To: <20080408130930.75F073C306@busybox.net> (nkukard@uclibc.org's
	message of "Tue\, 8 Apr 2008 06\:09\:30 -0700 \(PDT\)")
References: <20080408130930.75F073C306@busybox.net>
Message-ID: <87wsn8ifae.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "nkukard" == nkukard  <nkukard@uclibc.org> writes:

 nkukard> Author: nkukard
 nkukard> Date: 2008-04-08 06:09:29 -0700 (Tue, 08 Apr 2008)
 nkukard> New Revision: 21671

 nkukard> Log:
 nkukard> * Added bootutils

...

 nkukard> Added: trunk/buildroot/package/bootutils/Config.in
 nkukard> ===================================================================
 nkukard> --- trunk/buildroot/package/bootutils/Config.in	                        (rev 0)
 nkukard> +++ trunk/buildroot/package/bootutils/Config.in	2008-04-08 13:09:29 UTC (rev 21671)
 nkukard> @@ -0,0 +1,11 @@
 nkukard> +config BR2_PACKAGE_BOOTUTILS
 nkukard> +	bool "bootutils"
 nkukard> +	default n
 nkukard> +	help
 nkukard> +	  BootUtils is a collection of utilities to facilitate booting of 
 nkukard> +	  Linux 2.6-based systems. The process of finding the root volume 
 nkukard> +	  either by label or explicit label= on the kernel command line, 
 nkukard> +	  mounting it, and 'switchroot'ing is automated.
 nkukard> +
 nkukard> +	  http://www.freshmeat.net/projects/bootutils

Shouldn't this be http://bootutils.pr.linuxrulz.org/ instead?

-- 
Bye, Peter Korsgaard
