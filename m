From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 23 Apr 2008 20:35:51 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
References: <20080423130355.7668C3C747@busybox.net><010801c8a560$21c744d0$020514ac@atmel.com>
	<87skxcfnvj.fsf@macbook.be.48ers.dk>
Message-ID: <004301c8a593$e6309be0$080514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Ulf> Why install mkimage in the target???
> 
> To create images and more importantly, to see the version info of
> images in the flash (mkimage -l).
> 
> Ulf> It is used to create the linux kernel image so that U-Boot can load it.
> Ulf> If you download a new image, I would expect it is already created
> Ulf> using mkimage on the host.
> 
> Sure, but uImages are not just for kernels, E.G. the board I'm working
> on has firmware for 2 fpgas in seperate uImages. It's handy to be able
> to check the version info of the installed images under Linux, similar
> to the imls u-boot command.
> 

OK, that makes sense.
You learn something every day.

> -- 
> Bye, Peter Korsgaard
>


Best Regards
Ulf Samuelsson
