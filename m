From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Feb 2016 22:10:56 +0100
Subject: [Buildroot] [PATCH] eudev: Fix configure options for
 BR2_PACKAGE_EUDEV_RULES_DEV.
In-Reply-To: <20160224170404.GA22979@zenon.in.qult.net>
References: <20160224170404.GA22979@zenon.in.qult.net>
Message-ID: <56CE1C60.4090602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/24/16 18:04, Ignacy Gaw?dzki wrote:
> Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/eudev/eudev.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index fecd37c..942770c 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -30,7 +30,7 @@ EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
>  endif
>  
>  ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
> -EUDEV_CONF_OPTS += --enable-rule_generator
> +EUDEV_CONF_OPTS += --enable-rule-generator
>  endif
>  
>  ifeq ($(BR2_PACKAGE_EUDEV_ENABLE_HWDB),y)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
