From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 9 Jan 2018 18:22:16 +0530
Subject: [Buildroot] [PATCH 2/2] orangepi: drop custom post-build and
 post-image scripts
In-Reply-To: <20180107201130.12952-3-geomatsi@gmail.com>
References: <20180107201130.12952-1-geomatsi@gmail.com>
 <20180107201130.12952-3-geomatsi@gmail.com>
Message-ID: <CAMty3ZAjTOOmr9ATiSu9_nV4nwd7doEd9VmM2zxCYiajDKe4Yw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 8, 2018 at 1:41 AM, Sergey Matyukevich <geomatsi@gmail.com> wrote:
> Currently in Orange Pi boards post-build script is used only to generate
> U-Boot boot script and post-image script is used only to generate sdcard
> image according to genimage configuration. However both those tasks can
> now be handled by generic Buildroot tools:
> - BR2_TARGET_UBOOT_BOOT_SCRIPT config options
> - support/scripts/genimage.sh script
>
> This patch drops custom scripts replacing them
> by generic Buildroot tools.
>
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
