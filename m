From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 6 Apr 2020 20:31:05 +0200
Subject: [Buildroot] [PATCH v2] Bump to version 75
In-Reply-To: <20200406141045.2668-1-grzegorz@blach.pl>
References: <20200308121526.80350-1-grzegorz@blach.pl>
 <20200406141045.2668-1-grzegorz@blach.pl>
Message-ID: <20200406203105.43af71e6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Grzegorz,

patch subject line should be

	package/pigpio: bump version to 75

Regards,
Peter

On Mon,  6 Apr 2020 16:10:45 +0200, m Blach <grzegorz@blach.pl> wrote:

> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
> Changes v1 -> v2:
>   - Bump from version 74 to 75
> ---
>  package/pigpio/pigpio.hash | 2 +-
>  package/pigpio/pigpio.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/pigpio/pigpio.hash b/package/pigpio/pigpio.hash
> index f20b9bf6bb..5b87acf082 100644
> --- a/package/pigpio/pigpio.hash
> +++ b/package/pigpio/pigpio.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256	87ec2ec87cb6cb0f42af47868631e657217b5927cdfbea3ad0ecdc2ca885a2d1  pigpio-7301.tar.gz
> +sha256	dfec8d06075a9336433d96a8e2f86810f3332d616cf0d6253d98ad78094aa15a  pigpio-75.tar.gz
>  sha256	6a90b88421a0d9b090e121daa11b3c6d55eed5eeb3281a2fcc454d6a28b5547c  UNLICENCE
> diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
> index aed5f2744d..89d8deb9ea 100644
> --- a/package/pigpio/pigpio.mk
> +++ b/package/pigpio/pigpio.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -PIGPIO_VERSION = 7301
> +PIGPIO_VERSION = 75
>  PIGPIO_SITE = $(call github,joan2937,pigpio,v$(PIGPIO_VERSION))
>  PIGPIO_LICENSE = Unlicense
>  PIGPIO_LICENSE_FILES = UNLICENCE
