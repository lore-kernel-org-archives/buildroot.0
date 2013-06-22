From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jun 2013 11:15:25 +0200
Subject: [Buildroot] [PATCH] libunwind:  new package
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C639A6A708@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C639A6A708@ex-mb1.corp.adtran.com>
Message-ID: <20130622111525.3d15ac49@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear ANDY KENNEDY,

On Fri, 21 Jun 2013 23:03:10 +0000, ANDY KENNEDY wrote:

> +LIBUNWIND_VERSION = 1.1
> +LIBUNWIND_SITE = http://download.savannah.gnu.org/releases/libunwind
> +LIBUNWIND_INSTALL_STAGING = YES
> +LIBUNWIND_LICENSE_FILES = COPYING

Please also add a LIBUNWIND_LICENSE variable with the name of the
license.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
