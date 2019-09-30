From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:09:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/strace: bump version to 5.3
In-Reply-To: <20190929163845.7382-1-bernd.kuhls@t-online.de>
References: <20190929163845.7382-1-bernd.kuhls@t-online.de>
Message-ID: <20190930230906.5183fedf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 18:38:45 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ts.in-work-around-V4L2_PIX_FMT_BGRA4.patch | 42 -------------------
>  package/strace/strace.hash                    |  4 +-
>  package/strace/strace.mk                      |  2 +-
>  3 files changed, 3 insertions(+), 45 deletions(-)
>  delete mode 100644 package/strace/0001-xlat-v4l2_pix_fmts.in-work-around-V4L2_PIX_FMT_BGRA4.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
