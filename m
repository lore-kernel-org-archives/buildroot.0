From: Jorge S. <jorgesolla@gmail.com>
Date: Wed, 24 Oct 2007 20:59:12 +0200
Subject: [Buildroot] Dataflash rootfs problems (still)
In-Reply-To: <6090c5eb0710241154w19575322jdba3df1886a491d9@mail.gmail.com>
References: <205592.59570.qm@web26204.mail.ukl.yahoo.com>
	<6090c5eb0710241154w19575322jdba3df1886a491d9@mail.gmail.com>
Message-ID: <6090c5eb0710241159x4a5ff765h8cadd08a34521d91@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2007/10/24, Jorge S. <jorgesolla@gmail.com>:
>
>
>
> 2007/10/24, Michael Trimarchi <trimarchimichael@yahoo.it>:
> >
> > Hi,
> >
> > >I've sucessfully built  several root filesystems  for my custom board
> > (AT91RM9200 + 8MiB DataFlash),  but  now  i'm >facing a  strange problem.
> >
> > >I'm using a JFFS2 filesystem on an MTD partition into the DataFlash, my
> > rootfs boots OK, but ONLY for the first time. >See steps:
> >
> > >1) Create a rootfs JFFS2 image using buildroot -> OK
> > >2) Erase entire flash partition: I boot from an initrd containing
> > mtd-tools for this purpouse. -> OK
> > >3) Dump the rootfs image "rootfs.jffs2 " into the Dataflash (i use
> > loadb from u-boot here...) -> OK
> > >4) Boot the system... -> OK
> > >5) Login and issue a simple reboot, no other commands...nothing
> > else.... -> OK
> >
> > >After the reboot at step "5" the system comes again, but now when is
> > press BACKSPACE it writes a space, and if i try >to add a user or change the
> > root password
> > >i always get a "/etc/passwd" not found.
> >
>
>
>
> Is a problem of your busybox configuration :)
> >
>
>
> Can you point me to something concrete?
>
> And, if busybox isn't properly configured, why is it working fine for the
> very first time?
>
> I use the default busybox (1.6.0) on buildroot. Any *must-change* option?
>

I mean -> I use the default busibox CONFIG on build root. In fact, i use
busybox 1.70 and 1.6.0 config as
default on buildroot.

Is there anything wrong here?

Regards.
>
> Regards
> > Michael
> >
> >
> > ------------------------------
> > L'email della prossima generazione? Puoi averla con la Nuova Yahoo! Mail<http://us.rd.yahoo.com/mail/it/taglines/gmail/nowyoucan/nextgen/*http://it.docs.yahoo.com/nowyoucan.html>
> >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071024/1a3015ef/attachment.htm 
