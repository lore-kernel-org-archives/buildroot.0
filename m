From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jan 2013 22:26:15 +0100
Subject: [Buildroot] [PATCH v2 1/6] sg3_utils: new package
In-Reply-To: <1357591399-3566-2-git-send-email-marek.belisko@open-nandra.com>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <1357591399-3566-2-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20130107222615.36bd70ab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marek Belisko,

On Mon,  7 Jan 2013 21:43:14 +0100, Marek Belisko wrote:

> +config BR2_PACKAGE_SG3_UTILS
> +	bool "sgutils"
> +	depends on BR2_LARGEFILE
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Low level utilities for devices that use a SCSI command set.
> +

You should mention here that this option only installs the library
(libraries?), but not the programs.

> +SG3_UTILS_LICENSE = BSD GPL

You should be work specific than just BSD and GPL. Like BSD-3c or
BSD-4c, GPLv2, GPLv2+, GPLv3, GPLv3+, etc.

Otherwise, looks good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
