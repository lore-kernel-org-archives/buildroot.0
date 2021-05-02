From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 2 May 2021 12:42:22 +0200
Subject: [Buildroot] [PATCH v4 05/10] configs/pc_x86_64_defconfig: build
 the EDK2 firmware from source
In-Reply-To: <TrwcjmViIZjJee2Ux7F7hOpZAqH0hQE0hjMKK4sRI@cp3-web-016.plabs.ch>
References: <TrwcjmViIZjJee2Ux7F7hOpZAqH0hQE0hjMKK4sRI@cp3-web-016.plabs.ch>
Message-ID: <CAK4VdL1kChSD=ss0bLWxR7tC4B9dPkw7EdaL0LPV1snmc23CNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 18, 2021 at 4:43 PM Dick Olsson <hi@senzilla.io> wrote:
>
> Prior to this, you had to manually download a pre-built EDK2 flash
> device image (OVMF_CODE.fd) in order to boot this configuration with
> QEMU. Now, the configuration is building EDK2 from source.
>
> Signed-off-by: Dick Olsson <hi@senzilla.io>
> ---
>  board/pc/readme.txt             | 9 ++++-----
>  configs/pc_x86_64_efi_defconfig | 2 ++
>  2 files changed, 6 insertions(+), 5 deletions(-)

I think the commit summary should be "configs/pc_x86_64_efi_defconfig"
(with _efi).
