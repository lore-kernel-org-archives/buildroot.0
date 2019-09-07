From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 21:57:40 +0200
Subject: [Buildroot] [PATCH] configs/aarch64_efi: fix typo AARCH64 ->
 ARM64
In-Reply-To: <20190906101203.7549-1-romain.naour@smile.fr>
References: <20190906101203.7549-1-romain.naour@smile.fr>
Message-ID: <20190907215740.521eab5e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Sep 2019 12:12:03 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> There is no option BR2_TARGET_GRUB2_AARCH64_EFI but
> BR2_TARGET_GRUB2_ARM64_EFI in grub2 package.
> 
> BR2_TARGET_GRUB2_ARM64_EFI was introduced by the commit [1].
> 
> [1] 273a27804a18c5e232907d5ef6bd01957cf090d7
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> ---
>  configs/aarch64_efi_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
