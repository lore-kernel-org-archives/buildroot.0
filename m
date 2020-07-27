From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 27 Jul 2020 23:02:33 +0200
Subject: [Buildroot] [PATCH v2 4/6] configs/pc_x86_64_defconfig: build
 the EDK2 firmware from source
In-Reply-To: <20200726100541.7710-5-hi@senzilla.io>
References: <20200726100541.7710-5-hi@senzilla.io>
Message-ID: <CAK4VdL1J_boHnwYD0R_=5cKxM6TpWEX2Qrn5CFdCq6j0v8+xnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 26, 2020 at 12:07 PM D. Olsson <hi@senzilla.io> wrote:
>
> From: Dick Olsson <hi@senzilla.io>
>
> Prior to this, you had to manually download a pre-built EDK2 flash device
> image (OVMF_CODE.fd) in order to boot this configuration with QEMU.
> Now, the configuration is building EDK2 from source.
>
> Signed-off-by: Dick Olsson <hi@senzilla.io>
> ---
>  board/pc/readme.txt             | 9 ++++-----
>  configs/pc_x86_64_efi_defconfig | 2 ++

This looks ok to me, just please adjust the commit summary to say
pc_x86_64_efi_defconfig instead of pc_x86_64_defconfig to avoid
confusion (the other pc_ defconfig doesn't need edk2).
