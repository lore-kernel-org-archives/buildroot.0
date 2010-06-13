From: sani.broyeur <sani.broyeur@free.fr>
Date: Sun, 13 Jun 2010 05:13:14 +0200
Subject: [Buildroot] Annoying... nothing work at all :-(
Message-ID: <1276398794.8108.31.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all.

I'm trying for several days to get a simple working result with
buildroot. Nothing.

I'm very surprised!

The source PC is a regular Fedora12 AMD quadcore.

The target is a MiniITX single board regular Atom PC, able to boot with
all desktop OS, on a regular disk or a CompactFlash reader.

- When invoking "make menuconfig && make" an ext2 image is created. OK
but unbootable, without bootloader nor kernel.

- When asking to add a bootloader, grub doesn't install properly on
target image, config is not done. This part is broken.

- When asking to add a CF/FAT16 bootloader, syslinux doesn't install at
all on target image, this part is also broken since it does really
nothing on the image :-)

- When asking a kernel, attempts lead often to cryptic make errors and
the whole buildroot tree has to be recreated from .tar.gz without kernel
generation. The "kernel" menu in menuconfig is broken, and no kernel
config is invoked at build or within menuconfig.

- When invoking linux26-menuconfig (I'v found that one time), either
nothing, or make errors, this one is also broken.

Etc, etc...

- Why asking for installation of a bootloader that is never installed,
nor configured on the target ?

- Why asking for generation of a kernel that is never created and lead
to corruption of buildroot tree ?

etc, etc...

All produced forms of "target" are either incomplete, or unusable, or
unbootable, when the commands are not ending with errors!

Is there somewhere an USABLE documentation?

A step-by-step tutorial ? With exemple and results ?

I'm not a newbie to linux, but this "buildroot project" seems for sure
not usable before years of improvements...

Comments would be appreciated.

Regards.
