From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:48:23 +0200
Subject: [Buildroot] [PATCH] can-utils: bump version
In-Reply-To: <1437814430-13677-1-git-send-email-yegorslists@googlemail.com>
References: <1437814430-13677-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150726154823.36ec6dd4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Sat, 25 Jul 2015 10:53:50 +0200, Yegor Yefremov wrote:
> Remove upstreamed patches.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  .../0001-log2asc-include-sys-time.h.patch          | 28 ---------------
>  ...Include-linux-sockios.h-to-fix-musl-build.patch | 42 ----------------------
>  package/can-utils/can-utils.mk                     |  2 +-
>  3 files changed, 1 insertion(+), 71 deletions(-)
>  delete mode 100644 package/can-utils/0001-log2asc-include-sys-time.h.patch
>  delete mode 100644 package/can-utils/0002-Include-linux-sockios.h-to-fix-musl-build.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
