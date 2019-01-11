From: Juan A. Rubio <jarubio2001@gmail.com>
Date: Fri, 11 Jan 2019 12:58:44 +0000
Subject: [Buildroot] imx6 solo VPU support in Buildroot
In-Reply-To: <CAOMZO5Aso5o=qeRWYcXoQfQb714APBi7ZgR3aszXgvxEmx8UJA@mail.gmail.com>
References: <CAE58QoON4RUMgNdtUjBQDpYrmUSqTzjTyxJ+3LGPa=V=Q8kTRw@mail.gmail.com>
 <CAOMZO5Aso5o=qeRWYcXoQfQb714APBi7ZgR3aszXgvxEmx8UJA@mail.gmail.com>
Message-ID: <CAE58QoOdeCvOVNBVx=oWzYLgiO-R8A-S2zC1ZtR4-3wGbUVCJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks!,

I'll try this other route.


On Fri, 11 Jan 2019 at 12:17 Fabio Estevam <festevam@gmail.com> wrote:

> Hi Juan,
>
> On Fri, Jan 11, 2019 at 9:39 AM Juan A. Rubio <jarubio2001@gmail.com>
> wrote:
> >
> > Hi,
> >
> > I've noticed that the imx6 solo VPU is not supported in Buildroot
> > starting from 2018.02.x
> >
> > There is some information about this in this commit:
> >
> https://github.com/buildroot/buildroot/commit/b86b227fda97ef439a3cc0da03da0ebcad5c203a
>
> This is related to the VPU library used by the NXP vendor code.
>
> >
> > Has anyone come up with a solution to successfully enable the VPU
> > libraries on imx6 solo with Buildroot?. Is there any more information
> > about this that might help to get this to work somehow?
>
> I am able to use VPU on mx6 with Buildroot using mainline kernel.
>
> You can use configs/imx6-sabresd_qt5_defconfig as a reference.
>
> Please check this post with the details:
>
> https://imxdev.gitlab.io/tutorial/Decoding_video_with_a_mainline_kernel_on_i.MX6/
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190111/84199cc7/attachment.html>
