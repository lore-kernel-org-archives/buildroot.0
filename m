From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Jul 2017 09:44:06 +0200
Subject: [Buildroot] [PATCH] uboot: bump to version 2017.07
In-Reply-To: <20170712192903.20486-1-joerg.krause@embedded.rocks>
References: <20170712192903.20486-1-joerg.krause@embedded.rocks>
Message-ID: <20170713094406.4663ab54@windsurf.orange-hotspot.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jul 2017 21:29:03 +0200, J?rg Krause wrote:

> +config BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
> +	bool "U-Boot needs pylibfdt"
> +	select BR2_PACKAGE_HOST_PYTHON
> +	select BR2_PACKAGE_HOST_SWIG

Can be fixed when applying (no need to respin just for that): none of
those two options exist in Buildroot, so selecting them is useless.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
