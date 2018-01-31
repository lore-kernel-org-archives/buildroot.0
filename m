From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 31 Jan 2018 15:25:45 +0000
Subject: [Buildroot] [PATCH] dnsmask: update homepage link
In-Reply-To: <a66c32dbd41d94667d7c48626363604ed4817020.1517410588.git.baruch@tkos.co.il>
References: <a66c32dbd41d94667d7c48626363604ed4817020.1517410588.git.baruch@tkos.co.il>
Message-ID: <20180131152545.GD19300@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 31 Jan 2018 16:56:28 +0200, Baruch Siach <baruch@tkos.co.il> wrote:
> The doc.html seems like a better choice for a homepage link than the
> list of files in the containing directory listing.

Indeed :-)

> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/dnsmasq/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
> index 8921fc629dba..262aca688e56 100644
> --- a/package/dnsmasq/Config.in
> +++ b/package/dnsmasq/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_DNSMASQ
>  	  A lightweight DNS and DHCP server. It is intended to provide
>  	  coupled DNS and DHCP service to a LAN.
>  
> -	  http://www.thekelleys.org.uk/dnsmasq/
> +	  http://www.thekelleys.org.uk/dnsmasq/doc.html
>  
>  if BR2_PACKAGE_DNSMASQ
>  
> -- 
> 2.15.1

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180131/888c9692/attachment.asc>
