From: Marco Pastorelli <mpastorelli@gmail.com>
Date: Tue, 9 Jun 2015 15:58:42 +0200
Subject: [Buildroot] BR variable that points the built kernel
In-Reply-To: <20150609140338.49987c19@free-electrons.com>
References: <CAFRxoJ=gnhumch8GfcSEp0ettOYaRQUhc8in3uwO3MaH1d4wyg@mail.gmail.com>
 <20150609140338.49987c19@free-electrons.com>
Message-ID: <CAFRxoJnECac59y=bjeHYvXP4bDwU7Em9tcGm8kxixq_EjHr0MA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas,

I've used $(LINUX_DIR) in the past but now I'm running into the following
error:

line 8: LINUX_DIR: command not found

I'm using buildroot-2014.08, should it works also on that version?

Thank you!
Marco.

On 9 June 2015 at 14:03, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Marco Pastorelli,
>
> On Tue, 9 Jun 2015 13:41:41 +0200, Marco Pastorelli wrote:
>
> > I'm writing a post build script and I'm looking for a variable that
> points
> > to the directory where the kernel has been built.
> >
> > So far I have used ${BUILD_DIR}/linux-custom/ but this is not portable
> > since it depends on the kernel version.
> >
> > Does anyone know a better way to address my problem?
>
> Use $(LINUX_DIR).
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150609/fdcd8408/attachment.html>
