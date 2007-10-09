From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 9 Oct 2007 21:33:25 +0200
Subject: [Buildroot] [MIPS] toolchain/gcc/Config.in broken
In-Reply-To: <470BD383.4060504@the-hug.org>
References: <470ADDA8.3080105@ruby.dti.ne.jp> <20071009070816.GP20951@aon.at>
	<470B5043.5010606@ruby.dti.ne.jp> <20071009122700.GB15786@aon.at>
	<470B88CC.9040705@ruby.dti.ne.jp> <470BD383.4060504@the-hug.org>
Message-ID: <20071009193325.GR20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 09, 2007 at 08:16:19PM +0100, Elizabeth Oldham wrote:

>The matrix of MIPS ISA and ABIs supported on Linux is:
>(fixed pitch font time)
>
>               o32    n32    n64
>MIPS I         o
>MIPS II        o
>MIPS III       o      o       o
>MIPS IV        o      o       o
>MIPS32(r1)     o
>MIPS32R2       o
>MIPS64(r1)     o      o       o
>MIPS64R2       o      o       o
>
>(blank is not supported)

And eabi looks much like n32 with a little adjustments here and there.
I assume that o64 is supported on any n64 capable target, yes?
Are there any endianess constraints or is this freely chooseable on all
ISAs?

thanks,
