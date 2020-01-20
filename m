From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 20 Jan 2020 07:55:54 +0100
Subject: [Buildroot] [PATCH v2 1/3] configs/raspberrypi*: bump kernel
 version to 301ec88
In-Reply-To: <20200117212420.GR22540@scaer>
References: <20200115210037.9564-1-ps.report@gmx.net>
 <20200117212420.GR22540@scaer>
Message-ID: <20200120075554.155a4c33@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Fri, 17 Jan 2020 22:24:20 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> Thanks for the reespin.
>
> On 2020-01-15 22:00 +0100, Peter Seiderer spake thusly:
> > Now based on 4.19.93 (from 4.19.75).
>
> Sorry, but you are still not explaining _why_ we need to go from a tag
> to a sha1.
>
> Even saying "upstream is lenient about tags, we don't know when the next
> one will be released, so switch to a sha1" would have been enough...
>
> Please resend, either expanding on the above, or providing a better
> explanation.
>
> Ditto your second patch.
>
> However, for the thied one, we're already using a sha1, so the
> explantions is not needed. However, just resend it as well: I did not
> apply it, as I did not know if it makes sense to apply it separately of
> the second one...

Ups, sorry, will fix it on next patch interation...

Regards,
Peter

>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Changes v1 -> v2:
> >   - no changes
> > ---
> >  configs/raspberrypi0_defconfig       | 2 +-
> >  configs/raspberrypi0w_defconfig      | 2 +-
> >  configs/raspberrypi2_defconfig       | 2 +-
> >  configs/raspberrypi3_64_defconfig    | 2 +-
> >  configs/raspberrypi3_defconfig       | 2 +-
> >  configs/raspberrypi3_qt5we_defconfig | 2 +-
> >  configs/raspberrypi4_64_defconfig    | 2 +-
> >  configs/raspberrypi4_defconfig       | 2 +-
> >  configs/raspberrypi_defconfig        | 2 +-
> >  9 files changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
> > index 1600e219d1..5cdc38eae0 100644
> > --- a/configs/raspberrypi0_defconfig
> > +++ b/configs/raspberrypi0_defconfig
> > @@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
> >
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,301ec88e28eb8924e827e60020ab513e60fb7085)/linux-301ec88e28eb8924e827e60020ab513e60fb7085.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
> >
> >  # Build the DTBs for A/B from the kernel sources: the zero is the same
> > diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
> > index e3c747ff6f..129afc4f2e 100644
> > --- a/configs/raspberrypi0w_defconfig
> > +++ b/configs/raspberrypi0w_defconfig
> > @@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
> >
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,301ec88e28eb8924e827e60020ab513e60fb7085)/linux-301ec88e28eb8924e827e60020ab513e60fb7085.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
> > diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
> > index e6c38e74b7..15b6a58780 100644
> > --- a/configs/raspberrypi2_defconfig
> > +++ b/configs/raspberrypi2_defconfig
> > @@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> >
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,301ec88e28eb8924e827e60020ab513e60fb7085)/linux-301ec88e28eb8924e827e60020ab513e60fb7085.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
> >
> >  # Build the DTB from the kernel sources
> > diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
> > index b9a070fb82..45283496ac 100644
> > --- a/configs/raspberrypi3_64_defconfig
> > +++ b/configs/raspberrypi3_64_defconfig
> > @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> >
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,301ec88e28eb8924e827e60020ab513e60fb7085)/linux-301ec88e28eb8924e827e60020ab513e60fb7085.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
> >
> >  # Build the DTB from the kernel sources
> > diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
> > index 530eb0ab3f..08e7bed027 100644
> > --- a/configs/raspberrypi3_defconfig
> > +++ b/configs/raspberrypi3_defconfig
> > @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> >
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,301ec88e28eb8924e827e60020ab513e60fb7085)/linux-301ec88e28eb8924e827e60020ab513e60fb7085.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
> >
> >  # Build the DTB from the kernel sources
> > diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
> > index 4e9d782c7c..63a03e5cf9 100644
> > --- a/configs/raspberrypi3_qt5we_defconfig
> > +++ b/configs/raspberrypi3_qt5we_defconfig
> > @@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> >
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,301ec88e28eb8924e827e60020ab513e60fb7085)/linux-301ec88e28eb8924e827e60020ab513e60fb7085.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
> >
> >  # Build the DTB from the kernel sources
> > diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
> > index f013c4382c..0733e91b05 100644
> > --- a/configs/raspberrypi4_64_defconfig
> > +++ b/configs/raspberrypi4_64_defconfig
> > @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> >
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,301ec88e28eb8924e827e60020ab513e60fb7085)/linux-301ec88e28eb8924e827e60020ab513e60fb7085.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
> >
> >  # Build the DTB from the kernel sources
> > diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
> > index a216463e28..2402b0673c 100644
> > --- a/configs/raspberrypi4_defconfig
> > +++ b/configs/raspberrypi4_defconfig
> > @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> >
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,301ec88e28eb8924e827e60020ab513e60fb7085)/linux-301ec88e28eb8924e827e60020ab513e60fb7085.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
> >
> >  # Build the DTB from the kernel sources
> > diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> > index 969a92820e..1b47e293f8 100644
> > --- a/configs/raspberrypi_defconfig
> > +++ b/configs/raspberrypi_defconfig
> > @@ -11,7 +11,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
> >
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,301ec88e28eb8924e827e60020ab513e60fb7085)/linux-301ec88e28eb8924e827e60020ab513e60fb7085.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
> >
> >  # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
> > --
> > 2.24.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
