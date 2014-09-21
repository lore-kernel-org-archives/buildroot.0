From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:18:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: Bump version to 2.4
In-Reply-To: <1411318552-26581-1-git-send-email-bernd.kuhls@t-online.de>
References: <1411318552-26581-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140921211818.5e35c368@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Sep 2014 18:55:51 +0200, Bernd Kuhls wrote:
> Version 2.3 is unmaintained:
> http://article.gmane.org/gmane.comp.video.ffmpeg.devel/183038
> 
> - removed ffmpeg-0002-bfin.patch, applied upstream
> - added vlc-0004-libav.patch from upstream to fix VLC compilation
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/ffmpeg-0002-bfin.patch |   55 ---------------------------------
>  package/ffmpeg/ffmpeg.mk              |    3 +-
>  package/vlc/vlc-0004-libav.patch      |   22 +++++++++++++
>  3 files changed, 23 insertions(+), 57 deletions(-)
>  delete mode 100644 package/ffmpeg/ffmpeg-0002-bfin.patch
>  create mode 100644 package/vlc/vlc-0004-libav.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
