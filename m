From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 14 Oct 2020 19:41:45 +0200
Subject: [Buildroot] [PATCH v4] package/fakeroot: bump version to 1.25.3
In-Reply-To: <20201014192159.6df8c19f@windsurf>
References: <20201014145809.367553-1-nolange79@gmail.com>
 <20201014192159.6df8c19f@windsurf>
Message-ID: <CADYdroM2=YiZ6=4s1Zo+-H4kP3BJStQ-B-0WmG5wVuyqJvLCAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yeah, I sent the correct v5. Or rather I tried and failed at that as well.
This day is a bit of a mess.

But I could conclude that adding some small mistakes is the best way to
grab your attention and getting stuff committed ;)

Thanks, Norbert


Thomas Petazzoni <thomas.petazzoni@bootlin.com> schrieb am Mi., 14. Okt.
2020, 19:22:

> Hello Norbert,
>
> On Wed, 14 Oct 2020 16:58:09 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > This version adds wrappers for getgroups and statx,
> > the latter is used by coreutils 8.32.
> >
> > Removed patches that are now in upstream.
> >
> > Added a patch to fix failure when installing.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> > v1->v2
> > -   rebased on master (instead of my private branch)
> > v2->v3
> > -   use debian.snapshot as source URL
> > v3->v4
> > -   bump version to 1.25.3 (aka desperation ping)
>
> It seems like this v4, in a desperate ping, was not sufficiently
> tested, as the hash in the .hash file was not correct:
>
> ERROR: No hash found for fakeroot_1.25.3.orig.tar.gz
>
> Indeed, the hash file still contained the hash of 1.25.1 :-)
>
> I fixed this up, and applied. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201014/fd1112cc/attachment.html>
