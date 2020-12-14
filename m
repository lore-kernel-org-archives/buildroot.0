From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 14 Dec 2020 13:24:48 +0100
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.59
In-Reply-To: <20201117163311.537766-1-giulio.benetti@benettiengineering.com>
References: <20201117163311.537766-1-giulio.benetti@benettiengineering.com>
Message-ID: <4800d564-203e-972b-d14a-f6746653b13c@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this patch is substituted by this:
https://patchwork.ozlabs.org/project/buildroot/patch/20201214121703.1189147-1-giulio.benetti at benettiengineering.com/

since version advanced already.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 11/17/20 5:33 PM, Giulio Benetti wrote:
> Bump version to 3.59. Unfortunately local patch is still pending
> upstream and not applied due to Covid-19 latency:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1642174
> 
> Release Notes:
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.59_release_notes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/libnss/libnss.hash | 4 ++--
>   package/libnss/libnss.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 02593c7dde..23d906d65e 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_58_RTM/src/SHA256SUMS
> -sha256  9f73cf789b5f109b978e5239551b609b0cafa88d18f0bc8ce3f976cb629353c0  nss-3.58.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_59_RTM/src/SHA256SUMS
> +sha256  e6298174caa8527beacdc2858f77ed098d7047c1792846040e27e420fed0ce24  nss-3.59.tar.gz
>   # Locally calculated
>   sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 8e6a77d2cb..d27ce89eb9 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNSS_VERSION = 3.58
> +LIBNSS_VERSION = 3.59
>   LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>   LIBNSS_DISTDIR = dist
> 
