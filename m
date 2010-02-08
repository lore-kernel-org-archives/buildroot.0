From: Tony Mozi <spooflinux@hotmail.fr>
Date: Mon, 8 Feb 2010 10:51:37 +0100
Subject: [Buildroot] Modify the name of the output image
 'rootfs.arm.ext2'
In-Reply-To: <20100206172451.6afccbfd@surf>
References: <SNT129-W65BE80962A75AA0E8E95F8B9540@phx.gbl>,
	<20100206172451.6afccbfd@surf>
Message-ID: <SNT129-W31EBBE6400B96F3D0B1F58B9510@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
In fact, I want just rename the file automatically
By default : it's 'rootfs.arm.ext2' 
and I want for example 'titi.toto.ext2'

BR

> Date: Sat, 6 Feb 2010 17:24:51 +0100
> From: thomas.petazzoni at free-electrons.com
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] Modify the name of the output image 'rootfs.arm.ext2'
> 
> On Fri, 5 Feb 2010 17:35:09 +0100
> Tony Mozi <spooflinux@hotmail.fr> wrote:
> 
> > Is it possible to modify the name of the output image
> > 'rootfs.arm.ext2' (which is in buildroot-2009.11/output/images) by
> > 'rootfs.arm.ext2' (for example)? BR 
> 
> For ext2, see the option BR2_TARGET_ROOTFS_EXT2_OUTPUT.
> 
> For what kind of use case do you need this ? Is renaming the image
> after building Buildroot a problem ?
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100208/fbe6cb2b/attachment.htm>
