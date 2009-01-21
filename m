From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 21 Jan 2009 22:32:26 +0100
Subject: [Buildroot] List of working packages for ARM
In-Reply-To: <87hc3spfy7.fsf@macbook.be.48ers.dk>
References: <1232523725.11888.11.camel@elrond.atmel.com>
	<87vds9t51h.fsf@macbook.be.48ers.dk>
	<1232538049.11888.16.camel@elrond.atmel.com>
	<87wscosv1f.fsf@macbook.be.48ers.dk>
	<1232560373.11888.36.camel@elrond.atmel.com>
	<87hc3spfy7.fsf@macbook.be.48ers.dk>
Message-ID: <1232573546.11888.82.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-21 klockan 21:22 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  Ulf> Here is the same with the 4.3.2/bu-2.19/uclib-0.9.30
> 
>  Ulf> mk	sdl                            FAIL	""
>  Ulf> mk	sdl_image                      FAIL	""
>  Ulf> mk	sdl_mixer                      FAIL	""
>  Ulf> mk	SDL_net                        FAIL	""
>  Ulf> mk	sdl_ttf                        FAIL	""
> 
> These all build fine here (arm926t)
> 

It dies on:

ln -s ../usr/include/directfb \
	/home/ulf/projects/Buildroot/20090121/buildroot/build_arm/staging_dir/include/directfb

because the link already exists.

This only happens if directfb is enabled for SDL.

BR
Ulf Samuelsson
