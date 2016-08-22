From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Aug 2016 11:40:16 -0300
Subject: [Buildroot] [PATCH 2/2] configs/pc_x86_64_efi_defconfig: enable
 kernel EFI support
In-Reply-To: <20160822163741.021a7577@free-electrons.com>
References: <20160822015216.425-1-nunes.erico@gmail.com>
 <20160822015216.425-2-nunes.erico@gmail.com>
 <20160822163741.021a7577@free-electrons.com>
Message-ID: <014f0b85214e71fdfe5a9fec8c683273@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-08-22 11:37, Thomas Petazzoni wrote:

> Is a separate linux configuration fragment really needed? Why not just
> enable CONFIG_EFI in the linux-extras.config?
> 
> Yes, it's technically not needed for a BIOS-based configuration, but
> the added size is probably not very significant, and I'm not sure it's
> worth having a separate linux config fragment for that.
> 
> Gustavo?
> 
> Thanks!
> 
> Thomas

Hi.
Indeed, it won't hurt a bit, the main difference between the bios and 
efi defconfigs is the bootloader strategy, so on the kernel side "just 
give it the feature".
Regards.
