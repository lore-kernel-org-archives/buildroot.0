From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Dec 2012 23:08:59 +0100
Subject: [Buildroot] [PATCH] toolchain/crosstool-ng: update config fro
 glibc-based toolchains
In-Reply-To: <1356040912-9830-1-git-send-email-yann.morin.1998@free.fr>
References: <1356040912-9830-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20121220230859.42de3da8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 20 Dec 2012 23:01:52 +0100, Yann E. MORIN wrote:

> -CT_LIBC_VERSION="2.9"
> +CT_LIBC_VERSION="2.14.1"

How does 2.14.1 plays with regard to RPC support? For now,
toolchain/toolchain-external/Config.in assumes that glibc and eglibc
toolchains have native RPC support. So if the bump to 2.14.1 implies
the lack of native RPC support, then the "select
BR2_TOOLCHAIN_HAS_NATIVE_RPC" should be removed.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
