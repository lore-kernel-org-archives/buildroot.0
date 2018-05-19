From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 21:52:04 +0200
Subject: [Buildroot] [PATCH 1/1] mbdedtls: security bump to version 2.9.0
In-Reply-To: <20180519134534.3463-1-fontaine.fabrice@gmail.com>
References: <20180519134534.3463-1-fontaine.fabrice@gmail.com>
Message-ID: <20180519215204.0d6db3e1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 May 2018 15:45:34 +0200, Fabrice Fontaine wrote:

>  MBEDTLS_SITE = https://tls.mbed.org/code/releases
> -MBEDTLS_VERSION = 2.7.2
> +MBEDTLS_VERSION = 2.9.0

For master, I think it would make more sense to update to 2.7.3, which
fixes the same security issues. See
https://tls.mbed.org/tech-updates/releases/mbedtls-2.9.0-2.7.3-and-2.1.12-released.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
