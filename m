From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Feb 2016 21:35:56 +0100
Subject: [Buildroot] [PATCH] Makefile: Add help to nobuild_targets.
In-Reply-To: <20160226164805.GA6142@zenon.in.qult.net>
References: <20160226164805.GA6142@zenon.in.qult.net>
Message-ID: <56D0B72C.5050309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/26/16 17:48, Ignacy Gaw?dzki wrote:
> Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 The subject line shouldn't end with a . though.

 Regards,
 Arnout

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 90018b4..c43c599 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -94,7 +94,7 @@ noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconf
>  # something else than one of the nobuild_targets.
>  nobuild_targets := source source-check \
>  	legal-info external-deps _external-deps \
> -	clean distclean
> +	clean distclean help
>  ifeq ($(MAKECMDGOALS),)
>  BR_BUILDING = y
>  else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
