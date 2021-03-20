From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:56:48 +0100
Subject: [Buildroot] [PATCH 3/4] Rename custom kernel defconfig files to
 *_defconfig
In-Reply-To: <20210317222849.1658538-3-masahiroy@kernel.org>
References: <20210317222849.1658538-1-masahiroy@kernel.org>
 <20210317222849.1658538-3-masahiroy@kernel.org>
Message-ID: <20210320225648.5c8d0cb4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Mar 2021 07:28:48 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> There is no consistency in file names for
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE. Some are suffiex with "defconfig",
> and some with ".config".

The *vast* majority of them are named .config. Only three use
-defconfig or _defconfig. Please normalize on .config, not the opposite.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
