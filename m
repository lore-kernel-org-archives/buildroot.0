From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Apr 2017 14:31:41 +0200
Subject: [Buildroot] [PATCH 1/2] odroid-mali: rename pkg to odroid-gl
In-Reply-To: <20170417065654.28313-1-daggs@gmx.com>
References: <20170417065654.28313-1-daggs@gmx.com>
Message-ID: <20170417143141.6ea473b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Apr 2017 09:56:53 +0300, Dagg Stompler wrote:
> this pkg provides the GL implementation for the odroidc2 broad.
> mali is the name of the kernel gpu driver, this might cause some
> confusion. thus rename it for odroid-gl

Mali is not the name of the kernel gpu driver, Mali is the name of the
GPU sold by ARM. So both the kernel driver and the userspace blob are
Mali-related.

In addition, we already have sunxi-mali for Allwinner platforms, and
mali-t76x. So please keep the odroid-mali name.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
