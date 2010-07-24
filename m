From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jul 2010 19:58:18 +0200
Subject: [Buildroot] [PATCH 3/3] Remove gdb plugins from target
In-Reply-To: <1279970474-15052-3-git-send-email-m-starostik@versanet.de>
References: <201007241319.49745.m-starostik@versanet.de>
	<1279970474-15052-3-git-send-email-m-starostik@versanet.de>
Message-ID: <20100724195818.4b7c0bd6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 24 Jul 2010 13:21:14 +0200
Malte Starostik <m-starostik@versanet.de> wrote:

> +ifneq ($(BR2_HAVE_PACKAGE_GDB),y)

This option does not exist. It should probably be BR2_PACKAGE_GDB.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
