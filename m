From: Marcel <korgull@home.nl>
Date: Sun, 20 Dec 2009 19:12:21 +0100
Subject: [Buildroot] develop using buildroot
In-Reply-To: <87skb51qhh.fsf@macbook.be.48ers.dk>
References: <200912201506.20584.korgull@home.nl>
	<87skb51qhh.fsf@macbook.be.48ers.dk>
Message-ID: <200912201912.21047.korgull@home.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well, I asked about the development environment and found to use git.
From there I figured it was difficult to use inside buildroot and started to find 
a way to do it.
I ended up compiling things outside buildroot but was just wondering if that's 
a good way to do things or if there's any preferred way to do it.

> >>>>> "Marcel" == Marcel  <korgull@home.nl> writes:
> 
>  Marcel> Hi,
>  Marcel> I'm having some issues setting up a workable environment.
>  Marcel> I need to write my own kernel drivers, add some packages and
>  change u-boot.
> 
>  Marcel> buildroot requires patches, so that's clear but I wonder how to
>  Marcel> efficiently develop those patches.
> 
>  Marcel> Do I set up the kernel and u-boot outside buildroot, than
>  Marcel> create patches form there and than include those in buildroot ?
> 
> Didn't you ask the same question just a few days ago? You can work in
> whatever way suits you best, but personally I prefer to get kernel+uboot
> up and running outside buildroot, and then just add the patches to BR
> once everything is working.
> 
