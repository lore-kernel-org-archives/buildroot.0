From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Oct 2012 14:47:28 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain/uClibc: correct a slip of the
 pen
In-Reply-To: <20121024105439.5945.qmail@s221.sureserver.com>
References: <20121024105439.5945.qmail@s221.sureserver.com>
Message-ID: <20121024144728.2466f491@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Your patch is OK on the idea, but it isn't properly formatted. If you
generate your patch with git format-patch, then could you use git
send-email to send it?

On Wed, 24 Oct 2012 18:54:39 +0800, liaoxinglong at icubecorp.com wrote:
> From 3c5a0047108cb10d8e5e3605f002e12d02c53102 Mon Sep 17 00:00:00 2001
> From: Xinglong Liao <liaoxinglong@icubecorp.com>
> Date: Wed, 24 Oct 2012 18:42:05 +0800
> Subject: [PATCH]     toolchain/uClibc: correct a slip of the pen

The spaces between [PATCH] and toolchain/uClibc shouldn't be there

> 
>     UCLIB_EXTRA_CFLAGS->UCLIBC_EXTRA_CFLAGS
> 
>     Signed-off-by: Xinglong Liao <liaoxinglong@icubecorp.com>

Those lines shouldn't be indented.

Once this is fixed, your patch gets my:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
