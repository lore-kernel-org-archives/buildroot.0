From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 23:39:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: bump to version 2.1.2
In-Reply-To: <20200715205838.22062-1-heiko.thiery@gmail.com>
References: <20200715205838.22062-1-heiko.thiery@gmail.com>
Message-ID: <20200715233903.7d56ffb0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 22:58:38 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> - drop patch included in version
> - update hash file formatting (2 spaces)
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...-utils-Fix-return-value-of-ubiformat.patch | 60 -------------------
>  package/mtd/mtd.hash                          |  6 +-
>  package/mtd/mtd.mk                            |  2 +-
>  3 files changed, 4 insertions(+), 64 deletions(-)
>  delete mode 100644 package/mtd/0001-mtd-utils-Fix-return-value-of-ubiformat.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
