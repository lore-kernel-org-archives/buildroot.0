From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 22:19:06 +0200
Subject: [Buildroot] [PATCH 2/4] linux-headers: bump default to version
 4.7
In-Reply-To: <1469404570-19495-2-git-send-email-festevam@gmail.com>
References: <1469404570-19495-1-git-send-email-festevam@gmail.com>
 <1469404570-19495-2-git-send-email-festevam@gmail.com>
Message-ID: <20160725221906.35324140@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 20:56:08 -0300, Fabio Estevam wrote:

> +	config BR2_KERNEL_HEADERS_4_7
> +		bool "Linux 4.7.x kernel headers"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7

You're selecting a symbol that doesn't exist here. Your patch 3/4
should have come before 2/4.

So I've applied this patch, but after applying 3/4.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
