From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 10:45:16 +0200
Subject: [Buildroot] [PATCH 3/3] linux-header: bump default to version
 4.11
In-Reply-To: <20170501072645.5571-3-s.martin49@gmail.com>
References: <20170501072645.5571-1-s.martin49@gmail.com>
 <20170501072645.5571-3-s.martin49@gmail.com>
Message-ID: <20170501104516.62d9d8c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 May 2017 09:26:45 +0200, Samuel Martin wrote:

> +config BR2_KERNEL_HEADERS_4_11
> +	bool "Linux 4.11.x kernel headers"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11

You're selecting a symbol that does not exist. Look at
369b66fc366e3841ffb4dd2d35696f27799ae374 for the needed changes to add
a new kernel headers series.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
