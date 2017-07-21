From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 22:46:59 +0200
Subject: [Buildroot] [PATCH] uboot: bump to version 2017.07
In-Reply-To: <20170712192903.20486-1-joerg.krause@embedded.rocks>
References: <20170712192903.20486-1-joerg.krause@embedded.rocks>
Message-ID: <20170721224659.1f0da013@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jul 2017 21:29:03 +0200, J?rg Krause wrote:
> Add a new config option BR2_TARGET_UBOOT_NEEDS_PYLIBFDT for U-Boot
> targets, like sunxi, needing the Python libfdt library.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  boot/uboot/Config.in  | 12 ++++++++++--
>  boot/uboot/uboot.hash |  2 +-
>  boot/uboot/uboot.mk   |  4 ++++
>  3 files changed, 15 insertions(+), 3 deletions(-)

Applied to master after dropping the bogus selects on HOST_PYTHON and
HOST_SWIG.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
