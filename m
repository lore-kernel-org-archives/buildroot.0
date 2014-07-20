From: Ben Widawsky <ben@bwidawsk.net>
Date: Sun, 20 Jul 2014 12:18:27 -0700
Subject: [Buildroot] [PATCH 2/2] xf86-video-intel: Bump version to
	2.99.912
In-Reply-To: <1405661249-6506-2-git-send-email-ben@bwidawsk.net>
Message-ID: <20140720191827.GA10208@bwidawsk.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping by request of patrickdp on IRC.

Note, I have a patch locally which applies to 2.99.912 (Chris' patch
only applied cleanly to master).

There are few options at this point:
1. Merge these two patches.
	This was tested before sending.
2. I can resend with the bump to 2.99.912 as the first patch, and then Chris' wiggled patch.
	I have this currently tested, and running.
3. Redo the patch for 2.99.907
	This is the most logical, but I haven't done it yet. It also
	requires two patches, one for .907, and one for .912 if update
	is desired there.
4. Wait until Chris releases 2.99.913 (or 3.0), and just bump to that.

On Thu, Jul 17, 2014 at 10:27:29PM -0700, Ben Widawsky wrote:
> Warning: I've only built this. Not run it.
> 
> Cc: Bernd Kuhls <berndkuhls@hotmail.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Ben Widawsky <ben@bwidawsk.net>
> ---
>  package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> index 787b8fa..82e6965 100644
> --- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> +++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.907
> +XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.912
>  XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
>  XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
>  XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
> -- 
> 2.0.1
> 
