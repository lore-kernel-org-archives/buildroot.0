From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jul 2013 23:26:25 +0200
Subject: [Buildroot] [git commit] kmod: bump version
In-Reply-To: <20130703194340.D760E9A19A@busybox.osuosl.org>
References: <20130703194340.D760E9A19A@busybox.osuosl.org>
Message-ID: <20130703232625.08b7fe54@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 3 Jul 2013 21:40:53 +0200, Peter Korsgaard wrote:

> +# static linking not supported, see
> +# https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
> +KMOD_CONF_OPT = --disable-static --enable-shared

	depends !BR2_PREFER_STATIC_LIB

in the kconfig dependencies maybe?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
