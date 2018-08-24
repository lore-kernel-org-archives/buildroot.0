From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:50:18 +0200
Subject: [Buildroot] [PATCHv2] package/mesa3d: vulkan with x11 needs dri3
In-Reply-To: <20180823144036.14231-1-yann.morin.1998@free.fr>
References: <20180823144036.14231-1-yann.morin.1998@free.fr>
Message-ID: <20180824235018.4f309a67@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Aug 2018 16:40:36 +0200, Yann E. MORIN wrote:
> Vulcan with X11 needs DRI3, which in turn requires xlib-libxshmfence.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/356/35653fc6f57dc169a8aae6baedb1acd1049b50ec/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> ---
> Changes v1 -> v2:
>   - ensure we can still disable all DRI drivers  (Thomas)
> ---
>  package/mesa3d/Config.in | 3 +++
>  package/mesa3d/mesa3d.mk | 2 ++
>  2 files changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
