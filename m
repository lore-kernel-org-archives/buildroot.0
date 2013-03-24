From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 00:04:20 +0100
Subject: [Buildroot] [PATCH 09/14] Added package foomatic-filters
In-Reply-To: <d3c3ed22f4740cdb98c47b8650314cfc86468650.1364165310.git.yann.morin.1998@free.fr>
References: <cover.1364165310.git.yann.morin.1998@free.fr>
 <d3c3ed22f4740cdb98c47b8650314cfc86468650.1364165310.git.yann.morin.1998@free.fr>
Message-ID: <20130325000420.005eaf04@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 24 Mar 2013 23:50:44 +0100, Yann E. MORIN wrote:

> +	select BR2_PACKAGE_LIBUSB

	# libusb dependency
	depends on BR2_TOOLCHAIN_HAS_THREADS

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
