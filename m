From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Mar 2014 23:23:43 +0100
Subject: [Buildroot] [PATCH v4 2/2] libuci: new package
In-Reply-To: <1395266096-7649-2-git-send-email-yegorslists@googlemail.com>
References: <1395266096-7649-1-git-send-email-yegorslists@googlemail.com>
 <1395266096-7649-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <20140319232343.71252ef2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Wed, 19 Mar 2014 22:54:56 +0100, Yegor Yefremov wrote:

> +config BR2_PACKAGE_LIBUCI
> +	bool "libuci"
> +	select BR2_PACKAGE_LIBUBOX
> +	help
> +	  libuci is intended to centralize the whole configuration
> +	  of a device running OpenWrt. This package will also install

What is a "device running OpenWrt" in the context of Buildroot ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
