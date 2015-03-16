From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 14:15:56 +0100
Subject: [Buildroot] [PATCH v2 4/4] package/openocd: depends on libftdi1
 instead of libftdi
In-Reply-To: <1425813964-5295-5-git-send-email-s.martin49@gmail.com>
References: <1425813964-5295-1-git-send-email-s.martin49@gmail.com>
 <1425813964-5295-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20150316141556.32cbb501@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  8 Mar 2015 12:26:04 +0100, Samuel Martin wrote:

>  OPENOCD_DEPENDENCIES = \
> -	$(if $(BR2_PACKAGE_LIBFTDI),libftdi) \
> +	$(if $(BR2_PACKAGE_LIBFTDI),libftdi1) \

Again, untested patch. This should be:

	$(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \

Please fix and resend.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
