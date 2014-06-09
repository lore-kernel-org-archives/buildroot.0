From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 15:00:13 +0200
Subject: [Buildroot] [PATCH 2/5] libksba: new package
In-Reply-To: <1402062269-57018-3-git-send-email-Vincent.Riera@imgtec.com>
References: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
 <1402062269-57018-3-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140609150013.546d73eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 6 Jun 2014 14:44:26 +0100, Vicente Olivert Riera wrote:

> +LIBKSBA_VERSION = 1.3.0
> +LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
> +LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
> +LIBKSBA_LICENSE = Mixture of GPL and LGPL licenses
> +LIBKSBA_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv3

Thanks to the details available in the AUTHORS file, I've made the
LIBKSBA_LICENSE value a bit more useful, and I've added the AUTHORS
file to LIBKSBA_LICENSE_FILES.

Applied with those changes, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
