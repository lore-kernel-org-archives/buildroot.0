From: Tony Mozi <spooflinux@hotmail.fr>
Date: Mon, 8 Feb 2010 15:32:01 +0100
Subject: [Buildroot] Modify the name of the output image
 'rootfs.arm.ext2'
In-Reply-To: <20100206172451.6afccbfd@surf>
References: <SNT129-W65BE80962A75AA0E8E95F8B9540@phx.gbl>,
	<20100206172451.6afccbfd@surf>
Message-ID: <SNT129-W62A455BE19F0B8522B12F0B9510@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
Where Can I find BR2_TARGET_ROOFS_EXT2_OUTPUT?
There is no problem to rename the image after builduilg Buildroot, I want to make it automatically.
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
> > 'rootfs.arm.ext2' (which is in buildroot-2009.11/output/images) byi,
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
Nouveau?! Tout Windows Live d?barque dans votre t?l?phone. Voir les Windows phone
http://clk.atdmt.com/FRM/go/175819071/direct/01/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100208/454a0518/attachment.htm>
