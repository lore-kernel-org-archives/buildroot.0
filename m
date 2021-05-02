From: Christian Stewart <christian@paral.in>
Date: Sat, 1 May 2021 18:39:24 -0700
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: bump version to
 20.10.6
In-Reply-To: <20210419104751.1446056-1-knif.oiram@gmail.com>
References: <20210419104751.1446056-1-knif.oiram@gmail.com>
Message-ID: <CA+h8R2rmKLBGuc_By_xJS4iPb6occrFCaRbRb+=4QXjZXj0+_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Apr 19, 2021 at 3:48 AM Mario Fink
<mario.fink@record-evolution.de> wrote:
>
> Signed-off-by: Mario Fink <knif.oiram@gmail.com>
> ---
>  package/docker-engine/docker-engine.hash | 2 +-
>  package/docker-engine/docker-engine.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
> index 7e3ce6a5cf..6c55b9a9b9 100644
> --- a/package/docker-engine/docker-engine.hash
> +++ b/package/docker-engine/docker-engine.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  bcf651d75e5c80421e8cd3b0d47f3425e01047cf67aef0eda83b68776905a583  docker-engine-20.10.5.tar.gz
> +sha256  fd7f5571b1f64f26b5ca520a3e1fefb33c190f3732b931051c23a76bdba5000e  docker-engine-20.10.6.tar.gz
>  sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index 767818ebba..10ecbf603a 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -DOCKER_ENGINE_VERSION = 20.10.5
> +DOCKER_ENGINE_VERSION = 20.10.6
>  DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
>
>  DOCKER_ENGINE_LICENSE = Apache-2.0
> --
> 2.25.1
>

Recommended for 2021.02.x

Tested-by: Christian Stewart <christian@paral.in>

Best regards,
Christian
