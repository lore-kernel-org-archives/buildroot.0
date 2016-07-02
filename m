From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jul 2016 22:22:12 +0200
Subject: [Buildroot] [RFC 2/3] erlang-lager: add explicit dependencies
 for host variant
In-Reply-To: <1467485315-28264-3-git-send-email-julien.floret@6wind.com>
References: <1467485315-28264-1-git-send-email-julien.floret@6wind.com>
 <1467485315-28264-3-git-send-email-julien.floret@6wind.com>
Message-ID: <75018d9a-8b1b-f7a9-df4b-a1765ab9da83@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-07-16 20:48, Julien Floret wrote:
> Signed-off-by: Julien Floret <julien.floret@6wind.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/erlang-lager/erlang-lager.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
> index 19940a97514a..b55b6f7b7897 100644
> --- a/package/erlang-lager/erlang-lager.mk
> +++ b/package/erlang-lager/erlang-lager.mk
> @@ -9,6 +9,7 @@ ERLANG_LAGER_SITE = $(call github,basho,lager,$(ERLANG_LAGER_VERSION))
>  ERLANG_LAGER_LICENSE = Apache-2.0
>  ERLANG_LAGER_LICENSE_FILES = LICENSE
>  ERLANG_LAGER_DEPENDENCIES = erlang-goldrush
> +HOST_ERLANG_LAGER_DEPENDENCIES = host-erlang-goldrush
>  
>  $(eval $(rebar-package))
>  $(eval $(host-rebar-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
