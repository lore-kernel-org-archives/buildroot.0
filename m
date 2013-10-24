From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Oct 2013 15:36:18 +0200
Subject: [Buildroot] [PATCH 1/2] packages/Config.in: Alphabetical
	entries sorting
In-Reply-To: <1382620587-22563-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1382620587-22563-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CAAXf6LWFbCs8VTFyn_jzbW-EPcx8Waz10Ue0Cuug0VCQVqFHMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On Thu, Oct 24, 2013 at 3:16 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> This patch moves :
>   "Filesystem and flash utilities" menu
>   "X applications" category
>   "Misc devices firmwares" menu
>   "JSON/XML" menu
> so they are in alphabetical order with the rest of the file.
> ---
>  package/Config.in | 132 +++++++++++++++++++++++++++---------------------------
>  1 file changed, 66 insertions(+), 66 deletions(-)
>
> diff --git a/package/Config.in b/package/Config.in
> index 0e6f86c..ebbdeb5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -129,6 +129,32 @@ source "package/vala/Config.in"
>  source "package/yasm/Config.in"
>  endmenu
>
> +menu "Filesystem and flash utilities"
> +source "package/cifs-utils/Config.in"
> +source "package/cramfs/Config.in"
> +source "package/curlftpfs/Config.in"
> +source "package/dosfstools/Config.in"
> +source "package/e2fsprogs/Config.in"
> +source "package/ecryptfs-utils/Config.in"
> +source "package/exfat/Config.in"
> +source "package/exfat-utils/Config.in"
> +source "package/f2fs-tools/Config.in"
> +source "package/flashbench/Config.in"
> +source "package/genext2fs/Config.in"
> +source "package/genromfs/Config.in"
> +source "package/kobs-ng/Config.in"
> +source "package/makedevs/Config.in"
> +source "package/mtd/Config.in"
> +source "package/nfs-utils/Config.in"
> +source "package/ntfs-3g/Config.in"
> +source "package/squashfs/Config.in"
> +source "package/squashfs3/Config.in"
> +source "package/sshfs/Config.in"
> +source "package/sunxi-tools/Config.in"
> +source "package/unionfs/Config.in"
> +source "package/xfsprogs/Config.in"
> +endmenu
> +
>  menu "Games"
>  source "package/doom-wad/Config.in"
>  source "package/gnuchess/Config.in"
> @@ -187,18 +213,6 @@ source "package/qt5/Config.in"
>  source "package/x11r7/Config.in"
>  source "package/weston/Config.in"
>
> -comment "X libraries and helper libraries"
> -source "package/liberation/Config.in"
> -source "package/libsexy/Config.in"
> -source "package/x11r7/xkeyboard-config/Config.in"
> -
> -comment "X Window managers"
> -source "package/blackbox/Config.in"
> -source "package/enlightenment/Config.in"
> -source "package/fluxbox/Config.in"
> -source "package/matchbox/Config.in"
> -source "package/metacity/Config.in"
> -
>  comment "X applications"
>  source "package/alsamixergui/Config.in"
>  source "package/docker/Config.in"
> @@ -222,42 +236,19 @@ source "package/xterm/Config.in"
>  source "package/xvkbd/Config.in"
>  endmenu
>
> -menu "Filesystem and flash utilities"
> -source "package/cifs-utils/Config.in"
> -source "package/cramfs/Config.in"
> -source "package/curlftpfs/Config.in"
> -source "package/dosfstools/Config.in"
> -source "package/e2fsprogs/Config.in"
> -source "package/ecryptfs-utils/Config.in"
> -source "package/exfat/Config.in"
> -source "package/exfat-utils/Config.in"
> -source "package/f2fs-tools/Config.in"
> -source "package/flashbench/Config.in"
> -source "package/genext2fs/Config.in"
> -source "package/genromfs/Config.in"
> -source "package/kobs-ng/Config.in"
> -source "package/makedevs/Config.in"
> -source "package/mtd/Config.in"
> -source "package/nfs-utils/Config.in"
> -source "package/ntfs-3g/Config.in"
> -source "package/squashfs/Config.in"
> -source "package/squashfs3/Config.in"
> -source "package/sshfs/Config.in"
> -source "package/sunxi-tools/Config.in"
> -source "package/unionfs/Config.in"
> -source "package/xfsprogs/Config.in"
> -endmenu
> +comment "X libraries and helper libraries"
> +source "package/liberation/Config.in"
> +source "package/libsexy/Config.in"
> +source "package/x11r7/xkeyboard-config/Config.in"
> +
> +comment "X Window managers"
> +source "package/blackbox/Config.in"
> +source "package/enlightenment/Config.in"
> +source "package/fluxbox/Config.in"
> +source "package/matchbox/Config.in"
> +source "package/metacity/Config.in"
>
>  menu "Hardware handling"
> -menu "Misc devices firmwares"
> -source "package/am33x-cm3/Config.in"
> -source "package/b43-firmware/Config.in"
> -source "package/linux-firmware/Config.in"
> -source "package/rpi-firmware/Config.in"
> -source "package/sunxi-boards/Config.in"
> -source "package/ux500-firmware/Config.in"
> -source "package/zd1211-firmware/Config.in"
> -endmenu
>  source "package/a10disp/Config.in"
>  source "package/acpid/Config.in"
>  source "package/cdrkit/Config.in"
> @@ -304,6 +295,15 @@ source "package/mdadm/Config.in"
>  source "package/media-ctl/Config.in"
>  source "package/memtester/Config.in"
>  source "package/minicom/Config.in"
> +menu "Misc devices firmwares"
> +source "package/am33x-cm3/Config.in"
> +source "package/b43-firmware/Config.in"
> +source "package/linux-firmware/Config.in"
> +source "package/rpi-firmware/Config.in"
> +source "package/sunxi-boards/Config.in"
> +source "package/ux500-firmware/Config.in"
> +source "package/zd1211-firmware/Config.in"
> +endmenu
>  source "package/nanocom/Config.in"
>  source "package/neard/Config.in"
>  source "package/ofono/Config.in"

I can follow all changes, except this one: the 'Misc devices
firmwares' menu is a submenu, between normal packages. Moving that in
alphabetical order between normal packages seems very odd to me.
Especially because the name 'Misc' does not carry a real meaning.

By the way, I don't think that 'firmwares' is correct English, the
'-ware' already is plural, so it should be 'Misc devices firmware' or
maybe plain 'Firmware' (are there other firmware packages in buildroot
that are not part of this menu?).


Best regards,
Thomas
