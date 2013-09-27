From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 27 Sep 2013 08:07:23 -0500
Subject: [Buildroot] [PATCH] beagleboneblack: add board
In-Reply-To: <CA+T6QPknCP3O2uM_S8va-MqY+jjzmojgmADw3wg4=4ePNmLw0A@mail.gmail.com>
References: <1380220826-17732-1-git-send-email-jkridner@beagleboard.org>	<87bo3f5pz4.fsf@dell.be.48ers.dk>
 <OF4892FC0E.FA9FE3E3-ON86257BF2.006E10F1-86257BF2.006EC6A2@rockwellcollins.com>
 <CA+T6QPknCP3O2uM_S8va-MqY+jjzmojgmADw3wg4=4ePNmLw0A@mail.gmail.com>
Message-ID: <OF041F2659.5DF7B620-ON86257BF3.00475360-86257BF3.0048165F@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jason,

Jason Kridner <jkridner@beagleboard.org> wrote on 09/26/2013 03:53:46 PM:

[...]

> >
> > I believe there is an issue with that kernel where it is unable to
> > compile the musb driver for the omap (CONFIG_USB_MUSB_OMAP2PLUS)
> > statically into the kernel because it will default to being a module
> > which will cause the kernel to fail to compile. I ran into this issue
> > with the Beagleboard-XM with the same kernel. The solution I found was
> > here:
> >
> > http://www.spinics.net/lists/linux-usb/msg67054.html
> >
> > I think added this patch to the kernel which I would may recommend 
adding
> > to the git repository you reference for this kernel.
> 
> Well, the musb is working in my image, so I'm not sure what to say
> other than I don't think this is necessary. I will move to the
> mainline kernel as soon as the features are sufficiently stable.

OK, well there was someone on the IRC that was saying they were having 
issues
saving a defconfig for the beaglebone black on the IRC where the defconfig
wasn't translating correctly to the full config. I guess that wasn't 
you. 

I ran into that problem after I saw the talk on the IRC so I thought I
would make my solution to the problem available on the mailing list.
 
[...]

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130927/d103706b/attachment.html>
