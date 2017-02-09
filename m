From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 23:33:23 +0100
Subject: [Buildroot] [PATCH 2/2] u-boot: Add support for Altera mkpimage
 generation
In-Reply-To: <20170130103326.14427-2-lionel@svkt.org>
References: <20170128112720.umcchfeyyc7i6rdo@localhost.localdomain>
 <20170130103326.14427-1-lionel@svkt.org>
 <20170130103326.14427-2-lionel@svkt.org>
Message-ID: <20170209233323.7f57c186@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Jan 2017 11:33:26 +0100, Lionel Flandrin wrote:
> This image format is used by Altera's SoC FPGAs BootROMs.
> 
> Signed-off-by: Lionel Flandrin <lionel@svkt.org>

I missed it on my first review, but it seems like you missed it as
well: we already have some logic in uboot.mk to call mkpimage. See the
BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC option.

This should be extended rather than having two options doing the same
thing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
