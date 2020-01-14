From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 14 Jan 2020 18:29:54 +0100
Subject: [Buildroot] [PATCH v1 2/3] package/rpi-firmware: bump version
 to 62a0d75
In-Reply-To: <20200114163653.GE22540@scaer>
References: <20200114094256.23174-1-ps.report@gmx.net>
 <20200114094256.23174-2-ps.report@gmx.net>
 <20200114163653.GE22540@scaer>
Message-ID: <20200114182954.4cee6766@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Tue, 14 Jan 2020 17:36:53 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2020-01-14 10:42 +0100, Peter Seiderer spake thusly:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/rpi-firmware/rpi-firmware.hash | 2 +-
> >  package/rpi-firmware/rpi-firmware.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> > index 63d8ac50a0..b5bb4d9f37 100644
> > --- a/package/rpi-firmware/rpi-firmware.hash
> > +++ b/package/rpi-firmware/rpi-firmware.hash
> > @@ -1,3 +1,3 @@
> >  # Locally computed
> > -sha256 b3c5c9d3cda1f77caf317b8d1f0496cd7ca791ddaeec8207a5a1940111483509 rpi-firmware-1.20190925.tar.gz
> > +sha256 088d094618924a90f65bb511808bbeb921e0769c878fa7baa9626954206f61a2 rpi-firmware-62a0d75b67484cb306a2a6f8fa954d9644868169.tar.gz
> >  sha256 ba76edfc10a248166d965b8eaf320771c44f4f432d4fce2fd31fd272e7038add boot/LICENCE.broadcom
> > diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> > index ee59ee2f26..b320e11233 100644
> > --- a/package/rpi-firmware/rpi-firmware.mk
> > +++ b/package/rpi-firmware/rpi-firmware.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >
> > -RPI_FIRMWARE_VERSION = 1.20190925
> > +RPI_FIRMWARE_VERSION = 62a0d75b67484cb306a2a6f8fa954d9644868169
>
> This goes from a tag to a sha1. Why do we need to do so? This should be
> explained in the commit log.

No new tag since 1.20190925...., and tags seems to be the exception for
buildroot (two times tags, numerous ones sha1), and we want to keep
rpi-firmware up to the same as the rpi linux-kernel (see e.g.
'kernel: Bump to 4.19.95' [1])...

Regards,
Peter

[1] https://github.com/raspberrypi/firmware/commit/d5b8d8d7cce3f3eecb24c20a55cc50a48e3d5f4e

>
> Regards,
> Yann E. MORIN.
>
> >  RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
> >  RPI_FIRMWARE_LICENSE = BSD-3-Clause
> >  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
> > --
> > 2.24.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
