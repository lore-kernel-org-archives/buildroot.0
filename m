From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Date: Tue, 21 Jul 2009 11:28:28 -0300
Subject: [Buildroot] clean build
In-Reply-To: <50819.172.16.221.10.1248082629.squirrel@172.16.0.251>
References: <50819.172.16.221.10.1248082629.squirrel@172.16.0.251>
Message-ID: <81a4a26e0907210728l4d18213v5ab95fa3ce557369@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just saw the makefile

"make dirclean" has almost the same effect.

On Mon, Jul 20, 2009 at 6:37 AM, <nfrench@xtale.biz> wrote:

>
> thanks
>
> Could this be in the make file maybe distcleannodownload or
> distcleankeepdownload
>
>
> > I just remove, in arm case, "build_arm", "project_build_arm" and
> > "toolchain_build_arm"
> >
> > That gives me full build without downloading anything.
> >
> > On Wed, Jul 15, 2009 at 6:16 PM, <nfrench@xtale.biz> wrote:
> >
> >> What is the best way to do a clean build after changing an item in
> >> menuconfig it seems that a
> >> make clean followed by
> >> make
> >>
> >> does not rebuild everything ie if I have changed the compiler flags.
> >>
> >> if I do
> >>
> >> make distclean
> >>
> >> I have to do a make menuconfig before a make this also means that all
> >> the
> >> packages are dowloaded again.
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> >>
> >
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090721/ba84edc0/attachment.htm>
