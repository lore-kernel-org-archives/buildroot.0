From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 28 Sep 2016 14:45:13 +0900
Subject: [Buildroot] [PATCH v2] zynq: document how to use custom
	ps7_init files
In-Reply-To: <1475031612-43682-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1475031612-43682-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CAK7LNAS1Cxr5aovN=BAK2wAje0tZ1NMTVPDyvaw1jdkrOvSX2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

2016-09-28 12:00 GMT+09:00 Matt Weber <matthew.weber@rockwellcollins.com>:
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
> v1 -> v2
>  - Updated readme wording discussed in
>    https://patchwork.ozlabs.org/patch/654309/
>


Thank you very much!


-- 
Best Regards
Masahiro Yamada
