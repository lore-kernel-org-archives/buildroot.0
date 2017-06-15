From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 15 Jun 2017 08:36:36 +0200
Subject: [Buildroot] [PATCH] configs/pc_x86_64_{bios,
	efi}_defconfig: unbreak after qemu bump to linux-4.11
In-Reply-To: <20170614213604.10067-1-peter@korsgaard.com>
References: <20170614213604.10067-1-peter@korsgaard.com>
Message-ID: <FE617696-0325-4F4C-B91C-38CCE98C76B6@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Am 14.06.2017 um 23:36 schrieb Peter Korsgaard <peter@korsgaard.com>:
> 
> The pc_x86_64 defconfigs reuse the linux configuration from qemu_x86_64, ..

Wouldn't it be better to decouple the usage of the configs. I find it not obvious that they share the same kernel config.

Best regards
 Waldemar 
