From: Patrick Doyle <wpdster@gmail.com>
Date: Sun, 21 Oct 2018 13:20:58 -0400
Subject: [Buildroot] How can I compile a module into the kernel?
In-Reply-To: <20181021095548.41d5f0b9@windsurf.lan>
References: <CAF_dkJAn7NgNfn5d0wQDnGF7UoCuFoUZvnpvvYDgWoA7RpV4Ag@mail.gmail.com>
 <20181021095548.41d5f0b9@windsurf.lan>
Message-ID: <CAF_dkJD1hZ0+8=+j64dMffDULsfG1DufDU8po4zm8VxAfdh0dA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 21, 2018 at 3:55 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello Patrick,
> On Sat, 20 Oct 2018 19:27:05 -0400, Patrick Doyle wrote:
> > For security reasons, I would like to disable loadable modules in my
> > kernel.
> > What I would really like to do is to tell buildroot and/or the kernel
> > "Link this external module into the kernel at link time, not at
> > runtime".
>
> You simply can't do that: external modules can only be built as
> modules.
Thank you Thomas.
Yeah, that's what I was finding as well, but I thought I should ask nonetheless.

Is it possible to permanently disable loadable modules from user space
at runtime?  Or to only load signed modules?  Or do I need to look
more carefully at selinux?

Any thoughts?

Thanks again.

--wpd
