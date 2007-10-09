From: Elizabeth Oldham <beth@the-hug.org>
Date: Tue, 09 Oct 2007 20:42:35 +0100
Subject: [Buildroot] [MIPS] toolchain/gcc/Config.in broken
In-Reply-To: <20071009193325.GR20951@aon.at>
References: <470ADDA8.3080105@ruby.dti.ne.jp> <20071009070816.GP20951@aon.at>
	<470B5043.5010606@ruby.dti.ne.jp> <20071009122700.GB15786@aon.at>
	<470B88CC.9040705@ruby.dti.ne.jp>
	<470BD383.4060504@the-hug.org> <20071009193325.GR20951@aon.at>
Message-ID: <470BD9AB.2020909@the-hug.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Tue, Oct 09, 2007 at 08:16:19PM +0100, Elizabeth Oldham wrote:
> 
> 
>>The matrix of MIPS ISA and ABIs supported on Linux is:
>>(fixed pitch font time)
>>
>>              o32    n32    n64
>>MIPS I         o
>>MIPS II        o
>>MIPS III       o      o       o
>>MIPS IV        o      o       o
>>MIPS32(r1)     o
>>MIPS32R2       o
>>MIPS64(r1)     o      o       o
>>MIPS64R2       o      o       o
>>
>>(blank is not supported)
> And eabi looks much like n32 with a little adjustments here and there.
> I assume that o64 is supported on any n64 capable target, yes?
> Are there any endianess constraints or is this freely chooseable on all
> ISAs?

I'm not familar with eabi, I've not heard of it with reference to MIPS. 
I'd have to ask my more learned colleagues :)
o64 is not supported on Linux, and not going to be AFAIK, but bare-iron 
it would be as gcc can generate the code.
Once you have a supported ISA/ABI you can choose your endian with impunity.

Beth
