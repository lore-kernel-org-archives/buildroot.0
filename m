From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 21 Sep 2013 12:52:08 +0200
Subject: [Buildroot] [PATCH 1/1] Reorders the real-time menu
In-Reply-To: <1780223206.7314002.1379758803708.JavaMail.root@openwide.fr>
References: <1768460875.7313954.1379758544122.JavaMail.root@openwide.fr>
 <1780223206.7314002.1379758803708.JavaMail.root@openwide.fr>
Message-ID: <CAAXf6LXap=_bfYzakprYzsOy9nPYvSa5dBku9McN10KvAdoc0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 21, 2013 at 12:20 PM, Romain Naour <romain.naour@openwide.fr> wrote:
>
> Reported-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/Config.in b/package/Config.in
> index 911cba1..aac0c12 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -911,8 +911,8 @@ endif
>  endmenu
>
>  menu "Real-Time"
> -source "package/xenomai/Config.in"
>  source "package/rtai/Config.in"
> +source "package/xenomai/Config.in"
>  endmenu
>
>  menu "Shell and utilities"
> --

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
