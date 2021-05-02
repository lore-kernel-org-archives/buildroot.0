From: Christian Stewart <christian@paral.in>
Date: Sat, 1 May 2021 18:39:07 -0700
Subject: [Buildroot] [PATCH 1/1] package/docker-cli: bump version to
 20.10.6
In-Reply-To: <20210419102855.1444837-1-mario.fink@record-evolution.de>
References: <20210419102855.1444837-1-mario.fink@record-evolution.de>
Message-ID: <CA+h8R2o-v3kFzhMkSqKBMjJp2UM9gCUP7E-sYuqRUAwXbTRUDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Apr 19, 2021 at 3:29 AM Mario Fink
<mario.fink@record-evolution.de> wrote:
>
> [1] https://docs.docker.com/engine/release-notes/#20106
>
> Signed-off-by: Mario Fink <mario.fink@record-evolution.de>
> ---
> diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
> index f4787062bb..bb3444c270 100644
> --- a/package/docker-cli/docker-cli.hash
> +++ b/package/docker-cli/docker-cli.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  4ba845f8c7e2e0a2ca1ec6589847159ca8d0d37b609f0e6f78def7a893b9b342  docker-cli-20.10.5.tar.gz
> +sha256  eda53b96ab83a59502df2e5e00ab7ee867243259407ef454be55e695303c1113  docker-cli-20.10.6.tar.gz
>  sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
> diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
> index 39b4d09c76..9c3690e4c3 100644
> --- a/package/docker-cli/docker-cli.mk
> +++ b/package/docker-cli/docker-cli.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -DOCKER_CLI_VERSION = 20.10.5
> +DOCKER_CLI_VERSION = 20.10.6

Recommended for 2021.02.x

Tested-by: Christian Stewart <christian@paral.in>

Best regards,
Christian
