From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Apr 2017 10:04:16 +0200
Subject: [Buildroot] [PATCH 1/2] package/libpng: Cleanup neon support
 options
In-Reply-To: <20170420213302.31155-1-bernd.kuhls@t-online.de>
References: <20170420213302.31155-1-bernd.kuhls@t-online.de>
Message-ID: <20170421100416.6f70aa9f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Apr 2017 23:33:01 +0200, Bernd Kuhls wrote:

> +ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
> +LIBPNG_CONF_OPTS += --enable-arm-neon=yes

Well, my suggestion was to use just --enable-arm-neon, not
--enable-arm-neon=yes.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
