From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 20 Sep 2018 07:19:56 +0300
Subject: [Buildroot] [PATCH] boot/gummiboot: updated url
In-Reply-To: <1537382487-35071-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537382487-35071-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180920041956.rnukojrawrxyxmlr@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt

On Wed, Sep 19, 2018 at 01:41:27PM -0500, Matt Weber wrote:
> From: Matt Weber <matt@thewebers.ws>
> 

Missing sign-off.

> ---
>  boot/gummiboot/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/gummiboot/Config.in b/boot/gummiboot/Config.in
> index 11dbc4f..57d8d59 100644
> --- a/boot/gummiboot/Config.in
> +++ b/boot/gummiboot/Config.in
> @@ -20,4 +20,5 @@ config BR2_TARGET_GUMMIBOOT
>  	  exactly the same, except that the Gummiboot configuration
>  	  files will be located in /loader/ inside the EFI partition.
>  
> -	  http://freedesktop.org/wiki/Software/gummiboot/
> +          https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/

Indentation problem.

There is no mention of Gummiboot in this URL. Maybe change the package name as 
well?

> +

Redundant newline.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
