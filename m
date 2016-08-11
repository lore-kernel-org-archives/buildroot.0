From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 22:35:49 +0200
Subject: [Buildroot] [PATCH 1/1] util-linux: bump version to 2.28.1
In-Reply-To: <1470938996-10477-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1470938996-10477-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160811223549.50c52467@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Aug 2016 23:39:56 +0530, Rahul Bedarkar wrote:

> +if BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +
> +config BR2_PACKAGE_UTIL_LINUX_LIBUUID_FORCE_UUIDD
> +	bool "force uuidd"
> +	depends on !BR2_PACKAGE_UTIL_LINUX_UUIDD
> +	help
> +	  Support uuidd even though the uuidd daemon is disabled.

What is the motivation for this new config option? Just that a new
--enable-<foo> has appeared in util-linux?

Also, I'm note quite sure to understand what it does, and therefore if
the chosen dependencies are correct. Could you give some more details?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
