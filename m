From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2009 22:54:46 +0200
Subject: [Buildroot] [PATCH] [LINUX 1/2] Remove unused file:
 "target/linux/Config.in.experimental"
In-Reply-To: <4A69DEF5.1020806@atmel.com>
References: <4A69DEF5.1020806@atmel.com>
Message-ID: <20090724225446.2533541c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 24 Jul 2009 18:19:01 +0200,
Ulf Samuelsson <ulf.samuelsson@atmel.com> a ?crit :

> Subject: [PATCH] Remove unused file: "target/linux/Config.in.experimental"

Thanks for the cleanup.

> -config BR2_PACKAGE_LINUX_KCONFIG
> -    string ".config file"
> -    depends on BR2_PACKAGE_LINUX_USE_KCONFIG
> -    default
> "$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(LINUX26_VERSION).config"

but your patch is word-wrapped, so it doesn't apply.

You can send your patches with "git send-email", or fix your
Thunderbird to not word-wrap.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
