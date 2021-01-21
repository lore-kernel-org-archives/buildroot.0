From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:41:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/vlc: security bump version to
 3.0.12
In-Reply-To: <20210120073900.855895-1-bernd.kuhls@t-online.de>
References: <20210120073900.855895-1-bernd.kuhls@t-online.de>
Message-ID: <20210121224106.2d79a7c1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Jan 2021 08:39:00 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch which was applied upstream, removed md5 hash.
> 
> Security Bulletin: https://www.videolan.org/security/sb-vlc3012.html
> Fixes CVE-2020-26664: https://nvd.nist.gov/vuln/detail/CVE-2020-26664
> 
> Added CPE_ID, cpe:2.3:a:videolan:vlc_media_player is a valid CPE
> identifier for this package:
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&orderBy=2.3&keyword=cpe%3A2.3%3Aa%3Avideolan%3Avlc_media_player&status=FINAL
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...g-header-when-compiling-with-Qt-5.15.patch | 56 -------------------
>  package/vlc/vlc.hash                          | 10 ++--
>  package/vlc/vlc.mk                            |  4 +-
>  3 files changed, 7 insertions(+), 63 deletions(-)
>  delete mode 100644 package/vlc/0011-qt-fix-missing-header-when-compiling-with-Qt-5.15.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
