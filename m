From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 14 Jul 2016 21:00:12 +0200
Subject: [Buildroot] [PATCH] package/rt-tests: switch to the upstream
 repository
In-Reply-To: <1468361294-13630-1-git-send-email-romain.naour@gmail.com>
References: <1468361294-13630-1-git-send-email-romain.naour@gmail.com>
Message-ID: <68c5ce25-4c97-1050-5cf3-1d4a5c65cb50@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 13/07/2016 ? 00:08, Romain Naour a ?crit :
> rt-tests is not maintained from Clark Williams's repository anymore.
> 

Please, discard this patch. I'll send it within a series that bump rt-tests
package to the latest version.

Best regards,
Romain


> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> We missed some rt-tests release (v0.90 to v1.0).
> Since v0.92 a release tarball is available at
> https://www.kernel.org/pub/linux/utils/rt-tests so we
> no longer need to clone the git repository.
> ---
>  package/rt-tests/rt-tests.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
> index 74d7c6d..380bacf 100644
> --- a/package/rt-tests/rt-tests.mk
> +++ b/package/rt-tests/rt-tests.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RT_TESTS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git
> +RT_TESTS_SITE = git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git
>  RT_TESTS_VERSION = v0.89
>  RT_TESTS_LICENSE = GPLv2+
>  RT_TESTS_LICENSE_FILES = COPYING
> 
