From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 22:58:16 +0200
Subject: [Buildroot] [PATCH] package/nvidia-driver: install an egl.pc
In-Reply-To: <20170829204959.17003-1-yann.morin.1998@free.fr>
References: <20170829204959.17003-1-yann.morin.1998@free.fr>
Message-ID: <20170829225816.475d3db4@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Aug 2017 22:49:59 +0200, Yann E. MORIN wrote:
> A lot of packages expect an egl.pc to decide that EGL is available. So,
> provide one.
> 
> As suggested by Alexandre, use the one from nvidia-tegra23 as template.
> 
> Reported-by: Alexandre Maumen? <alexandre@maumene.org>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Alexandre Maumen? <alexandre@maumene.org>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Note: ideally, we should also provide a glesv2.pc, and possibly a
> wayland-egl.pc as well. That can be folowup patches.
> ---
>  package/nvidia-driver/egl.pc           | 10 ++++++++++
>  package/nvidia-driver/nvidia-driver.mk |  1 +
>  2 files changed, 11 insertions(+)
>  create mode 100644 package/nvidia-driver/egl.pc

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
