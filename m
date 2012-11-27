From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Nov 2012 10:54:28 +0100
Subject: [Buildroot] How to regenerate zImage?
In-Reply-To: <slrnkb87f4.2hp.narkewoody@zuhnb712.local.com>
References: <slrnkamf41.9pu.narkewoody@zuhnb712.local.com>
 <20121120100158.15b1b159@skate>
 <slrnkamq24.2u9.narkewoody@zuhnb712.local.com>
 <20121121103844.0eeefba6@skate>
 <CAAsE_ud49Ku0NKg-8Ku1mbMXVxkSfLNefvV6pnst2B9GD-4o+A@mail.gmail.com>
 <20121126090218.69c0b3af@skate>
 <slrnkb87f4.2hp.narkewoody@zuhnb712.local.com>
Message-ID: <20121127105428.2f8c2665@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Tue, 27 Nov 2012 01:57:46 +0000 (UTC), Woody Wu wrote:

> Many thanks.  I also want to do the same thing for the uboot, but I am
> not certain what's the correct package name for it.  Should I use
> UBOOT_OVERRIDE_SRCDIR or BOOT_OVERRIDE_SRCDIR? Thanks.

The package is in boot/uboot/. The name of the package is the name of
the directory, so 'uboot', which should be uppercased to UBOOT.
Therefore:

	UBOOT_OVERRIDE_SRCDIR

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
