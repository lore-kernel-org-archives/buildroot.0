From: Tony Mozi <spooflinux@hotmail.fr>
Date: Tue, 9 Feb 2010 15:02:09 +0100
Subject: [Buildroot] Modify the name of the output image
 'rootfs.arm.ext2'
In-Reply-To: <20100209133544.500877c7@surf>
References: <SNT129-W65BE80962A75AA0E8E95F8B9540@phx.gbl>,
	<20100206172451.6afccbfd@surf>,
	<SNT129-W62A455BE19F0B8522B12F0B9510@phx.gbl>,
	<20100209133544.500877c7@surf>
Message-ID: <SNT129-W191019721F517AC4621848B9500@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
Thank you for your answer.
In fact, menuconfig is very expanse and I haven't found the solution before.
In order to change the name of the image output : 
-make menuconfig
-Target filesystem options --->
-($(IMAGE).ext2) output file
-Replace by what you want.

Are there a documentation more complete than 'Buildroot - Usage and documentation'?

BR

> Date: Tue, 9 Feb 2010 13:35:44 +0100
> From: thomas.petazzoni at free-electrons.com
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] Modify the name of the output image 'rootfs.arm.ext2'
> 
> On Mon, 8 Feb 2010 15:32:01 +0100
> Tony Mozi <spooflinux@hotmail.fr> wrote:
> 
> > Where Can I find BR2_TARGET_ROOFS_EXT2_OUTPUT?
> 
> Can you make at least a small effort and search a little bit in
> menuconfig/xconfig ?
> 
> Either :
> 
>  1. Use the menuconfig search engine by typing /
> 
>  2. Use the xconfig search engine
> 
>  3. Grep Buildroot source code for the option
> 
> Target filesystem options
>  -> ext2 root filesystem
>    -> Output File
> 
> > There is no problem to rename the image after builduilg Buildroot, I
> > want to make it automatically.
> 
> You can also run:
> 
>  make && mv output/images/rootfs.arm.ext2 /path/to/your/location/your.name
> 
> Not everything necessarly needs to be automated *inside* Buildroot.
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
 		 	   		  
_________________________________________________________________
T?l?chargez Internet Explorer 8 et surfez sans laisser de trace !
http://clk.atdmt.com/FRM/go/182932252/direct/01/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100209/fa7aa8df/attachment.htm>
