From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 14:06:47 +0200
Subject: [Buildroot] [PATCH 05/12] package/libblockdev: add cryptography
 support
In-Reply-To: <20200723010810.3237608-6-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
 <20200723010810.3237608-6-aduskett@gmail.com>
Message-ID: <20200723140647.7896e5e9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Jul 2020 18:08:03 -0700
aduskett at gmail.com wrote:

> +config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
> +	bool "Crypto plugin"
> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # gpg2, libgpgme, libassuan

The comment should say that this comes from volume-key, otherwise it's
a bit weird, as you don't directly select gpg2 here.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
