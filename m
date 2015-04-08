From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:32:44 +0200
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: Fix Kodi 14.2 compile
In-Reply-To: <1428524507-30375-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428524507-30375-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150408223244.1d4c9cc4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed,  8 Apr 2015 22:21:46 +0200, Bernd Kuhls wrote:

> diff --git a/package/ffmpeg/0013-add-public-version-of-ff_read_frame_flush.patch b/package/ffmpeg/0013-add-public-version-of-ff_read_frame_flush.patch
> new file mode 100644
> index 0000000..cf07bd2
> --- /dev/null
> +++ b/package/ffmpeg/0013-add-public-version-of-ff_read_frame_flush.patch
> @@ -0,0 +1,54 @@
> +From 7d7ce18ff0d24b586634fa6e631fa0eec7865aae Mon Sep 17 00:00:00 2001
> +From: elupus <elupus@xbmc.org>
> +Date: Tue, 1 Nov 2011 20:18:35 +0100
> +Subject: [PATCH 13/13] add public version of ff_read_frame_flush
> +
> +We need this since we sometimes seek on the
> +input stream behind ffmpeg's back. After this
> +all data need to be flushed completely.
> +
> +Patch part of the XBMC patch set for ffmpeg, downloaded from
> +https://github.com/xbmc/FFmpeg/.
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I am not sure why I am in the SoB here, so I removed myself from here
before applying.


> diff --git a/package/ffmpeg/0013-fix-ff-thread-get-format.patch b/package/ffmpeg/0014-fix-ff-thread-get-format.patch
> similarity index 100%
> rename from package/ffmpeg/0013-fix-ff-thread-get-format.patch
> rename to package/ffmpeg/0014-fix-ff-thread-get-format.patch

Despite this rename, there are still two patches named
014-<something> :-)

Anyway, applied!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
