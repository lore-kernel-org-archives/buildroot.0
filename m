From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Wed, 15 Sep 2010 14:23:00 -0400
Subject: [Buildroot] Video4Linux2 on Buildroot
In-Reply-To: <AANLkTi==QwxYUbO6JKUSu_dw6sR3=gi9TdiQHbZmH9XN@mail.gmail.com>
References: <AANLkTi==QwxYUbO6JKUSu_dw6sR3=gi9TdiQHbZmH9XN@mail.gmail.com>
Message-ID: <AANLkTikimpgCvtmXqtAX_AHN6dFeucpxpRQ-AEzae8D5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Neil,

V4L2 is indeed in your kernel configuration. It's under Device Drivers--->
Multimedia support ---> Video For Linux

Cheers,

Pierre-Luc


On Wed, Sep 15, 2010 at 1:52 PM, Neil Benn <neil.benn@ziath.com> wrote:

> Hello,
>
>         I've been trying to get an ARM kernal and rootfs compiled using
> buildroot for my beagleboard (I'll do Gumstix as well later on).  I pulled
> down buildroot and built the base example without much messing about.  I
> could not find anything to enable video4linux2 in the buildroot menuconfig
> so I compiled thinking I could change it in the kernel menuconfig but I
> cnanot find it there either.  Does anyone know how I can bring in
> video4linux2 support into the build from buildroot?
>
>  Thanks for your help.
>
> Cheers,
>
> Neil
>
> --
> --
>
> Neil Benn Msc
> Director
> Ziath Ltd
> Phone :+44 (0)7508 107942
> Website - http://www.ziath.com
>
> IMPORTANT NOTICE:  This message, including any attached documents, is
> intended only for the use of the individual or entity to which it is
> addressed, and may contain information that is privileged, confidential and
> exempt from disclosure under applicable law.  If the reader of this message
> is not the intended recipient, or the employee or agent responsible for
> delivering the message to the intended recipient, you are hereby notified
> that any dissemination, distribution or copying of this communication is
> strictly prohibited. If you have received this communication in error,
> please notify Ziath Ltd immediately by email at info at ziath.com. Thank you.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100915/cbd8c921/attachment-0001.html>
