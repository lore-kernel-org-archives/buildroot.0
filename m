From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Apr 2021 22:36:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/rabbitmq-c: bump to version
 0.11.0
In-Reply-To: <20210406182911.1261348-1-fontaine.fabrice@gmail.com>
References: <20210406182911.1261348-1-fontaine.fabrice@gmail.com>
Message-ID: <bf166fe2-677c-37a1-79d6-54e3423cd4bd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/04/2021 20:29, Fabrice Fontaine wrote:
> Update indentation in hash file (two spaces)
> 
> https://github.com/alanxz/rabbitmq-c/releases/tag/v0.11.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/rabbitmq-c/rabbitmq-c.hash | 4 ++--
>  package/rabbitmq-c/rabbitmq-c.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rabbitmq-c/rabbitmq-c.hash b/package/rabbitmq-c/rabbitmq-c.hash
> index eb57626518..dc1406d3d5 100644
> --- a/package/rabbitmq-c/rabbitmq-c.hash
> +++ b/package/rabbitmq-c/rabbitmq-c.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 6455efbaebad8891c59f274a852b75b5cc51f4d669dfc78d2ae7e6cc97fcd8c0 rabbitmq-c-0.10.0.tar.gz
> -sha256 94a12c906acb31a66c2c8a6c1b6e46cab52bc5694c5ada2a06d86b05d3d3f422 LICENSE-MIT
> +sha256  437d45e0e35c18cf3e59bcfe5dfe37566547eb121e69fca64b98f5d2c1c2d424  rabbitmq-c-0.11.0.tar.gz
> +sha256  94a12c906acb31a66c2c8a6c1b6e46cab52bc5694c5ada2a06d86b05d3d3f422  LICENSE-MIT
> diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
> index e6ac52fd87..18ecaa3098 100644
> --- a/package/rabbitmq-c/rabbitmq-c.mk
> +++ b/package/rabbitmq-c/rabbitmq-c.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RABBITMQ_C_VERSION = 0.10.0
> +RABBITMQ_C_VERSION = 0.11.0
>  RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,v$(RABBITMQ_C_VERSION))
>  RABBITMQ_C_LICENSE = MIT
>  RABBITMQ_C_LICENSE_FILES = LICENSE-MIT
> 
