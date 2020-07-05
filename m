From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jul 2020 15:09:16 +0200
Subject: [Buildroot] [PATCH] arm_foundationv8_defconfig: use
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
In-Reply-To: <20200704140909.1584989-1-masahiroy@kernel.org>
References: <20200704140909.1584989-1-masahiroy@kernel.org>
Message-ID: <20200705150916.03b8e85c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  4 Jul 2020 23:09:09 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> Commit 53ced1f6d3da ("linux: allow the selection of the architecture's
> default configuration") allows us to specify the Linux defconfig cleanly.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
