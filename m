From: Jeff Renner <d1g1t4lsh4d0w@gmail.com>
Date: Wed, 7 Mar 2012 13:01:41 +0000
Subject: [Buildroot] AX.25 Support in Buildroot/Busybox
In-Reply-To: <20120307090401.15998a31@skate>
References: <CAMPueyyycZdDJVhff2JMqWCE0KjpDDM+SYpBGak6BM=NWUT5zw@mail.gmail.com>
 <20120307090401.15998a31@skate>
Message-ID: <CAMPueyyvbP+YEN_TA1WnbF5rdRJ-bB1kYTVCXOV8vHY21XrfcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you for your reply.

You are talking about this:
http://buildroot.uclibc.org/buildroot.html#add_packages
right?

That process seems a little complicated to be done by a person who have
no experience.
But i will try it.

Thank you very much,
Jeff


2012/3/7 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Hello Jeff,
>
> Le Wed, 7 Mar 2012 01:09:36 +0000,
> Jeff Renner <d1g1t4lsh4d0w@gmail.com> a ?crit :
>
> > Can someone tell me what is the best way to have all AX.25 support in
> > buildroot using ARM architecture?
>
> Creating Buildroot packages for the following three elements is
> probably the right way to do this.
>
> You can read the documentation, which details how to add packages. We
> can also help by answering your questions about this.
>
> > I mean that software available at http://www.linux-ax25.org :
> > AX.25
> > Apps<http://www.linux-ax25.org/pub/ax25-apps/ax25-apps-0.0.8-rc2.tar.gz>
> > AX.25
> > Tools<
> http://www.linux-ax25.org/pub/ax25-tools/ax25-tools-0.0.10-rc2.tar.gz>
> > AX.25
> > Library<http://www.linux-ax25.org/pub/libax25/libax25-0.0.12-rc2.tar.gz>
> >
> > (and net-tools support for ax.25?)
> >
> > It would be very interesting if it can be automatically enabled, for
> > example, in busybox-menuconfig.
>
> busybox-menuconfig is for configuring *Busybox* itself, so definitely,
> it wouldn't show up there. However, it would show up with all other
> packages in "make menuconfig".
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120307/bbefbb94/attachment.html>
