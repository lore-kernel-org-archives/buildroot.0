From: Scott Fan <fancp2007@gmail.com>
Date: Tue, 24 Oct 2017 06:06:31 +0800
Subject: [Buildroot] [git commit branch/2017.08.x] Update for 2017.08.1
In-Reply-To: <20171023213451.2AD278111D@busybox.osuosl.org>
References: <20171023213451.2AD278111D@busybox.osuosl.org>
Message-ID: <CAFkzVZYhDP9SVTQt-_RVef370DVaRYvJSTaMQ21i86aGOjvHmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, Peter
 Is there any scheduled update (2017.02.7) for the LTS branch 2017.02.x in
the next days? Thanks


Regards
Scott Fan



2017?10?24? 05:42?"Peter Korsgaard" <peter@korsgaard.com>???

> commit: https://git.buildroot.net/buildroot/commit/?id=
> 20b6624f4bb84353e690d897688fd7ac12d6a881
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/
> heads/2017.08.x
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  CHANGES  | 34 ++++++++++++++++++++++++++++++++++
>  Makefile |  4 ++--
>  2 files changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/CHANGES b/CHANGES
> index c042bf5..cfe4894 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -1,3 +1,37 @@
> +2017.08.1, Released October 23rd, 2017
> +
> +       Important / security related fixes.
> +
> +       Webkitgtk bumped to the 2.18.x series, fixing a large number
> +       of security issues.
> +
> +       Defconfigs: galileo: fix ext4 related kernel config, bump
> +       kernel for gcc 6.x compatibility, enable wchar support for
> +       grub2. wandboard: correct rootfs offset
> +
> +       support: Ensure gzip compression level 6 is used for git
> +       tarballs. check-bin-arch: Correctly handle (ignore) symbolic
> +       links. check-rpath: Also handle PIE binaries
> +
> +       External toolchain: Correctly handle glibc Buildroot
> +       toolchains built with merged /usr
> +
> +       musl: fix ARMv4 build with binutils 2.27.51+, fix for
> +       CVE-2017-15650
> +
> +       Updated/fixed packages: apache, augeas, bind, bluez5_utils,
> +       busybox, bzip2, cmake, dnsmasq, ejabberd, gcc, git, go, ffmpeg,
> file,
> +       flashrom, gd, gdk-pixbug, gnupg2, hostapd, ifupdown-scripts,
> +       imagemagick, iucode-tool, kernel-module-imx-gpu-viv, lame,
> +       libarchive, libcurl, libffi, libidn, libmbim, libnspr, libnss,
> +       libressl, librsync, libsoup, libxml2, libzip, mbedtls, musl,
> +       netplug, nginx, openvpn, pkgconf, poppler, proxychains-ng,
> +       qemu, qt, rpi-userland, syslog, ruby, samba4, softether,
> +       sqlite, strongswan, subversion, supertuxkart, supervisor, tcpdump,
> +       tor, unrar, urq, vboot-utils, webkitgtk, wpa_supplicant, xen,
> +       xmlstarlet, xlib_libXfont, xlib_libXfont2,
> +       xserver_xorg-server, zsh
> +
>  2017.08, Released September 1st, 2017
>
>         Minor fixes.
> diff --git a/Makefile b/Makefile
> index 42fcf6d..eb02092 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -87,9 +87,9 @@ all:
>  .PHONY: all
>
>  # Set and export the version string
> -export BR2_VERSION := 2017.08
> +export BR2_VERSION := 2017.08.1
>  # Actual time the release is cut (for reproducible builds)
> -BR2_VERSION_EPOCH = 1504300000
> +BR2_VERSION_EPOCH = 1508790000
>
>  # Save running make version since it's clobbered by the make package
>  RUNNING_MAKE_VERSION := $(MAKE_VERSION)
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171024/18dace7a/attachment.html>
