From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Sep 2013 17:20:41 +0200
Subject: [Buildroot] [PATCH] i2c-tools: Add i2c-dev.h to staging
 directory for userspace i2c drivers.
In-Reply-To: <1380017924-20072-1-git-send-email-jouko.nikula@espotel.com>
References: <1380017924-20072-1-git-send-email-jouko.nikula@espotel.com>
Message-ID: <20130924172041.57ec6b88@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jouko Nikula,

On Tue, 24 Sep 2013 13:18:43 +0300, Jouko Nikula wrote:

> +define I2C_TOOLS_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m644 $(@D)/include/linux/i2c-dev.h $(STAGING_DIR)/usr/include/linux/
> +endef

This header is already part of the kernel headers, so it should already
be part of the toolchain. Do you have a specific case where this header
is missing?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
