From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Mar 2008 22:41:59 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package:  synergy
In-Reply-To: <20080306182658.BD6E412028A@busybox.net> (ninevoltz@uclibc.org's
	message of "Thu\, 6 Mar 2008 10\:26\:58 -0800 \(PST\)")
References: <20080306182658.BD6E412028A@busybox.net>
Message-ID: <87r6enedi0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

Hi,

 ninevoltz> Changeset:
 ninevoltz> Added: trunk/buildroot/package/synergy/Config.in
 ninevoltz> ===================================================================
 ninevoltz> --- trunk/buildroot/package/synergy/Config.in	                        (rev 0)
 ninevoltz> +++ trunk/buildroot/package/synergy/Config.in	2008-03-06 18:26:58 UTC (rev 21232)
 ninevoltz> @@ -0,0 +1,11 @@
 ninevoltz> +config BR2_PACKAGE_SYNERGY
 ninevoltz> +	bool "synergy"
 ninevoltz> +	default n
 ninevoltz> +	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
 ninevoltz> +	help
 ninevoltz> +	  Synergy lets you easily share a single mouse and keyboard between multiple computers with different operating systems, each with its own display, without special hardware.

Sane line lengths please.

-- 
Bye, Peter Korsgaard
