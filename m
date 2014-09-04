From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Sep 2014 17:25:02 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: Add optional dependency
	xlib_libXxf86vm
In-Reply-To: <1409773691-13668-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Wed, 3 Sep 2014 21:48:09 +0200")
References: <1409773691-13668-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87wq9jqugh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > xlib_libXxf86vm is an optional dependency for the DRI drivers,
 > quote from mesa3d/configure.ac:

 >     # add xf86vidmode if available
 >     PKG_CHECK_MODULES([XF86VIDMODE], [xxf86vm], HAVE_XF86VIDMODE=yes, HAVE_XF86VIDMODE=no)
 >     if test "$HAVE_XF86VIDMODE" = yes ; then
 >         dri_modules="$dri_modules xxf86vm"
 >     fi

 > Add the package as an optional dependency to have reproducable builds.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
