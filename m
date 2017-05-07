From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 21:42:00 +0200
Subject: [Buildroot] [PATCH] package/rpi-firmware: fix unmet dependencies
In-Reply-To: <20170506212617.27587-1-yann.morin.1998@free.fr>
References: <20170506212617.27587-1-yann.morin.1998@free.fr>
Message-ID: <20170507214200.2633d4da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 May 2017 23:26:17 +0200, Yann E. MORIN wrote:
> Currently, vcdbg is only supported in 32-bit mode. Furthermore, vcdbg
> needs rpi-userland, which we currently only support in 32-bit mode.
> 
> Add a dependency on BR2_arm.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/rpi-firmware/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
