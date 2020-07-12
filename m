From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 23:13:43 +0200
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.5.1
In-Reply-To: <20200630220714.432660-1-giulio.benetti@benettiengineering.com>
References: <20200630220714.432660-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200712231343.756f38f1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  1 Jul 2020 00:07:14 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Bump to version 2.5.1 and remove local already upstreamed patch.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../0001-nfs-utils-print-time-in-64-bit.patch | 84 -------------------
>  package/nfs-utils/nfs-utils.hash              |  4 +-
>  package/nfs-utils/nfs-utils.mk                |  2 +-
>  3 files changed, 3 insertions(+), 87 deletions(-)
>  delete mode 100644 package/nfs-utils/0001-nfs-utils-print-time-in-64-bit.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
