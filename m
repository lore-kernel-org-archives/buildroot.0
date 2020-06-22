From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 21:37:06 +0200
Subject: [Buildroot] [PATCH 1/1] fuse-overlayfs: fix build with musl
In-Reply-To: <20200622175955.256750-1-asafka7@gmail.com>
References: <20200622175955.256750-1-asafka7@gmail.com>
Message-ID: <20200622213706.59181df0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Jun 2020 20:59:55 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/57d/57d6f6bcbf3c0f8761c924f8a69c71dee05dd6c3//
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  ...1-direct.c-fix-compilation-with-musl.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/fuse-overlayfs/0001-direct.c-fix-compilation-with-musl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
