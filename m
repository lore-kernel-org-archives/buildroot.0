From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 15:25:11 +0200
Subject: [Buildroot] [PATCH 1/2] libump: new package
In-Reply-To: <1435306417-12448-1-git-send-email-francois.perrad@gadz.org>
References: <1435306417-12448-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150628152511.0b2ff4bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri, 26 Jun 2015 10:13:36 +0200, Francois Perrad wrote:

> +config BR2_PACKAGE_LIBUMP
> +	bool "libump"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC

There should have been a Config.in comment about this dependency, so
I've added it and applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
