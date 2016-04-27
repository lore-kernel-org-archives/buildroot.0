From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 22:41:52 +0200
Subject: [Buildroot] [PATCH 1/1] libusbgx: new package
In-Reply-To: <1461752328-28760-1-git-send-email-gwenj@trabucayre.com>
References: <1461752328-28760-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20160427224152.59684010@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Apr 2016 12:18:48 +0200, Gwenhael Goavec-Merou wrote:

> +LIBUSBGX_VERSION = 2e3d43ee098ed928d1baa61ce791ce9ff4788c5a
> +LIBUSBGX_SITE = $(call github,libusbgx,libusbgx,$(LIBUSBGX_VERSION))
> +LIBUSBGX_LICENSE = LGPLv2.1+
> +LIBUSBGX_LICENSE_FILES = COPYING COPYING.LGPL

The COPYING file contains the text of the GPLv2, so this should have
hinted you that the whole thing is not under LGPLv2.1+ only. In fact,
the library is under LGPLv2.1+ and the examples (which are
built and installed by default) are under GPLv2+.

I've fixed that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
