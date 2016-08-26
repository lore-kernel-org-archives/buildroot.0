From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 15:37:32 +0200
Subject: [Buildroot] [PATCH] imagemagick: security bump to 7.0.2-9
In-Reply-To: <1472215895-6556-1-git-send-email-peter@korsgaard.com>
References: <1472215895-6556-1-git-send-email-peter@korsgaard.com>
Message-ID: <20160826153732.475c40ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Aug 2016 14:51:35 +0200, Peter Korsgaard wrote:
> Fixes a number of buffer overflows / use-after-free issues:
> http://git.imagemagick.org/repos/ImageMagick/blob/master/ChangeLog
> 
>   * Prevent buffer overflow in BMP & SGI coders (bug report from
>     pwchen&rayzhong of tencent).
>   * Prevent buffer overflow and other problems in SIXEL, PDB, MAP, TIFF and
>     CALS coders (bug report from Donghai Zhu).
>   * Prevent buffer overflow (bug report from Max Thrane).
>   * Prevent memory use after free (reference
>     https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=30245).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
