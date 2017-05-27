From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 17:23:24 +0200
Subject: [Buildroot] [PATCH/next] package/jasper: bump version to 2.0.13
In-Reply-To: <20170527114343.2482-1-bernd.kuhls@t-online.de>
References: <20170527114343.2482-1-bernd.kuhls@t-online.de>
Message-ID: <20170527172324.1609a574@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 May 2017 13:43:43 +0200, Bernd Kuhls wrote:
> Changed _SITE to github, current version is not available from upstream
> website.
> 
> Removed patches applied upstream:
> 
> 0002-Fixed-bugs-due-to-uninitialized-data-in-the-JP2-deco.patch
> https://github.com/mdadams/jasper/commit/e96fc4fdd525fa0ede28074a7e2b1caf94b58b0d
> 
> 0003-Added-a-check-in-the-JP2-encoder-to-ensure-that-the-.patch
> https://github.com/mdadams/jasper/commit/58ba0365d911b9f9dd68e9abf826682c0b4f2293
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...due-to-uninitialized-data-in-the-JP2-deco.patch | 286 ---------------------
>  ...ck-in-the-JP2-encoder-to-ensure-that-the-.patch |  30 ---
>  package/jasper/jasper.hash                         |   2 +-
>  package/jasper/jasper.mk                           |   4 +-
>  4 files changed, 3 insertions(+), 319 deletions(-)
>  delete mode 100644 package/jasper/0002-Fixed-bugs-due-to-uninitialized-data-in-the-JP2-deco.patch
>  delete mode 100644 package/jasper/0003-Added-a-check-in-the-JP2-encoder-to-ensure-that-the-.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
