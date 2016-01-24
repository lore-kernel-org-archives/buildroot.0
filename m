From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 24 Jan 2016 20:12:37 +0100
Subject: [Buildroot] PowerPC64 toolchain not building
In-Reply-To: <20160123150731.1c1db4b0@free-electrons.com>
References: <20160123150731.1c1db4b0@free-electrons.com>
Message-ID: <20160124191236.GQ17143@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello Cody,
> 
> Back in 2014, you added support for PowerPC64 (BE and LE) in Buildroot.
> Today, I wanted to build a PowerPC64 toolchain, and it appears that:
> 
>  * The default configuration (gcc 4.9, binutils 2.24)
>  * gcc 4.9 + binutils 2.25
>  * gcc 5.3 + binutils 2.25
> 
> do not build, all are failing with the following error message during
> the host-gcc-final build:
> 
> /tmp/ccQDkG0a.s: Assembler messages:
> /tmp/ccQDkG0a.s:19: Error: operand out of domain (7 is not a multiple of 2)
> 
> Note that I have only tested BE and not LE, so I don't know if LE is
> also affected or if LE works fine.
> 
> Would you have the possibility to look into this issue ?
> 
> Thanks!

Could you provide a config and full log? I couldn't reproduce it here.

best regards
 Waldemar
