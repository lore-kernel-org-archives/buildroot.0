From: Carlos Santos <unixmania@gmail.com>
Date: Sun, 25 Aug 2019 17:18:18 -0300
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20190618
In-Reply-To: <20190825194124.24739-1-bernd.kuhls@t-online.de>
References: <20190825194124.24739-1-bernd.kuhls@t-online.de>
Message-ID: <CAJ4jsafO=hgTqVf1k88ysLChOOxT01VV+UusRcrvG+Zx_-ASow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 25, 2019 at 4:41 PM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> Release notes:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/blob/master/releasenote
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/intel-microcode/intel-microcode.hash | 2 +-
>  package/intel-microcode/intel-microcode.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
> index bb474ad2bb..fbf7109f1d 100644
> --- a/package/intel-microcode/intel-microcode.hash
> +++ b/package/intel-microcode/intel-microcode.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256 9e67903a5b62b51f5e031b59a8046d3dff226834d79899799943803481a55d20  intel-microcode-20190514a.tar.gz
> +sha256 74ec7415988d40fa53686d994cf8cb27accdbd35c5373c4c3afc2e93372ebba5  intel-microcode-20190618.tar.gz
>  sha256 1f8bf63fc2b1b486c507b98ff7d283c7eb58c7945746b94188a310d6787cbee5  license
> diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
> index 1279a1d364..74d5b6c5da 100644
> --- a/package/intel-microcode/intel-microcode.mk
> +++ b/package/intel-microcode/intel-microcode.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -INTEL_MICROCODE_VERSION = 20190514a
> +INTEL_MICROCODE_VERSION = 20190618
>  INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
>  INTEL_MICROCODE_LICENSE = PROPRIETARY
>  INTEL_MICROCODE_LICENSE_FILES = license
> --
> 2.20.1
>

Reviewed-by: Carlos Santos <unixmania@gmail.com>
