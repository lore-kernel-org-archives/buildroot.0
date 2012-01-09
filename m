From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jan 2012 08:27:23 +0100
Subject: [Buildroot] [PATCH] New package: sane-backends
In-Reply-To: <1326083742-1539-1-git-send-email-fhunleth@troodon-software.com>
References: <1326083742-1539-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20120109082723.713e0463@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun,  8 Jan 2012 23:35:42 -0500,
Frank Hunleth <fhunleth@troodon-software.com> a ?crit :

> +SANE_BACKENDS_VERSION:=1.0.22
> +SANE_BACKENDS_SOURCE:=sane-backends-$(SANE_BACKENDS_VERSION).tar.gz
> +SANE_BACKENDS_SITE:=ftp://ftp2.sane-project.org/pub/sane/sane-backends-$(SANE_BACKENDS_VERSION)

Please use '=' instead of ':=' here.

> +SANE_BACKENDS_DEPENDENCIES += libusb
> +SANE_BACKENDS_CONF_OPT += --enable-libusb_1_0
> +
> +$(eval $(call AUTOTARGETS))

Otherwise, looks like a sane package :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
