From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 21:30:27 +0200
Subject: [Buildroot] [PATCH/next] configs/pc: add a configuration to
 build a UEFI+GPT image
In-Reply-To: <20180831023155.26475-1-casantos@datacom.com.br>
References: <20180831023155.26475-1-casantos@datacom.com.br>
Message-ID: <20180906213027.2f2e18b2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Aug 2018 23:31:55 -0300, Carlos Santos wrote:
> This is ane example of how to craft a disk image with GPT partitioning
> instead of MBR. This is achieved by means of a post-image script which
> uses mkdosfs+mcopy+sfdisk, since genimage is unable to deal with GPT.
> 
> The script was kept as simple as possible to make it easy to understand
> and adapt for other purposes.
> 
> The root filesystem location is passed to the kernel by a partition
> UUID, so the it is possible to boot on QEMU, directly from the disk
> image, or dump the image to a physical device.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
