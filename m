From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Mon, 6 Nov 2017 15:09:14 +0530
Subject: [Buildroot] [PATCH v5 00/11] board: Add Allwinner A64/H5 boards
In-Reply-To: <1509559553-26544-1-git-send-email-jagan@amarulasolutions.com>
References: <1509559553-26544-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <CAD6G_RRovKuVcVzreKh=K7HSzOddSBg+jau3CYdhwd-fBM_bVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 1, 2017 at 11:35 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
> This patchset fix wiki link and update dtb file for sopine board.
> [1] was previous set.
>
> All boards now use Mainline U-Boot, Linux and Nanaopi A64, A64-olinuxino
> used linux-next patches since 4.13.7 have not been merged.
>
> Tested on rea hardware.
>
> Changes for v5:
> - Fixed wiki links
> - Update dtb file for sopine
> Changes for v4:
> - Added "arm-trusted-firmware: Build FIP for BL33" patch
> - Added "uboot: Add U-Boot-bundles-ATF support" patch
> - Droped sunxi64-post-build.sh config and script file
> Changes for v3:
> - Fixed Bananapi M1 comment on config file
> - Add sunxi64-post-build.sh
> - Add all sunxi64 boards
> Changes for v2:
> - Rebase on master
>
> [1] http://buildroot-busybox.2317881.n4.nabble.com/PATCH-v4-00-11-board-Add-Allwinner-A64-H5-boards-td178509.html
>
> Jagan Teki (11):
>   arm-trusted-firmware: Build FIP for BL33
>   uboot: Add U-Boot-bundles-ATF support
>   board: Add Bananapi M64 support
>   board: Add Pine64 support
>   board: Add SoPine support
>   board: Add FriendlyARM Nanopi A64 support
>   board: Add FriendlyARM Nanopi NEO2 support
>   board: Add Olimex A64-OLinuXino support
>   board: Add Orangepi Win/Win Plus support
>   board: Add Orangepi Prime support
>   board: Add Orangepi Zero Plus2 support

Any comments?

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
