From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 14 Sep 2010 10:51:43 +0200
Subject: [Buildroot] [PATCH 04/21] automake: bump to 1.11.1
In-Reply-To: <1284435648-15238-4-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
	<1284435648-15238-4-git-send-email-Martin.Banky@gmail.com>
Message-ID: <AANLkTimBfCzPQVFfX_TFNeLGqxD2umi=oHgFKUw93Au3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm still working on a new libtool version to be integrated in buildroot.
Amongst others things, automake 1.10.3 is required. So far I've been
able to build a rootfs including glib/libsoup/gstreamer/directfb with
automake 1.11, so...

Acked-by: Lionel Landwerlin <llandwerlin@gmail.com>

On Tue, Sep 14, 2010 at 5:40 AM, Martin Banky <martin.banky@gmail.com> wrote:
> Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
> ---
> ?CHANGES ? ? ? ? ? ? ? ? ? ? ?| ? ?2 +-
> ?package/automake/automake.mk | ? ?2 +-
> ?2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/CHANGES b/CHANGES
> index 6abd5c0..381e628 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -7,7 +7,7 @@
>
> ? ? ? ?Toolchain: ARM cortex A9 support
>
> - ? ? ? Updated/fixed packages: alsa-lib, alsa-utils, autoconf,
> + ? ? ? Updated/fixed packages: alsa-lib, alsa-utils, autoconf, automake,
> ? ? ? ?berkeleydb, busybox, dropbear, iptables, kismet, openvpn, qt,
> ? ? ? ?usbutils
>
> diff --git a/package/automake/automake.mk b/package/automake/automake.mk
> index 46bb773..a7d81ff 100644
> --- a/package/automake/automake.mk
> +++ b/package/automake/automake.mk
> @@ -3,7 +3,7 @@
> ?# automake
> ?#
> ?#############################################################
> -AUTOMAKE_VERSION = 1.10
> +AUTOMAKE_VERSION = 1.11.1
> ?AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.bz2
> ?AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
>
> --
> 1.7.2.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
