From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 11:56:37 +0200
Subject: [Buildroot] [PATCH] package/uboot-tools: add option to build
 env bin
In-Reply-To: <20200508181304.52228-1-matthew.weber@rockwellcollins.com>
References: <20200508181304.52228-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200509115637.58834f1e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Fri,  8 May 2020 13:13:04 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Add an option to allow the creation of a u-boot environment binary
> from a set of provided source file(s) when the defconfig being built
> does not offer the option via the u-boot package.

I don't understand why we need this, when we already have
BR2_TARGET_UBOOT_ENVIMAGE and related options in U-Boot.

I don't see how the logic behind BR2_TARGET_UBOOT_ENVIMAGE depends on
the defconfig being built.

Could you clarify ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
