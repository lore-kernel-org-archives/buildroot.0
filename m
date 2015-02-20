From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 19:28:48 +0100
Subject: [Buildroot] [PATCH 4/7] autoconf-archive: new package
In-Reply-To: <1424435342-2188-5-git-send-email-bgolaszewski@baylibre.com>
References: <1424435342-2188-1-git-send-email-bgolaszewski@baylibre.com>
 <1424435342-2188-5-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20150220192848.1663022f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Fri, 20 Feb 2015 13:28:59 +0100, Bartosz Golaszewski wrote:

> +AUTOCONF_ARCHIVE_VERSION = 2015.02.04
> +AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
> +AUTOCONF_ARCHIVE_SITE = http://gnu.cardse.net/autoconf-archive/

Since this package is a GNU package, using $(BR2_GNU_MIRROR) was a
better idea here. I've changed it.

> +AUTOCONF_ARCHIVE_LICENSE = GPLv3+
> +AUTOCONF_ARCHIVE_LICENSE_FILES = COPYING

The license is actually GPLv3+ with exceptions, and I've added
COPYING.EXCEPTION to the LICENSE_FILES variable.

Also, could you send a follow-up patch adding a .hash file for this
package?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
