From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 25 Apr 2016 09:40:46 +0200
Subject: [Buildroot] [PATCH] kmsxx: new package
In-Reply-To: <121769471.QD3BYebGGi@avalon>
References: <1461100189-19627-1-git-send-email-maxime.ripard@free-electrons.com>
 <121769471.QD3BYebGGi@avalon>
Message-ID: <20160425074046.GG25817@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Laurent,

On Wed, Apr 20, 2016 at 03:21:23AM +0300, Laurent Pinchart wrote:
> > +###########################################################################
> > ##### +#
> > +# kmsxx
> > +#
> > +###########################################################################
> > ##### +
> > +KMSXX_VERSION = bef0109aa93971dd6cc6040661dc6494533e6bee
> > +KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
> > +KMSXX_LICENSE = MPLv2.0
> > +KMSXX_LICENSE_FILES = LICENSE
> > +
> > +KMSXX_DEPENDENCIES += libdrm
> > +
> > +KMSXX_CONF_OPTS += -DLIBKMS_ENABLE_PYTHON=OFF
> 
> The python bindings are very useful to write unit tests. Would it be possible 
> to add an option to enable them ? I use them successfully on a buildroot 
> rootfs with python support enabled.

I didn't have anything to test them with, so that's why I disabled
them at first, but I can enable it if you want. You'll have to test
though ;)

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160425/cb44a101/attachment.asc>
