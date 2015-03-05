From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 21:18:50 +0100
Subject: [Buildroot] [PATCH] linux: clarify kernel configuration entries
In-Reply-To: <1425578112-7407-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1425578112-7407-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20150305211850.0baf2e21@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vivien Didelot,

On Thu,  5 Mar 2015 12:55:12 -0500, Vivien Didelot wrote:
> Since BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE can either be a complete
> .config file or a defconfig file, it can be confusing to the user
> whether to choose BR2_LINUX_KERNEL_USE_DEFCONFIG or
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG.
> 
> To avoid that confusion, clarify Kconfig entry messages for in-tree
> defconfig and custom (def)config files.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
