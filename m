From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 21:31:56 +0200
Subject: [Buildroot] [PATCH 1/3] configs/zynq_zed: uboot: bump to
 xilinx-v2018.2 (fixes build)
In-Reply-To: <20180828080059.21788-1-luca@lucaceresoli.net>
References: <20180828080059.21788-1-luca@lucaceresoli.net>
Message-ID: <20180906213156.7936ae96@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Aug 2018 10:00:57 +0200, Luca Ceresoli wrote:
> Bump to the most recent Xilinx release.
> 
> Fixes:
>   .../output/host/include/libfdt_env.h:71:30: error: conflicting types for ?fdt64_t?
>   .../output/host/include/libfdt_env.h:91:24: error: expected ?)? before ?x?
>   .../output/host/include/libfdt.h:150:21: error: redefinition of ?fdt_offset_ptr_w?
> ...and many, many other similar errors.
> 
> [Run-time tested]
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  configs/zynq_zed_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

All applied to next. Peter is about to release 2018.08, so I didn't
want to merge into master. The problem anyway affects lots of
defconfigs, and Peter will document it in the CHANGES file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
