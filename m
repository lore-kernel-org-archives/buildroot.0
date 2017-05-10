From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 10 May 2017 09:23:55 +0200
Subject: [Buildroot] [PATCH 2/2] docker-engine: bump to version
	17.05.0-ce
In-Reply-To: <20170510040050.31744-2-christian@paral.in>
References: <20170510040050.31744-1-christian@paral.in>
 <20170510040050.31744-2-christian@paral.in>
Message-ID: <CAPi7W81HP7E4Ce+_CRVJ9dhjodKWEVhL4v9xS=5bJ59eMf1WVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christian and all,

2017-05-10 6:00 GMT+02:00 Christian Stewart <christian@paral.in>:

> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/docker-engine/docker-engine.hash | 2 +-
>  package/docker-engine/docker-engine.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/docker-engine/docker-engine.hash
> b/package/docker-engine/docker-engine.hash
> index aa7c3ac..6c0ed33 100644
> --- a/package/docker-engine/docker-engine.hash
> +++ b/package/docker-engine/docker-engine.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 b6ee0aa93ecea44e956d3627907e10557b3ec37d13ddfb40e436656e5037c640
>       docker-engine-v17.04.0-ce.tar.gz
> +sha256 4716df117d867b82ddab2e82395cd40aa3d0925a689eedcec8919729e4c9f121
>       docker-engine-v17.05.0-ce.tar.gz
> diff --git a/package/docker-engine/docker-engine.mk
> b/package/docker-engine/docker-engine.mk
> index c4c1157..831b586 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -4,8 +4,8 @@
>  #
>  ############################################################
> ####################
>
> -DOCKER_ENGINE_VERSION = v17.04.0-ce
> -DOCKER_ENGINE_COMMIT = 4845c567eb35d68f35b0b1713a09b0c8d47fe67e
> +DOCKER_ENGINE_VERSION = v17.05.0-ce
> +DOCKER_ENGINE_COMMIT = 89658bed64c2a8fe05a978e5b87dbec409d57a0f
>  DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_
> ENGINE_VERSION))
>
Since April 18th (and so starting from this release), docker has been
renamed "moby": https://blog.docker.com/2017/04/introducing-the-moby-project
.
So, I would suggest to rename the docker-engine package to moby package,
update the repo and website URLs.
What's your opinion about this proposal? Do you think it's too early and we
should keep docker-engine for the time being?
If you agree, I would also suggest to rename docker-containerd to
containerd as containerd has now its own repository and website (
https://containerd.io)

>
>  DOCKER_ENGINE_LICENSE = Apache-2.0
> --
> 2.10.2
>
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170510/ff82cb75/attachment.html>
