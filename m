From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 22:51:20 +0200
Subject: [Buildroot] [PATCH v4] package/libuio: new package
In-Reply-To: <1467390742-19307-1-git-send-email-romain.naour@smile.fr>
References: <1467390742-19307-1-git-send-email-romain.naour@smile.fr>
Message-ID: <20160701225120.3472fa87@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 18:32:22 +0200, Romain Naour wrote:

> +# v0.2.7
> +LIBUIO_VERSION = 940861de278cb794bf9d775b76a4d1d4f9108607
> +LIBUIO_SITE = $(call github,Linutronix,libuio,$(LIBUIO_VERSION))
> +LIBUIO_LICENSE = LGPLv2.1

The library is under LGPLv2.1 indeed, but there are also two programs
that are installed, which are under GPLv2, so I've adjusted this line
and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
