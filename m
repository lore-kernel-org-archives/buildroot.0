From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Apr 2008 12:11:18 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libbeecrypt
In-Reply-To: <20080409095725.A490A3C4D6@busybox.net> (nkukard@uclibc.org's
	message of "Wed\, 9 Apr 2008 02\:57\:25 -0700 \(PDT\)")
References: <20080409095725.A490A3C4D6@busybox.net>
Message-ID: <87k5j7e3sp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "nkukard" == nkukard  <nkukard@uclibc.org> writes:

 nkukard> Author: nkukard
 nkukard> Date: 2008-04-09 02:57:25 -0700 (Wed, 09 Apr 2008)
 nkukard> New Revision: 21680

 nkukard> Log:
 nkukard> * Added libbeecrypt (requirement for rpm5)

...

 nkukard> Added: trunk/buildroot/package/libbeecrypt/Config.in
 nkukard> ===================================================================
 nkukard> --- trunk/buildroot/package/libbeecrypt/Config.in	                        (rev 0)
 nkukard> +++ trunk/buildroot/package/libbeecrypt/Config.in	2008-04-09 09:57:25 UTC (rev 21680)
 nkukard> @@ -0,0 +1,7 @@
 nkukard> +config BR2_PACKAGE_LIBBEECRYPT
 nkukard> +	bool "libbeecrypt"
 nkukard> +	default n
 nkukard> +	help
 nkukard> +	  Beecrypt is a general-purpose cryptography library.
 nkukard> +
 nkukard> +	  http://rpm5.org

http://beecrypt.sf.net ?

-- 
Bye, Peter Korsgaard
