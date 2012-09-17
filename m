From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Sep 2012 22:43:24 +0200
Subject: [Buildroot] [PATCH] Add package raspberrypi-firmware.
In-Reply-To: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
References: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20120917224324.0ee1d36d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marek Belisko,

On Mon, 17 Sep 2012 22:34:17 +0200, Marek Belisko wrote:
> +prompt "Memory & GPU split"
> +	default BR2_PACKAGE_BOOTLOADER_ARM192

When a package is named BR2_PACKAGE_FOO, then all its sub-options
*must* have name that starts with BR2_PACKAGE_FOO_

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
