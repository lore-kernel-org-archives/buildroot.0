From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 25 Mar 2019 10:43:45 +0530
Subject: [Buildroot] [PATCH v2] board: rename pine64 to pine64_a64
In-Reply-To: <20190202040519.14568-1-philip.a.molloy@gmail.com>
References: <20190202040519.14568-1-philip.a.molloy@gmail.com>
Message-ID: <CAMty3ZAodmPT6=aX3wFvwY-r6O6p5XVN3qgG5s5E-anft1Ku2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 2, 2019 at 9:35 AM <philip.a.molloy@gmail.com> wrote:
>
> From: Philip Molloy <philip.a.molloy@gmail.com>
>

I'm commenting based on the code, since there is not commit message
for this patch.

> Signed-off-by: Philip Molloy <philip.a.molloy@gmail.com>
> ---
>  DEVELOPERS                                         | 2 +-
>  board/pine64/{pine64 => a64}/boot.cmd              | 0
>  board/pine64/{pine64 => a64}/genimage.cfg          | 0
>  board/pine64/{pine64 => a64}/readme.txt            | 8 ++++----
>  configs/{pine64_defconfig => pine64_a64_defconfig} | 4 ++--
>  5 files changed, 7 insertions(+), 7 deletions(-)
>  rename board/pine64/{pine64 => a64}/boot.cmd (100%)
>  rename board/pine64/{pine64 => a64}/genimage.cfg (100%)
>  rename board/pine64/{pine64 => a64}/readme.txt (80%)
>  rename configs/{pine64_defconfig => pine64_a64_defconfig} (93%)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c1950bb0f4..d54708add5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -999,7 +999,7 @@ F:  configs/orangepi_pc2_defconfig
>  F:     configs/orangepi_prime_defconfig
>  F:     configs/orangepi_win_defconfig
>  F:     configs/orangepi_zero_plus2_defconfig
> -F:     configs/pine64_defconfig
> +F:     configs/pine64_a64_defconfig
>  F:     configs/pine64_sopine_defconfig
>
>  N:     James Hilliard <james.hilliard1@gmail.com>
> diff --git a/board/pine64/pine64/boot.cmd b/board/pine64/a64/boot.cmd
> similarity index 100%
> rename from board/pine64/pine64/boot.cmd
> rename to board/pine64/a64/boot.cmd
> diff --git a/board/pine64/pine64/genimage.cfg b/board/pine64/a64/genimage.cfg
> similarity index 100%
> rename from board/pine64/pine64/genimage.cfg
> rename to board/pine64/a64/genimage.cfg

pine64 is vendor who produced pine64 board. and same vendor producing
sopine. so renaming to a64 doesn't valid.

> diff --git a/board/pine64/pine64/readme.txt b/board/pine64/a64/readme.txt
> similarity index 80%
> rename from board/pine64/pine64/readme.txt
> rename to board/pine64/a64/readme.txt
> index 85226fdd17..c35bf62037 100644
> --- a/board/pine64/pine64/readme.txt
> +++ b/board/pine64/a64/readme.txt
> @@ -2,10 +2,10 @@ Intro
>  =====
>
>  This default configuration will allow you to start experimenting with the
> -buildroot environment for the Pine64. With the current configuration
> +buildroot environment for the Pine A64. With the current configuration
>  it will bring-up the board, and allow access through the serial console.
>
> -Pine64 link:
> +Pine A64 link:
>  https://www.pine64.org/?page_id=1194

It has wiki link below, that intern routing pine64 board link. wiki
has Mainline stuff information.
