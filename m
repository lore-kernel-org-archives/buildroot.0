From: Jorge S. <jorgesolla@gmail.com>
Date: Thu, 25 Oct 2007 11:08:22 +0200
Subject: [Buildroot] Dataflash rootfs problems (still)
In-Reply-To: <1193266654.4415.21.camel@aeglos.sweden.atmel.com>
References: <6090c5eb0710240920o4e56f66et2c9f1761c97aea4e@mail.gmail.com>
	<1193243618.4415.6.camel@aeglos.sweden.atmel.com>
	<6090c5eb0710240954q368b3409k282c02a5e2fcbef4@mail.gmail.com>
	<471F904A.5050206@promwad.com>
	<1193266654.4415.21.camel@aeglos.sweden.atmel.com>
Message-ID: <6090c5eb0710250208i4e48840dub7674ec4ba3fdb2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2007/10/25, Ulf Samuelsson <ulf@atmel.com>:
>
> ons 2007-10-24 klockan 21:34 +0300 skrev Ivan Kuten:
> > >
> > > During the 1st boot, Dropbear creates and "writes" the generated keys,
> maybe
> > > is this *write* operation the one screwing up the dataflash?
> > >
> >
> > We have similar problems with Dataflash&RM9200
> > *write* operation is unreliable - we had corrupted filesystem after
> reboot.
> > Our solution was to use r/o only on dataflash.
> >
>
> I would reduce speed to 5 Mbps or lower. or implement the external gate.
> Moving to the AT91SAM9260 is of course a nice alternative.
> Lower cost, (soon) much higher speed (with the AT91SAM9260A)
> Better BootROM (I defined it :-)


Can you suggest the best way to reduce  speed?  maybe using the board
definition on the kernel?

Regards,

Jorge.


>
> > Best regards,
> > Ivan
> > --------------------------------
> > Embedded Linux engineer,
> > Promwad Company: http://www.promwad.com/
> > Homepage : http://www.ivankuten.com/
> > --------------------------------
> --
> Best Regards,
> Ulf Samuelsson
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071025/7318add6/attachment.htm 
