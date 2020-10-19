From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 19 Oct 2020 11:56:32 +0300
Subject: [Buildroot] [PATCH 1/2] package/docker-cli: bump to version
 19.03.13
In-Reply-To: <20201019085039.3429230-1-christian@paral.in>
References: <20201019085039.3429230-1-christian@paral.in>
Message-ID: <878sc2vbjz.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Mon, Oct 19 2020, Christian Stewart wrote:
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/docker-cli/docker-cli.mk | 2 +-

What about docker-cli.hash?

>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
> index c6448ca660..86fffafdb8 100644
> --- a/package/docker-cli/docker-cli.mk
> +++ b/package/docker-cli/docker-cli.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DOCKER_CLI_VERSION = 19.03.12
> +DOCKER_CLI_VERSION = 19.03.13
>  DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
>  
>  DOCKER_CLI_LICENSE = Apache-2.0

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
