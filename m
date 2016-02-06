From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 7 Feb 2016 00:10:29 +0100
Subject: [Buildroot] [PATCH v2 15/18] erlang-p1-yaml: bump to version
 1.0.0
In-Reply-To: <1454443064-14269-16-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-16-git-send-email-fhunleth@troodon-software.com>
Message-ID: <56B67D65.40906@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank, All,

Le 02/02/2016 20:57, Frank Hunleth a ?crit :
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/erlang-p1-yaml/erlang-p1-yaml.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.mk b/package/erlang-p1-yaml/erlang-p1-yaml.mk
> index 6f7c977..ba661b9 100644
> --- a/package/erlang-p1-yaml/erlang-p1-yaml.mk
> +++ b/package/erlang-p1-yaml/erlang-p1-yaml.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ERLANG_P1_YAML_VERSION = e1f081e
> +ERLANG_P1_YAML_VERSION = 1.0.0
>  ERLANG_P1_YAML_SITE = $(call github,processone,p1_yaml,$(ERLANG_P1_YAML_VERSION))
>  ERLANG_P1_YAML_LICENSE = Apache-2.0
>  ERLANG_P1_YAML_LICENSE_FILES = COPYING
> 
Same here, it seems we need to add erlang-p1-utils to the dependencies, see
rebbar.config.script:

    {deps, [{p1_utils, ".*", {git, "git://github.com/processone/p1_utils", {tag,
"1.0.2"}}}]},

Best regards,
Romain
