From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2019 10:52:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/util-linux: fix licence
 definition formatting
In-Reply-To: <1571820259-28691-1-git-send-email-simon.rowe@citrix.com>
References: <1571820259-28691-1-git-send-email-simon.rowe@citrix.com>
Message-ID: <c16b3c06-a405-f15c-3c0e-30108ddd8e9c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/10/2019 10:44, Simon Rowe wrote:
> Signed-off-by: Simon Rowe <simon.rowe@citrix.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/util-linux/util-linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 534cff2..7bd7a89 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -11,7 +11,7 @@ UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERS
>  
>  # README.licensing claims that some files are GPL-2.0 only, but this is not true.
>  # Some files are GPL-3.0+ but only in tests. rfkill uses an ISC-style license.
> -UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid) ISC (rfkill)
> +UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid), ISC (rfkill)
>  UTIL_LINUX_LICENSE_FILES = README.licensing \
>  	Documentation/licenses/COPYING.BSD-3-Clause \
>  	Documentation/licenses/COPYING.BSD-4-Clause-UC \
> 
