From: Gregory Dymarek <gregd72002@gmail.com>
Date: Sat, 14 Feb 2015 22:01:44 +0000
Subject: [Buildroot] Raspberry pi boot problem? 2015.02-rc1
Message-ID: <CAEbDrgnp2_1rxaCF32BSugf8NzLs3Wi_4S2rgKWSwbsYSOYEMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Take it back. It all works fine. Just my math does not anymore ...


On 14 February 2015 at 20:59, Frank Hunleth <fhunleth@troodon-software.com>
wrote:

> Hi Gregory,
>
> On Sat, Feb 14, 2015 at 3:10 PM, Gregory Dymarek <gregd72002@gmail.com>
> wrote:
> > I just took a fresh copy of the repo from GIT and the same problem is in
> > there - does not fully boot.
>
> Are you using raspberrypi_defconfig or raspberrypi_dt_defconfig? I've
> locally changed the configs to use the external toolchain (so that
> they build faster), but they have booted for me.
>
> Frank
>
> >
> > On 13 February 2015 at 21:09, Gregory Dymarek <gregd72002@gmail.com>
> wrote:
> >>
> >> Hi,
> >>
> >> Is it just me or there is a problem with RPi packages? When booting it
> >> hangs on:
> >>
> >> Uncompressing Linux... done, booting the kernel.
> >>
> >>
> >>
> >> I've been using 2014.11 for last months without any issues. Compiled
> today
> >> 2015.02-rc1 using the same buildroot config (no legacy options there)
> and
> >> the default bcmrpi_defconfig and the problem appeared.
> >>
> >> Thanks,
> >> Gregory
> >
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> --
> Frank Hunleth
> Troodon Software LLC
> Embedded Software Development
> http://troodon-software.com/
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150214/730796c0/attachment.html>
