From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 22:46:38 +0200
Subject: [Buildroot] [PATCH v3] zynq: document how to use custom
 ps7_init files
In-Reply-To: <1475543396-65164-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1475543396-65164-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20161009224638.2ca451be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Oct 2016 20:09:56 -0500, Matt Weber wrote:
> From: Masahiro Yamada <yamada.masahiro@socionext.com>
> 
> Since U-Boot supported SPL for Zynq boards at v2014.04 release, it
> became much easier to build a system.  At that time, however, users
> still needed to manually copy ps7_init.c/h to the U-Boot source tree
> to generate a working SPL image because ps7_init.c/h output from
> Xilinx tools are not compatible with GPL.
> 
> Later, the license problem was solved when Xilinx tools became able
> to output the GPL-compatible variants (ps7_init_gpl.c/h) as well.
> U-Boot v2015.07 or later includes ps7_init_gpl.c/h for major Zynq
> boards so that users can build a boot image straight away.
> 
> Now Buildroot supports 3 boards (Zedboard, MicroZed, ZC706) without
> any manual intervention.  This is a good thing itself, but commit
> b9cd72cdbfe3 ("zynq_zc706: bump U-Boot to xilinx-v2016.2") entirely
> dropped the information about custom ps7_init files.
> 
> This commit provides up-to-date guidance for how to customize the
> ps7_init files.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> ---
> v2 -> v3
> [Arnout
>  - Moved notice of good build but bad images to top
>  - Updated wording when refering to files
>  - Removed redundant comment on overriding files
>  - Added suggested note on file copy and make clean's affect

I've applied, after reworking a bit some aspects, and tweaking the
formatting.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
