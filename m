From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 14 Sep 2009 15:36:30 +0200
Subject: [Buildroot] Enabling oprofiler package on buildroot-2009.08
 (MIPS cross-compilation)
In-Reply-To: <4345ac050909140626td6ccfd1v945553b80704ae83@mail.gmail.com>
References: <4345ac050909140614i387f8705yaec4c1c52f8152c2@mail.gmail.com>
	<20090914152128.56d8aad2@hcegtvedt.norway.atmel.com>
	<4345ac050909140626td6ccfd1v945553b80704ae83@mail.gmail.com>
Message-ID: <20090914153630.1bfabd3d@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Sep 2009 18:56:07 +0530
Joe tech <joetech20@gmail.com> wrote:

> Thanks for your prompt reply.
> 
> binutils-target is getting built. Only archives (static libraries) getting
> built. Following is a list of binaries that i see in
> toolchain_build_mips_nofpu/binutils-2.19.1-build
> ./libiberty/libiberty.a
> ./bfd/.libs/libbfd.a
> ./bfd/libbfd.a
> ./opcodes/.libs/libopcodes.a
> ./opcodes/libopcodes.a
> Is there are way to get the shared libraries built? I tried enabled
> --enable-shared option without any luck. Do you have any suggestion?
> 

Yes, please do not reply to me only, added the Buildroot list back on
CC.

> I have no clue if this works smooth in current Buildroot.
>

And I'll quote myself ^^^^^^

-- 
Best regards,
Hans-Christian Egtvedt
