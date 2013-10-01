From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 21:01:12 +0200
Subject: [Buildroot] [PATCH v3 03/11] libpthread-stubs: move out of x11r7
In-Reply-To: <1380237714-2470-4-git-send-email-spenser@gillilanding.com>
References: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
 <1380237714-2470-4-git-send-email-spenser@gillilanding.com>
Message-ID: <20131001210112.414aed5e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu, 26 Sep 2013 18:21:46 -0500, Spenser Gilliland wrote:

> --- a/package/x11r7/xlib_libpthread-stubs/Config.in
> +++ b/package/libpthread-stubs/Config.in
> @@ -1,4 +1,4 @@
> -config BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
> +config BR2_PACKAGE_LIBPTHREAD_STUBS

This renaming of option should lead to additions to the
Config.in.legacy file.

I think the move makes sense since libpthread-stubs is not part of the
X.org releases (see http://www.x.org/releases/X11R7.7/src/everything/).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
