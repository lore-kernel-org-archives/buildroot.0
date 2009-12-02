From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 2 Dec 2009 18:11:20 +0100
Subject: [Buildroot] [PATCH] Adding openbox to buildroot
In-Reply-To: <867286CD-192F-48CE-8C3A-00D988A93C6B@hsr.ch>
References: <867286CD-192F-48CE-8C3A-00D988A93C6B@hsr.ch>
Message-ID: <4d28d4b50912020911h52ef1e70j88e8c5b592fc66f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 2, 2009 at 6:02 PM, Marc Egli <marc.egli@hsr.ch> wrote:
> --- /dev/null
> +++ b/package/openbox/openbox.mk
> @@ -0,0 +1,16 @@
> +#############################################################
> +#
> +# openbox
> +#
> +#############################################################
> +
> +OPENBOX_VERSION = 3.4.7.2
> +OPENBOX_SOURCE = openbox-$(OPENBOX_VERSION).tar.gz
> +OPENBOX_SITE = http://icculus.org/openbox/releases
> +OPENBOX_DEPENDENCIES = libglib2 pango libxml2

No x11 dependencies ?

> +#OPENBOX_LIBTOOL_PATCH=NO
> +OPENBOX_INSTALL_STAGING=YES
> +OPENBOX_INSTALL_TARGET=YES
> +
> +$(eval $(call AUTOTARGETS,package,openbox))
> +
