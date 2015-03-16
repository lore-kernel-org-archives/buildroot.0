From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 Mar 2015 09:40:57 +0200
Subject: [Buildroot] [PATCH 1/2] connman: bump to version 1.28
In-Reply-To: <1426491225-12515-1-git-send-email-petr.vorel@gmail.com>
References: <1426491225-12515-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <20150316074057.GE2415@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,

On Mon, Mar 16, 2015 at 08:33:44AM +0100, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/connman/connman.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> index 4d9b03e..4b55392 100644
> --- a/package/connman/connman.mk
> +++ b/package/connman/connman.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CONNMAN_VERSION = 1.27
> +CONNMAN_VERSION = 1.28

Please update the connman.hash file. Adding a .hash to ofono while bumping 
would also be nice.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
