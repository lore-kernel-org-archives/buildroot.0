From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:26:54 +0200
Subject: [Buildroot] [PATCH] package/swupdate: bump version to 2020.04
In-Reply-To: <20200627174116.130018-1-offougajoris@gmail.com>
References: <20200627174116.130018-1-offougajoris@gmail.com>
Message-ID: <20200714152654.74137e8a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 27 Jun 2020 19:41:16 +0200
Joris Offouga <offougajoris@gmail.com> wrote:

> See full changelog : https://github.com/sbabic/swupdate/releases/tag/2020.04
> 
> Also:
> Drop select BR2_PACKAGE_UBOOT_TOOLS, since commit https://github.com/sbabic/swupdate/commit/82a157e35e9d01599e3c5818caa568899c17e6d2
> ,swupdate only support libubootenv
> 
> Regenarated the default .config
> 
> Signed-off-by: Joris Offouga <offougajoris@gmail.com>
> ---
>  package/swupdate/Config.in       | 4 +---
>  package/swupdate/swupdate.config | 4 +++-
>  package/swupdate/swupdate.hash   | 2 +-
>  package/swupdate/swupdate.mk     | 9 +++------
>  4 files changed, 8 insertions(+), 11 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
