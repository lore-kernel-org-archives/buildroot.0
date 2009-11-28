From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 28 Nov 2009 05:10:26 -0600
Subject: [Buildroot] Build jobbing
In-Reply-To: <87y6lr3p2g.fsf@macbook.be.48ers.dk>
References: <200911271522.58858.minimod@morethan.org>
	<200911271610.08010.minimod@morethan.org>
	<87y6lr3p2g.fsf@macbook.be.48ers.dk>
Message-ID: <200911280510.28749.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat November 28 2009, Peter Korsgaard wrote:
> >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
>

I'll go back through all of those today, one at a time, and post
either patches or a better description of each problem.

I am gaining confidence that I have most (all?) of the cockpit
errors out of my setup here.

Some of those things I know how to fix,
Others, I needed the additional set of eyes and suggestions
just like you provided.

Mike 
> Hi,
> 
>  Michael> ltrace does not build - just disabled it for now.
> 
> It builds here:
> 
> build/ltrace-0.5/ltrace: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), not stripped
> 
> What exactly goes wrong?
> 
>  Michael> mii-diag-2.11 does not build - just disable it for now.
> 
> It builds here:
> 
> build/mii-diag-2.11/mii-diag: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), not stripped
> 
> What exactly goes wrong?
> 
>  Michael> nand_{erase,lock,unlock) in BB-1.15.2 does not build.
> 
> There's a busybox patch pending for building the flash stuff with
> 2.6.31.x kernel headers. I'll do a bit more testing and commit.
> 
