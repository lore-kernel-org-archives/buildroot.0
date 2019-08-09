From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Aug 2019 22:06:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: security bump
 version to 7.0.8-59
In-Reply-To: <20190809161915.6401-1-bernd.kuhls@t-online.de>
References: <20190809161915.6401-1-bernd.kuhls@t-online.de>
Message-ID: <20190809220653.5ae0cfcf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  9 Aug 2019 18:19:15 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes
> https://github.com/ImageMagick/ImageMagick/issues/1641 (no CVE id yet)
> https://github.com/ImageMagick/ImageMagick/issues/1644 (no CVE id yet)
> 
> Removed patch included in version 7.0.8-54.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/imagemagick/0001-CVE-2019-13454.patch | 92 -------------------
>  package/imagemagick/imagemagick.hash          |  2 +-
>  package/imagemagick/imagemagick.mk            |  2 +-
>  3 files changed, 2 insertions(+), 94 deletions(-)
>  delete mode 100644 package/imagemagick/0001-CVE-2019-13454.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
