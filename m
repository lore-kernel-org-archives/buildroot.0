From: Gary Bisson <bisson.gary@gmail.com>
Date: Sat, 8 Nov 2014 13:56:27 -0800
Subject: [Buildroot] host ldconfig package
In-Reply-To: <CAM7q1LnW3-XFTqh-yWBZTb9O6XEy_CKxtjZhq62GYPmrd-a-PA@mail.gmail.com>
References: <CAM7q1LnRANa1wFbb=5o8yuyYyJrQyU_CUDqTaNwQ7tC7905L-A@mail.gmail.com>
 <1456757.71s6JAxXJf@aquila>
 <CAM7q1LnW3-XFTqh-yWBZTb9O6XEy_CKxtjZhq62GYPmrd-a-PA@mail.gmail.com>
Message-ID: <CADCpmyNMs7yTdGEzurOEvpHHSPJsDVHCEv6+dMT3s1ez9tR2Pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeff, Jerome, All,

On Fri, Nov 7, 2014 at 9:43 AM, Jeff Horn <outforaride@gmail.com> wrote:

> [snip]
> > For information, I made iMX6 hardware video decoding and display work.
> You
> > may encounter a few difficulties:
> >
> >   - Xorg support for imx6 is not yet merged (and we are looking for
> >     testers :-) )
>
> I can help test. I have a couple different i.MX6 boards (Wand,
> SabreSD). We are not using X11 on our board. We are using just Qt5
> with the eglfs platform.


Jerome, could you point us the patchset as well as the configuration you
would like people to test?


> >
> >   - /etc/ld.so.conf have to contains these paths:
> >        /usr/lib/imx-mm/audio-codec
> >        /usr/lib/imx-mm/video-codec
> >        /usr/lib/imx-mm/parser
> >     (I have to write a patch for this)
>
> Yes, I saw a post about this patch and I added it to my buildroot
> branch. I will continue to work on this to see what is happening.
>

Jeff, could you confirm everything works fine once the library paths have
been added to ld.so.conf?

Let me know if I can be of any help either writing the fix or testing it.

Thanks,
Gary
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141108/3bd70436/attachment.html>
