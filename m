From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 07:59:07 +0200
Subject: [Buildroot] [PATCH V3] board/friendlyarm: Add initial support
 for NanoPc T4 board
In-Reply-To: <20190604075037.10659-1-shyam.saini@amarulasolutions.com>
References: <20190604075037.10659-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190803075907.164f9eea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Shyam,

On Tue,  4 Jun 2019 13:20:37 +0530
Shyam Saini <shyam.saini@amarulasolutions.com> wrote:

> This initial support includes:
> 	Linux 5.1
> 	Custom U-Boot
> 	Arm Trusted Firmware v2.0
> 	Buildroot default packages
> 
> Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
> ---
> Changelogs:
> V1->V2: Use linux 5.1
> 	Add empty line after section header
> 	Add space after # in defconfig
> 	Fix alphabetical order in DEVELOPERS file

I've applied, after fixing the commit title, switching to
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y, and using the default ext2
filesystem size.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
