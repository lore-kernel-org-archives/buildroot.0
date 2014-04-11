From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 00:21:50 +0200
Subject: [Buildroot] [git commit] kmod: bump version
In-Reply-To: <20140411185800.6052A9C6D0@busybox.osuosl.org>
References: <20140411185800.6052A9C6D0@busybox.osuosl.org>
Message-ID: <20140412002150.0109b2fd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 11 Apr 2014 20:57:27 +0200, Peter Korsgaard wrote:

> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +KMOD_DEPENDENCIES += python
> +KMOD_CONF_OPT += --enable-python
> +endif

What about Python 3 compatibility?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
