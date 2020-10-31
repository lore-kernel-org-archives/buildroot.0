From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 23:44:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: bump version to 3.4.2
In-Reply-To: <20201028132338.1545-1-zhaojh329@gmail.com>
References: <20201028132338.1545-1-zhaojh329@gmail.com>
Message-ID: <20201031234420.34efac3c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 28 Oct 2020 21:23:38 +0800
Jianhui Zhao <zhaojh329@gmail.com> wrote:

> fix compile fail on riscv64
> 
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> ---
>  ...rc-uhttpd.c-fix-build-without-dlopen.patch | 35 -------------------
>  package/libuhttpd/libuhttpd.hash              |  2 +-
>  package/libuhttpd/libuhttpd.mk                |  2 +-
>  3 files changed, 2 insertions(+), 37 deletions(-)
>  delete mode 100644 package/libuhttpd/0001-src-uhttpd.c-fix-build-without-dlopen.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
