From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:52:08 +0100
Subject: [Buildroot] [PATCH] package/libatomic_ops: rename libatomic_ops
 supported arch Kconfig symbol
In-Reply-To: <1454881551-9526-1-git-send-email-romain.naour@gmail.com>
References: <1454881551-9526-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160207225208.76f8e18c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun,  7 Feb 2016 22:45:51 +0100, Romain Naour wrote:

> +config BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
> +	bool "libatomic_ops arch support option has been renamed"
> +	select BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS

This symbol is an hidden symbol, there is no need for legacy handling.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
