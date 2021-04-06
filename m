From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Apr 2021 22:34:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/check: bump to version 0.15.2
In-Reply-To: <20210406201058.1287596-1-fontaine.fabrice@gmail.com>
References: <20210406201058.1287596-1-fontaine.fabrice@gmail.com>
Message-ID: <bd846ed6-50e4-e32b-6709-d4c6e6819362@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/04/2021 22:10, Fabrice Fontaine wrote:
> https://github.com/libcheck/check/releases/tag/0.15.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/check/check.hash | 2 +-
>  package/check/check.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/check/check.hash b/package/check/check.hash
> index d00956c750..543e78f317 100644
> --- a/package/check/check.hash
> +++ b/package/check/check.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  c1cc3d64975c0edd8042ab90d881662f1571278f8ea79d8e3c2cc877dac60001  check-0.15.1.tar.gz
> +sha256  a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835eb1a52932fa20a  check-0.15.2.tar.gz
>  # License files, locally calculated
>  sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LESSER
> diff --git a/package/check/check.mk b/package/check/check.mk
> index f80e6b63b3..be82539469 100644
> --- a/package/check/check.mk
> +++ b/package/check/check.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CHECK_VERSION = 0.15.1
> +CHECK_VERSION = 0.15.2
>  CHECK_SITE = https://github.com/libcheck/check/releases/download/$(CHECK_VERSION)
>  CHECK_INSTALL_STAGING = YES
>  CHECK_DEPENDENCIES = host-pkgconf
> 
