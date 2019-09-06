From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 6 Sep 2019 17:31:52 +0200
Subject: [Buildroot] [PATCH] configs/aarch64_efi: fix typo AARCH64 ->
 ARM64
In-Reply-To: <20190906101203.7549-1-romain.naour@smile.fr>
References: <20190906101203.7549-1-romain.naour@smile.fr>
Message-ID: <CAK4VdL0Eg81=g6Mj5jErPwSBODHnu979vgi-GNJKjuh5JAuEbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 6, 2019 at 12:12 PM Romain Naour <romain.naour@smile.fr> wrote:
>
> There is no option BR2_TARGET_GRUB2_AARCH64_EFI but
> BR2_TARGET_GRUB2_ARM64_EFI in grub2 package.
>
> BR2_TARGET_GRUB2_ARM64_EFI was introduced by the commit [1].
>
> [1] 273a27804a18c5e232907d5ef6bd01957cf090d7

Nice catch, thanks.

Reviewed-by: Erico Nunes <nunes.erico@gmail.com>
