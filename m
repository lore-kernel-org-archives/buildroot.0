From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 22:12:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/freerdp: bump version to
 2.0.0-rc2
In-Reply-To: <20180722150517.17857-1-bernd.kuhls@t-online.de>
References: <20180722150517.17857-1-bernd.kuhls@t-online.de>
Message-ID: <20180728221227.52fdb7a9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Jul 2018 17:05:17 +0200, Bernd Kuhls wrote:
> Fixes build with upcoming ffmpeg version 4.0.2.
> 
> Removed 0001-Fix-gstreamer-1.0-detection.patch, applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-Fix-gstreamer-1.0-detection.patch    | 28 -------------------
>  package/freerdp/freerdp.hash                  |  2 +-
>  package/freerdp/freerdp.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 30 deletions(-)
>  delete mode 100644 package/freerdp/0001-Fix-gstreamer-1.0-detection.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
