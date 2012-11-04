From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 Nov 2012 01:47:50 +0100
Subject: [Buildroot] [PATCH 06/18] libtirpc: new package
In-Reply-To: <045efa9091a2b75fca45da07eeeb107d90418771.1351964808.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 3 Nov 2012 18:47:51 +0100")
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <045efa9091a2b75fca45da07eeeb107d90418771.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87fw4qurbd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> +++ b/package/libtirpc/libtirpc.mk
 Thomas> @@ -0,0 +1,17 @@
 Thomas> +#############################################################
 Thomas> +#
 Thomas> +# libtirpc
 Thomas> +#
 Thomas> +#############################################################
 Thomas> +
 Thomas> +LIBTIRPC_VERSION = 0.2.2
 Thomas> +LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 Thomas> +LIBTIRPC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 Thomas> +LIBTIRPC_LICENSE = BSD-3c
 Thomas> +LIBTIRPC_LICENSE_FILES = COPYING
 Thomas> +
 Thomas> +LIBTIRPC_INSTALL_STAGING = YES
 Thomas> +LIBTIRPC_AUTORECONF = YES
 Thomas> +LIBTIRPC_DEPENDENCIES = host-pkg-config

It is called host-pkgconf now. Why do we need it if libtirpc doesn't
have any other dependencies?

-- 
Bye, Peter Korsgaard
