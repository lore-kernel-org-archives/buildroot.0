From: Pradeep Kiruvale <pradeepkiruvale@gmail.com>
Date: Wed, 27 Aug 2014 17:44:11 +0200
Subject: [Buildroot] Rootfs for aarch64
In-Reply-To: <CAFbHwiSOfj7tctecfL7uAj3g2pSCLbg_282JhYE_SPRyja7ooQ@mail.gmail.com>
References: <CAJ2SuL=yhZdq-aQ3Up4mkL29troM9ieq8qxXTVux0NYYapao=A@mail.gmail.com>
 <CAFbHwiSOfj7tctecfL7uAj3g2pSCLbg_282JhYE_SPRyja7ooQ@mail.gmail.com>
Message-ID: <CAJ2SuLmY8rAq0aYmWpWeOdkbRXo+c50_YnLvtYP=JguLLmadqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Will,

Thanks for the quick reply. I am just trying with foundation first and then
planing to move to qemu.

I tried searching for ubuntu I dint find. Can you please tell me from where
I can download ubuntu for aarch64?

Regards,
Pradeep


On 27 August 2014 17:27, Will Newton <will.newton@gmail.com> wrote:

> On Wed, Aug 27, 2014 at 4:12 PM, Pradeep Kiruvale
> <pradeepkiruvale@gmail.com> wrote:
> > Hi All,
> >
> > I am very new to aarch64/arm64. I want to port some application from x86
> to
> > arm64
> > so I need to build a environment for porting and testing the software.
> > Please let me
> > know how can I create a rootfile system and image for the newer version
> of
> > the linux.
> >
> > I want to build a full fledged rootfs with all possible libraries and
> want
> > to mount nfs.
> >
> > I did try for a while, do to some configuration issues I am not able to
> boot
> > the image
> > which I built on x86. I am using linaro foundation as a simulator.
>
> In general unless you need to I would use qemu over the foundation
> model as it is quicker and IMO easier to work with.
>
> This blog post gives some detail about using it:
>
>
> http://www.bennee.com/~alex/blog/2014/05/09/running-linux-in-qemus-aarch64-system-emulation-mode/
>
> Also note that Ubuntu (and Fedora) is available for aarch64 so if you
> want a full development system with package management that may be
> more suitable.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140827/44f66823/attachment.html>
