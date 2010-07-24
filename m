From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jul 2010 19:56:34 +0200
Subject: [Buildroot] [PATCH 1/3] Globally remove aclocal directories
 from target
In-Reply-To: <1279970474-15052-1-git-send-email-m-starostik@versanet.de>
References: <201007241319.49745.m-starostik@versanet.de>
	<1279970474-15052-1-git-send-email-m-starostik@versanet.de>
Message-ID: <20100724195634.1c615d32@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 24 Jul 2010 13:21:12 +0200
Malte Starostik <m-starostik@versanet.de> wrote:

> * Remove $(TARGET_DIR)/usr/share/aclocal from target-finalize when not
>   installing devfiles and
> * Remove some (now) redundant cleanup from individual packages
> 
> Signed-off-by: Malte Starostik <m-starostik@versanet.de>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
