From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Apr 2010 18:06:37 +0200
Subject: [Buildroot] Still can't build working rootfs with crosstool-NG
 toolchain
In-Reply-To: <hqhq8e$uau$1@dough.gmane.org>
References: <hqhq8e$uau$1@dough.gmane.org>
Message-ID: <20100419180637.241cbdd0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Apr 2010 14:44:30 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> I've spend the past week trying to use crosstool-NG instead of
> buildroot to build a toolchain.  I had been using external buildroot
> toolchains for the past couple months with no problems. But, that is
> unsupported by buildroot, and I'm giving up fighting that battle.

Come on, it is *not* unsupported. We are trying to support it, but
facing issues.

> It doesn't seem to matter which toolchain I use to build the kernel, I
> get the same results with both kernels. I'm using an Atmel
> AT91SAM9G20EK development board, gcc 4.4.3, uClibc 0.9.30.2.

The problem might be related to OABI vs. EABI. What's the configuration
of the toolchain, the Buildroot configuration, and the kernel
configuration for this ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
