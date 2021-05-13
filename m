From: Mikhail B. WproxyM <w.proxy.m@gmail.com>
Date: Thu, 13 May 2021 10:19:23 +0300
Subject: [Buildroot] boot/grub2: grub-core-build-fixes-for-i386
 (grub-2.04 + binutils-2.35.2 + pseudo-op .code64)
In-Reply-To: <CANTg=QhD4HgGRwiBf7YgSojeyV3ZgFQbiKVeih5zXYUbFC-ryw@mail.gmail.com>
References: <CANTg=Qj3vMern005jEMmUs2dWvi0oJ9Y3aoS4ocsrD91KoXW5Q@mail.gmail.com>
 <20210426225630.113ee3d7@windsurf>
 <CANTg=Qig12wrSU2WUBPmXFkjSpmmTo1gfEn1x6rgDR8vTM-82g@mail.gmail.com>
 <20210428134409.24999483@windsurf>
 <CANTg=QhD4HgGRwiBf7YgSojeyV3ZgFQbiKVeih5zXYUbFC-ryw@mail.gmail.com>
Message-ID: <CANTg=QgM+1Q7p+npOMEe=w9dyfUoN0-zVOvSke2eBGmcay743w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As expected, they do not want to include fix patch, because "The GRUB 2.04
release is a few years old."

--
Best regards, Mikhail B.


??, 28 ???. 2021 ?. ? 16:23, Mikhail B. WproxyM <w.proxy.m@gmail.com>:

> >What about having this patch submitted to upstream Grub ?
>
> Idea is nice, but I am not sure that it will work.
> The patch was already ignored some time before by grub2 developers,
> because it is not included in upstream. I will try.
>
> --
> Best regards, Mikhail B.
>
> ??, 28 ???. 2021 ?. ? 14:44, Thomas Petazzoni <
> thomas.petazzoni at bootlin.com>:
> >
> > Hello Mikhail,
> >
> > On Wed, 28 Apr 2021 11:07:13 +0300
> > "Mikhail B. WproxyM" <w.proxy.m@gmail.com> wrote:
> >
> > > I have the build error, when building *from i686* to i686.
> > >
> > > You do not have the build error, when building *from x86-64* to i686.
> > > Looks like it is the reason.
> > >
> > > Grub2 developers do not run build tests under i386/i686. Even you do
> > > not run build tests under i686.
> >
> > I was worried the issue would be related from the difference of the
> > build machine architecture. In theory it shouldn't matter, as the file
> > being built is built with the cross-compiler, but it seems like there
> > is an actual difference.
> >
> > What about having this patch submitted to upstream Grub ?
> >
> > Best regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, co-owner and CEO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210513/0e749c49/attachment.html>
