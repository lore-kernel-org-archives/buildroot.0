From: Erico Nunes <nunes.erico@gmail.com>
Date: Sat, 8 Dec 2018 16:10:57 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add entry for
 aarch64_efi_defconfig
In-Reply-To: <20181208150121.4146-1-thomas.petazzoni@bootlin.com>
References: <20181208150121.4146-1-thomas.petazzoni@bootlin.com>
Message-ID: <CAK4VdL0ZRQxOp0pj4YfiWVo26vzSco3yrDwEmNO2jk2TArc99w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 8, 2018 at 4:01 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Erico Nunes recently contributed this defconfig, we can safely assume
> he is willing to maintain it.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Fair enough :)

Acked-by: Erico Nunes <nunes.erico@gmail.com>

> ---
>  DEVELOPERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c289b3f0c5..2209346f0a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -658,6 +658,8 @@ F:  package/pifmrds/
>  F:     package/ympd/
>
>  N:     Erico Nunes <nunes.erico@gmail.com>
> +F:     board/aarch64-efi/
> +F:     configs/aarch64_efi_defconfig
>  F:     package/acpica/
>  F:     package/acpitool/
>  F:     package/efibootmgr/
> --
> 2.19.2
>
