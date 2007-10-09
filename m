From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 9 Oct 2007 18:30:49 +0200
Subject: [Buildroot] [MIPS] toolchain/gcc/Config.in broken
In-Reply-To: <470B88CC.9040705@ruby.dti.ne.jp>
References: <470ADDA8.3080105@ruby.dti.ne.jp> <20071009070816.GP20951@aon.at>
	<470B5043.5010606@ruby.dti.ne.jp> <20071009122700.GB15786@aon.at>
	<470B88CC.9040705@ruby.dti.ne.jp>
Message-ID: <20071009163049.GA16889@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 09, 2007 at 10:57:32PM +0900, Shinya Kuribayashi wrote:
> Bernhard Fischer wrote:
>>> [1] mips: Before recently toolchain config rework (2007-09-19 build)
> <snip>
>> I don't know offhand what abi that defaults to. Can you check this,
>> perhaps?
>
> Yes, confirmed with r19885 (2007-09-18).
> At that time, we used to configure ABI and ISA as a uClibc config,
> right? I always configured O32 ABI and MIPS32, no doubt:

> But it seems these configs were not directly passed to GCC configs
> according to mips-linux-gcc -v, or GCC config.status.

Yes, that's what my recent changes in this area are ment to pin.

Please use 32 manually for now. I'll look at it ASAP.
