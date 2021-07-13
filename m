From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Jul 2021 21:46:52 +0200
Subject: [Buildroot] [PATCH 1/2] package/flatbuffers: bump to version
 2.0.0
In-Reply-To: <20210612154305.545978-1-fontaine.fabrice@gmail.com>
References: <20210612154305.545978-1-fontaine.fabrice@gmail.com>
Message-ID: <0195aad9-b6fe-2247-e17d-8a8a9c5f7918@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/06/2021 17:43, Fabrice Fontaine wrote:
> https://github.com/google/flatbuffers/releases/tag/v2.0.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Both applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/flatbuffers/flatbuffers.hash | 2 +-
>  package/flatbuffers/flatbuffers.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
> index 82ef942799..b05b9e7b4b 100644
> --- a/package/flatbuffers/flatbuffers.hash
> +++ b/package/flatbuffers/flatbuffers.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  62f2223fb9181d1d6338451375628975775f7522185266cd5296571ac152bc45  flatbuffers-1.12.0.tar.gz
> +sha256  9ddb9031798f4f8754d00fca2f1a68ecf9d0f83dfac7239af1311e4fd9a565c4  flatbuffers-2.0.0.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
> diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
> index 814751f30b..280834c2d4 100644
> --- a/package/flatbuffers/flatbuffers.mk
> +++ b/package/flatbuffers/flatbuffers.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLATBUFFERS_VERSION = 1.12.0
> +FLATBUFFERS_VERSION = 2.0.0
>  FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
>  FLATBUFFERS_LICENSE = Apache-2.0
>  FLATBUFFERS_LICENSE_FILES = LICENSE.txt
> 
