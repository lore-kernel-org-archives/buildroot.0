From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 09 Jun 2015 00:10:13 +0200
Subject: [Buildroot] [PATCH 3/3] mc: remove extra white space
In-Reply-To: <1433799967-7694-3-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1433799967-7694-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <1433799967-7694-3-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <557612C5.9080304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/08/15 23:46, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/mc/mc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mc/mc.mk b/package/mc/mc.mk
> index 742b8e8..2803c90 100644
> --- a/package/mc/mc.mk
> +++ b/package/mc/mc.mk
> @@ -7,7 +7,7 @@
>  MC_VERSION = 4.8.14
>  MC_SOURCE = mc-$(MC_VERSION).tar.xz
>  MC_SITE = http://ftp.midnight-commander.org
> -MC_LICENSE =  GPLv3+
> +MC_LICENSE = GPLv3+
>  MC_LICENSE_FILES = COPYING
>  MC_DEPENDENCIES = libglib2 host-pkgconf
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
