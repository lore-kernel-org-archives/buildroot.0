From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 23:46:48 +0200
Subject: [Buildroot] [PATCH] linux-firmware: add qca6174{bt} firmware
In-Reply-To: <20170704163935.14221-1-maxime.hadjinlian@gmail.com>
References: <20170704163935.14221-1-maxime.hadjinlian@gmail.com>
Message-ID: <20170704234648.28bf7351@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 18:39:35 +0200, Maxime Hadjinlian wrote:

> +config BR2_PACKAGE_LINUX_FIRMWARE_QCA_6174A_BT

Renamed to BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT to have the
full vendor name.

> +config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174
> +	bool "Qualcomm Atheros 6174"
> +	help
> +	  Firmware files for the Qualcomm Atheros QCA6174 chip

I've also fixed alphabetic ordering.

Applied with those issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
