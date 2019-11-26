From: Alexander Dahl <post@lespocky.de>
Date: Tue, 26 Nov 2019 16:49:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/fastd: update the upstream URL
 in Config.in
In-Reply-To: <20191126140726.24080-1-mark@dibsco.co.uk>
References: <20191126140726.24080-1-mark@dibsco.co.uk>
Message-ID: <20191126154922.3wjkclqtmlff6pn6@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: Alexander Dahl <post@lespocky.de>

On Tue, Nov 26, 2019 at 02:07:26PM +0000, Mark Corbin wrote:
> Update the upstream URL in the help text in Config.in. This
> addresses the 'Invalid(404)' URL status in the package stats
> web page output.
> 
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> ---
>  package/fastd/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/fastd/Config.in b/package/fastd/Config.in
> index 1d0b052bd9..c4f296dd63 100644
> --- a/package/fastd/Config.in
> +++ b/package/fastd/Config.in
> @@ -10,7 +10,7 @@ config BR2_PACKAGE_FASTD
>  	help
>  	  Fast and Secure Tunneling Daemon
>  
> -	  https://projects.universe-factory.net/projects/fastd/wiki
> +	  https://github.com/NeoRaider/fastd/wiki
>  
>  if BR2_PACKAGE_FASTD
>  
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191126/64f9be11/attachment.asc>
