From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 19:39:24 +0100
Subject: [Buildroot] [PATCH v2 1/4] libfm-extra: new package
In-Reply-To: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141122193924.34aa21ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 21 Nov 2014 15:33:07 +0000, Vicente Olivert Riera wrote:

> +LIBFM_EXTRA_VERSION = 1.2.3
> +LIBFM_EXTRA_SOURCE = libfm-$(LIBFM_EXTRA_VERSION).tar.xz

This is the exact same tarball as the one used for the libfm package:

+LIBFM_VERSION = 1.2.3
+LIBFM_SOURCE = libfm-$(LIBFM_VERSION).tar.xz
+LIBFM_SITE = http://sourceforge.net/projects/pcmanfm/files

Why do we have two different packages? Is it because libfm full version
needs menu-cache, and menu-cache needs libfm-extra? This really seems
weird.

Can you elaborate on this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
