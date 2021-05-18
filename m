From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 18 May 2021 21:19:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/abootimg: Update to 1ebeb39,
 switch to ajs124
In-Reply-To: <20210325191911.27127-1-petr.vorel@gmail.com>
References: <20210325191911.27127-1-petr.vorel@gmail.com>
Message-ID: <YKQTX+krG0jHENRy@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping, please.

> ajs124 [1] has 2 fixes over than original [2].

> [1] https://gitlab.com/ajs124/abootimg
> [2] https://github.com/ggrandou/abootimg.

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/abootimg/abootimg.hash | 2 +-
>  package/abootimg/abootimg.mk   | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

> diff --git a/package/abootimg/abootimg.hash b/package/abootimg/abootimg.hash
> index fa5282c6c3..141db26860 100644
> --- a/package/abootimg/abootimg.hash
> +++ b/package/abootimg/abootimg.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256	eb8d912bc7b5454c2afd3385fd86f4917d3587c48a6f5ae45df7856d88502cab	abootimg-7e127fee6a3981f6b0a50ce9910267cd501e09d4.tar.gz
> +sha256	f377da42a57d982cfc22fa75c5a69febdc3e4c1ef43cd0ceaec42e14067e2f37	abootimg-1ebeb393252ab5aeed62e34bc439b6728444f06e-br1.tar.gz
>  sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	LICENSE
> diff --git a/package/abootimg/abootimg.mk b/package/abootimg/abootimg.mk
> index ab6c709318..a07100df5a 100644
> --- a/package/abootimg/abootimg.mk
> +++ b/package/abootimg/abootimg.mk
> @@ -4,8 +4,9 @@



> -ABOOTIMG_VERSION = 7e127fee6a3981f6b0a50ce9910267cd501e09d4
> -ABOOTIMG_SITE = $(call github,ggrandou,abootimg,$(ABOOTIMG_VERSION))
> +ABOOTIMG_VERSION = 1ebeb393252ab5aeed62e34bc439b6728444f06e
> +ABOOTIMG_SITE = https://gitlab.com/ajs124/abootimg.git
> +ABOOTIMG_SITE_METHOD = git
>  ABOOTIMG_LICENSE = GPL-2.0+
>  ABOOTIMG_LICENSE_FILES = LICENSE
