From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:43:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to
 0.19.2
In-Reply-To: <20190930205809.18639-1-bernd.kuhls@t-online.de>
References: <20190930205809.18639-1-bernd.kuhls@t-online.de>
Message-ID: <20191002214309.29efe17c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Sep 2019 22:58:09 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog:
> http://stellarium.org/release/2019/09/29/stellarium-0.19.2.html
> 
> Removed all patches applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...iling-with-GPSD-3.19-API-8.0-fix-733.patch | 36 -----------------
>  .../0002-A-tiny-fix-for-previous-commit.patch | 29 --------------
>  ...-get-Spherical-Position-Error-issue-.patch | 39 -------------------
>  package/stellarium/stellarium.hash            |  6 +--
>  package/stellarium/stellarium.mk              |  2 +-
>  5 files changed, 4 insertions(+), 108 deletions(-)
>  delete mode 100644 package/stellarium/0001-Fixed-compiling-with-GPSD-3.19-API-8.0-fix-733.patch
>  delete mode 100644 package/stellarium/0002-A-tiny-fix-for-previous-commit.patch
>  delete mode 100644 package/stellarium/0003-Comment-code-for-get-Spherical-Position-Error-issue-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
