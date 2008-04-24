From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 21:00:22 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libiconv vlc
In-Reply-To: <20080424183544.47A0A3C84F@busybox.net> (ninevoltz@uclibc.org's
	message of "Thu\, 24 Apr 2008 11\:35\:44 -0700 \(PDT\)")
References: <20080424183544.47A0A3C84F@busybox.net>
Message-ID: <87mynj13jt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

 ninevoltz> Author: ninevoltz
 ninevoltz> Date: 2008-04-24 11:35:44 -0700 (Thu, 24 Apr 2008)
 ninevoltz> New Revision: 21850

 ninevoltz> Log:
 ninevoltz> add libiconv and framework for vlc

Please don't check in unrelated stuff in the same commit.

 ninevoltz> Added:
 ninevoltz>    trunk/buildroot/package/libiconv/
 ninevoltz>    trunk/buildroot/package/libiconv/Config.in
 ninevoltz>    trunk/buildroot/package/libiconv/libiconv.mk
 ninevoltz>    trunk/buildroot/package/vlc/
 ninevoltz>    trunk/buildroot/package/vlc/Config.in
 ninevoltz>    trunk/buildroot/package/vlc/vlc.mk

 ninevoltz> Modified:
 ninevoltz>    trunk/buildroot/package/Config.in

 ninevoltz> Added: trunk/buildroot/package/vlc/Config.in
 ninevoltz> ===================================================================
 ninevoltz> --- trunk/buildroot/package/vlc/Config.in	                        (rev 0)
 ninevoltz> +++ trunk/buildroot/package/vlc/Config.in	2008-04-24 18:35:44 UTC (rev 21850)
 ninevoltz> @@ -0,0 +1,7 @@
 ninevoltz> +config BR2_PACKAGE_VLC
 ninevoltz> +	bool "vlc"
 ninevoltz> +	default n
 ninevoltz> +	help
 ninevoltz> +	  a free cross-platform media player
 ninevoltz> +
 ninevoltz> +	  http://download.videolan.org/pub/videolan/vlc/0.8.6e

http://www.videolan.org is probably a better link.

-- 
Bye, Peter Korsgaard
