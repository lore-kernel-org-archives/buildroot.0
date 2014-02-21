From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Fri, 21 Feb 2014 09:49:32 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140221100842.2d988a70@skate>
References: <20140221073009.2E62F10136B@stock.ovh.net>
 <20140221100842.2d988a70@skate>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356C6E79F@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
> 
> >        arc |                ruby-1.9.3-p484 | NOK |
> http://autobuild.buildroot.net/results/c3d235d4c42f6b256cf3bba7140dae5c7
> bd4d2fd/
> 
> compiling parser.c
> {standard input}: Assembler messages:
> {standard input}:2581: Error: operand out of range (524 is not between -512
> and 511)
> {standard input}:2585: Error: operand out of range (516 is not between -512
> and 511)
> {standard input}:2856: Error: operand out of range (512 is not between -512
> and 511)
> 
> Compiler problem on ARC. Maybe fixed by the bump of the ARC toolchain
> in next. Anton, can you confirm?
> 

Yes, I've just run with "next" and ruby builds successfully.

> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
