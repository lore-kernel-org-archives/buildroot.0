From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:31:52 +0200
Subject: [Buildroot] [PATCH 0/8 v11] NVidia GPU binary blobs for
 Tegra2/3 (branch yem/gfx2)
In-Reply-To: <cover.1429635674.git.yann.morin.1998@free.fr>
References: <cover.1429635674.git.yann.morin.1998@free.fr>
Message-ID: <20150426223152.7ed42fe5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Apr 2015 19:04:39 +0200, Yann E. MORIN wrote:

> ----------------------------------------------------------------
> Nicolas Serafini (3):
>       package/nvidia-tegra23-binaries: new package
>       package.nvidia-tegra23-binaries: add gstreamer plugins
>       package/nvidia-tegra23-codecs: new package
> 
> Yann E. MORIN (5):
>       package/xserver_xorg-server: prepare for multiple supported versions
>       package/xserver_xorg-server: make the version a choice
>       package/xserver_xorg-server: add blind options to specify driver ABI
>       package/xserver_xorg-server: not all versions need all dependencies
>       package/xserver_xorg-server: add version 1.14.7

Series applied!

Nicolas, if you can give a test at the latest master, and check
everything is still working fine for you, it would be great.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
