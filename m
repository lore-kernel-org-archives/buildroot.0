From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 1 Sep 2015 17:08:35 +0100
Subject: [Buildroot] [PATCHv3] tar: move package to 'system tools'
In-Reply-To: <1441123521-6552-1-git-send-email-francesco.nwokeka@gmail.com>
References: <1441123521-6552-1-git-send-email-francesco.nwokeka@gmail.com>
Message-ID: <55E5CD83.8010607@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francesco Nwokeka,

On 09/01/2015 05:05 PM, Francesco Nwokeka wrote:
> Package was previously in the 'Development' section
> ---
>  package/Config.in | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 6ba21a1..58b7380 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -140,9 +140,6 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  endif
>  	source "package/sstrip/Config.in"
>  	source "package/subversion/Config.in"
> -if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> -	source "package/tar/Config.in"
> -endif
>  	source "package/tree/Config.in"
>  	source "package/yasm/Config.in"
>  endmenu
> @@ -1508,6 +1505,7 @@ endif
>  	source "package/systemd/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/sysvinit/Config.in"
> +	source "package/tar/Config.in"
>  endif
>  	source "package/util-linux/Config.in"
>  endmenu
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Could you please mark your two previous patches as superseded in
Patchwork? You will need to register if you don't have a Patchwork account.

Regards,

Vincent.
