From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:39:18 +0100
Subject: [Buildroot] [PATCH] olimex_a20_olinuxino_lime_mali: bump kernel
In-Reply-To: <1478474048-19255-1-git-send-email-francois.perrad@gadz.org>
References: <1478474048-19255-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20161109223918.554ee69e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 Nov 2016 00:14:08 +0100, Francois Perrad wrote:

>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux-sunxi,linux-sunxi,sunxi-v3.4.103-r1)/sunxi-v3.4.103-r1.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/dan-and/linux-sunxi.git"
> +# based on Linux version 3.4.113
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="dbabbacbbf8984dea0a8c893b38b376a6ecbb3c1"

I really dislike using random git trees instead of more officially
recognized ones. There are really no branches/tags in the linux-sunxi
repository that work with gcc 5.x for this board?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
