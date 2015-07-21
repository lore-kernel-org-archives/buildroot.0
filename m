From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 16:05:18 +0200
Subject: [Buildroot] [PATCH] openipmi: new package
In-Reply-To: <6a0b19385e58f845152f7bad579fcb89ee11de64.1437473500.git.baruch@tkos.co.il>
References: <6a0b19385e58f845152f7bad579fcb89ee11de64.1437473500.git.baruch@tkos.co.il>
Message-ID: <20150721160518.4ec76d65@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 21 Jul 2015 13:11:40 +0300, Baruch Siach wrote:

> +OPENIPMI_VERSION = 2.0.21
> +OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
> +OPENIPMI_SOURCE = OpenIPMI-2.0.21.tar.gz
> +OPENIPMI_LICENSE = LGPLv2+, GPLv2+, BSD-3c
> +OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
> +OPENIPMI_DEPENDENCIES = popt ncurses host-pkgconf
> +OPENIPMI_CONF_ENV = ac_cv_path_pkgprog="$(PKG_CONFIG_HOST_BINARY)"
> +OPENIPMI_CONF_OPTS = \
> +		--with-glib=no \
> +		--with-glib12=no \
> +		--with-tcl=no \
> +		--with-perl=no \
> +		--with-python=no \
> +		--with-swig=no

Indentation was wrong here, it should be only one tab. I've fixed that
up, and applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
