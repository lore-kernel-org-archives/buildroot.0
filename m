From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 2 Jul 2017 18:06:26 +0200
Subject: [Buildroot] [PATCH 2/3 v3] package/ifupdown-scripts: not needed
 for systemd-networkd
In-Reply-To: <0a4f1d3dfcc2e8e58a07131e4f5d2519eb209e65.1499006091.git.yann.morin.1998@free.fr>
References: <cover.1499006091.git.yann.morin.1998@free.fr>
 <0a4f1d3dfcc2e8e58a07131e4f5d2519eb209e65.1499006091.git.yann.morin.1998@free.fr>
Message-ID: <bc8b5b57-1aea-ceed-254b-034b505924bf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-07-17 16:35, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/ifupdown-scripts/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ifupdown-scripts/Config.in b/package/ifupdown-scripts/Config.in
> index 629ee6a5bd..7086253a03 100644
> --- a/package/ifupdown-scripts/Config.in
> +++ b/package/ifupdown-scripts/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_IFUPDOWN_SCRIPTS
>  	bool
>  	depends on BR2_ROOTFS_SKELETON_DEFAULT
> +	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD
>  	default y
>  	help
>  	  Set of scripts used by ifupdown (either the standalone one, or the
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
