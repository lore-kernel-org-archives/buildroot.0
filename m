From: MikeW <mw_phil@yahoo.co.uk>
Date: Thu, 30 Nov 2006 10:20:06 +0000 (UTC)
Subject: [Buildroot] Impossible to build EABI ARM gcc toolchain using
	Buildroot ? +
References: <loom.20061129T130728-811@post.gmane.org>
Message-ID: <loom.20061130T111842-62@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MikeW <mw_phil@...> writes:

> 
> gcc-3.4.3
> binutils-2.16.91.0.7
> buildroot-20061031
> 
> Target Architecture: arm
> Target Architecture Variant: arm926t
> Target ABI: EABI
> Build Options: GNU Target Suffix: ????
> Toolchain options: Kernel Headers 2.6.11

Also: need to select software FP:

Toolchain Options: Use software floating point by default
