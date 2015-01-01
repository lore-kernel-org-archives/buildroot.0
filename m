From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 22:58:31 +0100
Subject: [Buildroot] [PATCH 4/7] package/rpi-firmware: only install
 images
In-Reply-To: <700164697cabeb6fb9fd5365bf6d9dfc17978021.1420142707.git.yann.morin.1998@free.fr>
References: <cover.1420142707.git.yann.morin.1998@free.fr>
 <700164697cabeb6fb9fd5365bf6d9dfc17978021.1420142707.git.yann.morin.1998@free.fr>
Message-ID: <20150101225831.538637b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu,  1 Jan 2015 21:23:50 +0100, Yann E. MORIN wrote:
> The rpi-firmware only installs images files, so it should use
> _INSTALL_IMAGES_CMDS and not _INSTALL_TARGET_CMDS.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/rpi-firmware/rpi-firmware.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
