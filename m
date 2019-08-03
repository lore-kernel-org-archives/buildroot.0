From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 08:40:21 +0200
Subject: [Buildroot] [PATCH 1/2] board/friendlyarm: Add support for
 RK3399 NanoPi M4 board
In-Reply-To: <20190422180433.15886-1-shyam.saini@amarulasolutions.com>
References: <20190422180433.15886-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190803084021.1984aec7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Shyam,

On Mon, 22 Apr 2019 23:34:32 +0530
Shyam Saini <shyam.saini@amarulasolutions.com> wrote:

> This initial support includes:
> 	Custom u-boot
> 	Linux v5.1-rc1
> 	ATF v2.0
> 	Buildroot default packages
> 
> Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>

I fixed the commit title, switched to using the final 5.1 kernel, used
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1, and the default ext2
filesystem size. Patch applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
