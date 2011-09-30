From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Sep 2011 22:21:38 +0200
Subject: [Buildroot] [PATCH 2/4] util-linux: disable installing binaries
 by default
In-Reply-To: <1317412052-28859-2-git-send-email-gustavo@zacarias.com.ar>
References: <1317412052-28859-1-git-send-email-gustavo@zacarias.com.ar>
 <1317412052-28859-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20110930222138.2c80696e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 30 Sep 2011 16:47:30 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> +config BR2_PACKAGE_UTIL_LINUX_BASIC
> +	bool "install basic utilities"
> +	help
> +	  Install the basic util-linux binaries.
> +

I don't see where this new option is being used.

> +define UTIL_LINUX_INSTALL_TARGET_CMDS
> +	$(UTIL_LINUX_INSTALL_BASIC)

And where this variable is defined.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
