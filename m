From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jan 2013 18:05:54 +0100
Subject: [Buildroot] [PATCH 3/3] initramfs: add support for LZO and XZ
 compression methods
In-Reply-To: <1358808943-17063-3-git-send-email-gustavo@zacarias.com.ar>
References: <1358808943-17063-1-git-send-email-gustavo@zacarias.com.ar>
 <1358808943-17063-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130122180554.6c540102@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 21 Jan 2013 19:55:43 -0300, Gustavo Zacarias wrote:

> +config BR2_TARGET_ROOTFS_CPIO_LZO
> +	bool "lzo"
> +	help
> +	  Do compress the cpio filesystem with lzo.
> +
> +config BR2_TARGET_ROOTFS_CPIO_XZ
> +	bool "xz"
> +	help
> +	  Do compress the cpio filesystem with xz.

I don't remember exactly, but isn't the kernel build process itself
capable of compressing the initramfs already? I remember we had some
discussion about this a while ago, but I don't remember the outcome of
these. Arnout was leading this discussion, IIRC.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
