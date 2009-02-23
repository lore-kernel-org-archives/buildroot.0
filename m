From: Rajeev Bansal <rbansal@proxim.com>
Date: Mon, 23 Feb 2009 15:12:40 +0530
Subject: [Buildroot] Toolchain error
In-Reply-To: <873ae54iy6.fsf@macbook.be.48ers.dk>
References: <1E3D081C7B502B4A988F643E604CF9634721AD@INDEXCH.corp.proxim.com>
	<873ae54iy6.fsf@macbook.be.48ers.dk>
Message-ID: <1235382160.2951.52.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter, 

Thanks for your response. I think MIPS has the support for NPTL, I am
building the toolchain explicitly for NPTL support only. Kindly see this
link

http://www.linux-mips.org/wiki/NPTL

Thanks
Rajeev Bansal.

On Mon, 2009-02-23 at 10:10 +0100, Peter Korsgaard wrote:
> >>>>> "Rajeev" == Rajeev Bansal <rbansal@proxim.com> writes:
> 
>  Rajeev> Hi All,
> 
>  Rajeev> This is my first experience with the Buildroot, I have used
>  Rajeev> the latest stable version "buildroot-2009.02.tar.bz2 to build
>  Rajeev> the MIPS cross-toolchain. During building of toolchain I got
>  Rajeev> the following error
> 
> You selected Native POSIX Threading (NPTL) for pthread instead of the
> default linuxthreads old. NPTL isn't available for mips yet, so change
> it back and the build will work.
> 
