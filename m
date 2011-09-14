From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 14 Sep 2011 10:39:38 +0200
Subject: [Buildroot] [PATCH 2/2] u-boot: build signed image for OMAP
	processors
In-Reply-To: <0ff71aac702ca25e3bc08f5749fd98e3@zacarias.com.ar>
References: <1315934373-16561-1-git-send-email-luca@lucaceresoli.net>
 <1315934373-16561-2-git-send-email-luca@lucaceresoli.net>
 <0ff71aac702ca25e3bc08f5749fd98e3@zacarias.com.ar>
Message-ID: <4E70684A.5050205@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo Zacarias wrote:
...
>> +config BR2_TARGET_UBOOT_OMAP_IFT
>> + depends on BR2_TARGET_UBOOT_FORMAT_BIN
>> + select BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS
>> + bool "produce a .ift signed image (OMAP)"
>> + help
>> + Use gpsign to produce an image of u-boot.bin signed with
>> + a Configuration Header for booting on OMAP processors.
>
> Maybe make it depend on BR2_ARCH = arm || armeb to avoid pointless
> options for other architectures?

Right, will do.

Thanks,
Luca
