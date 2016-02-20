From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 23:35:51 +0100
Subject: [Buildroot] [PATCH v2 15/18] erlang-p1-yaml: bump to version
 1.0.0
In-Reply-To: <1454443064-14269-16-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-16-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160220233551.16158ec8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Tue,  2 Feb 2016 14:57:41 -0500, Frank Hunleth wrote:
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

Same problem as erlang-p1-xml: the dependency on erlang-p1-utils was
missing. I've added it and applied to the next branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
