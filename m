From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 10 Dec 2020 19:48:19 +0100
Subject: [Buildroot] [PATCH v1 14/14] package/gst1-shark: bump version
 to v0.7.2
In-Reply-To: <20201209212716.15472-14-ps.report@gmx.net>
References: <20201209212716.15472-1-ps.report@gmx.net>
 <20201209212716.15472-14-ps.report@gmx.net>
Message-ID: <20201210194819.74a27885@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Wed,  9 Dec 2020 22:27:16 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/gstreamer1/gst1-shark/gst1-shark.hash | 4 ++--
>  package/gstreamer1/gst1-shark/gst1-shark.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash b/package/gstreamer1/gst1-shark/gst1-shark.hash
> index 6f8365cb16..6b4d59f07e 100644
> --- a/package/gstreamer1/gst1-shark/gst1-shark.hash
> +++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
> @@ -1,5 +1,5 @@
>  # locally computed hash
> -sha256 aec7f0bbb81775922da2c94a4f84b64b5efd38a616f0d07eb4c3ddb5770b728d  gst1-shark-v0.7.1.tar.gz
> +sha256  24d910c2e7b4c66c804e53e9f3fc18fb61b0d3b82d8580f0fa9c2b1c563e5ab3  gst1-shark-v0.7.2.tar.gz
>
>  # Hashes for license files:
> -sha256 6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
> +sha256  6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
> diff --git a/package/gstreamer1/gst1-shark/gst1-shark.mk b/package/gstreamer1/gst1-shark/gst1-shark.mk
> index 146d1f8456..ea0c5a29cd 100644
> --- a/package/gstreamer1/gst1-shark/gst1-shark.mk
> +++ b/package/gstreamer1/gst1-shark/gst1-shark.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -GST1_SHARK_VERSION = v0.7.1
> +GST1_SHARK_VERSION = v0.7.2
>  GST1_SHARK_SITE =  https://github.com/RidgeRun/gst-shark.git
>  GST1_SHARK_SITE_METHOD = git
>  GST1_SHARK_GIT_SUBMODULES = YES

There is already a patch ([1]) from Chris Packham pre-dating this one doing
the same (despite the hash-two-spaces-format change)...

Regards,
Peter

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20201111075156.4955-1-judge.packham at gmail.com/
