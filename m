From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 7 Feb 2016 00:07:36 +0100
Subject: [Buildroot] [PATCH v2 14/18] erlang-p1-xml: bump to version
	1.1.1
In-Reply-To: <1454443064-14269-15-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-15-git-send-email-fhunleth@troodon-software.com>
Message-ID: <56B67CB8.2090603@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank, All,

Le 02/02/2016 20:57, Frank Hunleth a ?crit :
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> Changes v1->v2:
>   - Fix license file name
> 
>  package/erlang-p1-xml/erlang-p1-xml.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
> index f81d3e5..36c1537 100644
> --- a/package/erlang-p1-xml/erlang-p1-xml.mk
> +++ b/package/erlang-p1-xml/erlang-p1-xml.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -ERLANG_P1_XML_VERSION = 2c61083
> +ERLANG_P1_XML_VERSION = 1.1.1
>  ERLANG_P1_XML_SITE = $(call github,processone,xml,$(ERLANG_P1_XML_VERSION))
>  ERLANG_P1_XML_LICENSE = GPLv2+
> -ERLANG_P1_XML_LICENSE_FILES = COPYING
> +ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
>  ERLANG_P1_XML_DEPENDENCIES = expat

erlang-p1_utils seems to be a dependency of erlang-p1-xml, see rebar.config:

{deps, [{p1_utils, ".*", {git, "git://github.com/processone/p1_utils", {tag,
"1.0.0"}}}]}.

Best regards,
Romain

>  ERLANG_P1_XML_INSTALL_STAGING = YES
>  
> 
