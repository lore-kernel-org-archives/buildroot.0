From: Will Moore <will.moore@beraninstruments.com>
Date: Fri, 30 Nov 2012 13:44:17 -0000
Subject: [Buildroot] [PATCH] [PATCH] reorder fs alphabetically
In-Reply-To: <1354280931-10379-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1354280931-10379-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <F0B2C5ED01234FFDB9A31357B89093E0@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeremy,

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
> Behalf Of J?r?my Rosen
> Sent: 30 November 2012 13:09
> 
> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> ---
> when adding the live target I was asked to add it in alphabetical order to
> the fs list
> 
> however that list was unsorted. This patch reorders FS properly (it doesn't
> add the live fs)
> ---
>  fs/Config.in |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/Config.in b/fs/Config.in
> index 94154ea..e970075 100644
> --- a/fs/Config.in
> +++ b/fs/Config.in
> @@ -4,12 +4,12 @@ source "fs/cramfs/Config.in"
>  source "fs/cloop/Config.in"
>  source "fs/ext2/Config.in"
>  source "fs/jffs2/Config.in"
> -source "fs/ubifs/Config.in"
> -source "fs/squashfs/Config.in"
> -source "fs/tar/Config.in"
>  source "fs/cpio/Config.in"
> -source "fs/iso9660/Config.in"
>  source "fs/initramfs/Config.in"
> +source "fs/iso9660/Config.in"
>  source "fs/romfs/Config.in"
> +source "fs/squashfs/Config.in"
> +source "fs/tar/Config.in"
> +source "fs/ubifs/Config.in"

Perhaps I misunderstand, but I would have thought cloop should be before cramfs,
jffs2 after iso9660 and cpio before ext2?

Will

> 
>  endmenu
> --
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
