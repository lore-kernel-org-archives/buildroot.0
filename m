From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Apr 2008 12:59:42 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  popt
In-Reply-To: <20080412095121.C5A183C5A9@busybox.net> (nkukard@uclibc.org's
	message of "Sat\, 12 Apr 2008 02\:51\:21 -0700 \(PDT\)")
References: <20080412095121.C5A183C5A9@busybox.net>
Message-ID: <871w5b2va9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "nkukard" == nkukard  <nkukard@uclibc.org> writes:

 nkukard> Author: nkukard
 nkukard> Date: 2008-04-12 02:51:21 -0700 (Sat, 12 Apr 2008)
 nkukard> New Revision: 21716

 nkukard> Log:
 nkukard> * Added popt

...

 nkukard> Added: trunk/buildroot/package/popt/Config.in
 nkukard> ===================================================================
 nkukard> --- trunk/buildroot/package/popt/Config.in	                        (rev 0)
 nkukard> +++ trunk/buildroot/package/popt/Config.in	2008-04-12 09:51:21 UTC (rev 21716)
 nkukard> @@ -0,0 +1,7 @@
 nkukard> +config BR2_PACKAGE_POPT
 nkukard> +	bool "popt"
 nkukard> +	default n
 nkukard> +	help
 nkukard> +	  Popt is a C library for parsing command line parameters.
 nkukard> +
 nkukard> +	  http://rpm5.org

I was just about to tell you that you've screwed up the URL once more,
but this time it's right it seems ;)

-- 
Bye, Peter Korsgaard
