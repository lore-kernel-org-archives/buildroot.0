From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 Apr 2010 12:15:44 +0200
Subject: [Buildroot] [PATCH 3/7] Remove XFree86-Misc (lib & proto) as
	removed from X11R7.5
In-Reply-To: <1271264806-23336-4-git-send-email-will_wagner@carallon.com>
	(Will Wagner's message of "Wed, 14 Apr 2010 18:06:42 +0100")
References: <1271264806-23336-1-git-send-email-will_wagner@carallon.com>
	<1271264806-23336-4-git-send-email-will_wagner@carallon.com>
Message-ID: <87bpdb7pyn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> Signed-off-by: Will Wagner <will_wagner@carallon.com>
 Will> ---
 Will>  package/x11r7/Config.in                            |    2 --
 Will>  package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk       |    2 +-
 Will>  .../xdriver_xf86-video-ati.mk                      |    2 +-
 Will>  .../xdriver_xf86-video-sis.mk                      |    2 +-
 Will>  .../xdriver_xf86-video-sisusb.mk                   |    2 +-
 Will>  package/x11r7/xlib_libXxf86misc/Config.in          |    8 --------
 Will>  .../x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk   |   15 ---------------
 Will>  package/x11r7/xproto_xf86miscproto/Config.in       |    4 ----
 Will>  .../xproto_xf86miscproto/xproto_xf86miscproto.mk   |   14 --------------
 Will>  9 files changed, 4 insertions(+), 47 deletions(-)
 Will>  delete mode 100644 package/x11r7/xlib_libXxf86misc/Config.in
 Will>  delete mode 100644 package/x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk
 Will>  delete mode 100644 package/x11r7/xproto_xf86miscproto/Config.in
 Will>  delete mode 100644 package/x11r7/xproto_xf86miscproto/xproto_xf86miscproto.mk

Looks good, except that you forgot to remove the selects from the
affected Config.in's as well - I've fixed that and committed.

-- 
Bye, Peter Korsgaard
