From: sani.broyeur at free.fr <sani.broyeur@free.fr>
Date: Mon, 14 Jun 2010 16:02:48 +0200
Subject: [Buildroot] Annoying... nothing work at all :-(
In-Reply-To: <22DB3ABB269549758E8D79D540845F90@cimeq.ca>
References: <1276398794.8108.31.camel@localhost>
	<22DB3ABB269549758E8D79D540845F90@cimeq.ca>
Message-ID: <1276524168.4c163688a0a0e@imp.free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Jonathan, I'm working on it :-)

Let's say that my bad experience is a mix (on my own) of misunderstanding,
unusual config and... one bug found by Thomas :-)

I'll try last snapshot this evening.

Regards.


Selon Jonathan dumaresq <jdumaresq@cimeq.qc.ca>:

> Hi,
>
> I think you should provide the error messages and .config file too to have
> some answer...
>
> Jonathan
> buildroot-bounces at busybox.net wrote:
> > Hi all.
> >
> > I'm trying for several days to get a simple working result with
> > buildroot. Nothing.
> >
> > I'm very surprised!
> >
> > The source PC is a regular Fedora12 AMD quadcore.
> >
> > The target is a MiniITX single board regular Atom PC, able to boot
> > with all desktop OS, on a regular disk or a CompactFlash reader.
> >
> > - When invoking "make menuconfig && make" an ext2 image is created.
> > OK but unbootable, without bootloader nor kernel.
> >
> > - When asking to add a bootloader, grub doesn't install properly on
> > target image, config is not done. This part is broken.
> >
> > - When asking to add a CF/FAT16 bootloader, syslinux doesn't install
> > at all on target image, this part is also broken since it does really
> > nothing on the image :-)
> >
> > - When asking a kernel, attempts lead often to cryptic make errors
> > and the whole buildroot tree has to be recreated from .tar.gz without
> > kernel generation. The "kernel" menu in menuconfig is broken, and no
> > kernel config is invoked at build or within menuconfig.
> >
> > - When invoking linux26-menuconfig (I'v found that one time), either
> > nothing, or make errors, this one is also broken.
> >
> > Etc, etc...
> >
> > - Why asking for installation of a bootloader that is never
> > installed, nor configured on the target ?
> >
> > - Why asking for generation of a kernel that is never created and
> > lead to corruption of buildroot tree ?
> >
> > etc, etc...
> >
> > All produced forms of "target" are either incomplete, or unusable, or
> > unbootable, when the commands are not ending with errors!
> >
> > Is there somewhere an USABLE documentation?
> >
> > A step-by-step tutorial ? With exemple and results ?
> >
> > I'm not a newbie to linux, but this "buildroot project" seems for
> > sure not usable before years of improvements...
> >
> > Comments would be appreciated.
> >
> > Regards.
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
