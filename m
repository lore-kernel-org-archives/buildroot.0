From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 22:47:54 +0200
Subject: [Buildroot] [PATCH 2/2] configs/bananapro: bump U-Boot to
 version 2017.07
In-Reply-To: <20170712194432.21975-2-joerg.krause@embedded.rocks>
References: <20170712194432.21975-1-joerg.krause@embedded.rocks>
 <20170712194432.21975-2-joerg.krause@embedded.rocks>
Message-ID: <20170721224754.1a71d0e7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jul 2017 21:44:32 +0200, J?rg Krause wrote:
> Note, that since version 2017.07 the sunxi targets needs the Python
> libfdt library on the host. Therefore, additionally select the U-Boot
> config option BR2_TARGET_UBOOT_NEEDS_PYLIBFDT.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  configs/bananapro_defconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
