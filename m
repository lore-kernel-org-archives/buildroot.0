From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 09:39:00 +0200
Subject: [Buildroot] [git commit] uboot: deprecate
 BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
In-Reply-To: <5533CAF5.9020401@mind.be>
References: <20150419090719.42BAD80094@busybox.osuosl.org>
 <5533CAF5.9020401@mind.be>
Message-ID: <20150421093900.6add9a67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sun, 19 Apr 2015 17:34:13 +0200, Arnout Vandecappelle wrote:

> >  config BR2_TARGET_UBOOT_PATCH
> >  	string "Custom U-Boot patches"
> 
>  To make the deprecation smoother, we could add
> 
> 	default BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR

Could you, or Frank, send a patch doing this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
