From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 11 Jun 2015 09:32:00 +0200 (CEST)
Subject: [Buildroot] [PATCH 02/11 v2] docs/manual: add kernel-module
In-Reply-To: <97e1da52cd44a346541ddb2e1c6a445fffb79c5b.1433964001.git.yann.morin.1998@free.fr>
Message-ID: <2037622940.1424474.1434007920086.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey, thx interesting work, a slight comment below....


> +
> +Let's look at a more complex example:
> +
> +----
> +01:
> ################################################################################
> +02: #
> +03: # foo
> +04: #
> +05:
> ################################################################################
> +06:
> +07: FOO_VERSION = 1.2.3
> +08: FOO_SOURCE = foo-$(FOO_VERSION).tar.xz
> +09: FOO_SITE = http://www.foosoftware.org/download
> +10: FOO_LICENSE = GPLv2
> +11: FOO_LICENSE_FILES = COPYING
> +12:
> +13: FOO_MODULE_SUBDIRS = driver/base
> +14: FOO_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)
> +15:


^ This variable is not documented anywhere, you might want to do that...


Regards

Jeremy
