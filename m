From: Marco Pastorelli <mpastorelli@gmail.com>
Date: Wed, 10 Jun 2015 10:29:16 +0200
Subject: [Buildroot] BR variable that points the built kernel
In-Reply-To: <20150609160304.021d6edb@free-electrons.com>
References: <CAFRxoJ=gnhumch8GfcSEp0ettOYaRQUhc8in3uwO3MaH1d4wyg@mail.gmail.com>
 <20150609140338.49987c19@free-electrons.com>
 <CAFRxoJnECac59y=bjeHYvXP4bDwU7Em9tcGm8kxixq_EjHr0MA@mail.gmail.com>
 <20150609160304.021d6edb@free-electrons.com>
Message-ID: <CAFRxoJ=O5=UvmRJPu3+qn2zVu6dniym7qTAdvWSWMf9Dpozk0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

You're right, is there a way to use make variables inside the post-build
script? Or this is a wrong approach?

Thanks,
Marco.

On 9 June 2015 at 16:03, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Marco Pastorelli,
>
> On Tue, 9 Jun 2015 15:58:42 +0200, Marco Pastorelli wrote:
>
> > I've used $(LINUX_DIR) in the past but now I'm running into the following
> > error:
> >
> > line 8: LINUX_DIR: command not found
>
> You're using it in the wrong place then. Hard to be more specific
> without seeing exactly the code you're using.
>
> If $(LINUX_DIR) tells you command not found, it means it's interpreted
> as a shell command, not as a make variable expansion.
>
> > I'm using buildroot-2014.08, should it works also on that version?
>
> Yes, it should.
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150610/9f7c810c/attachment.html>
