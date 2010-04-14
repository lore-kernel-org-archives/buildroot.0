From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Apr 2010 15:59:02 +0200
Subject: [Buildroot] [PATCH 11/41] sysstat: drop target installation
 option (it's on by default)
In-Reply-To: <1271199974-30434-12-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-12-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100414155902.4df4f752@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 14 Apr 2010 01:05:44 +0200
llandwerlin at gmail.com wrote:

> From: Lionel Landwerlin <llandwerlin@gmail.com>
> 
> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
> ---
>  package/sysstat/sysstat.mk |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
> index 324580e..2b220d6 100644
> --- a/package/sysstat/sysstat.mk
> +++ b/package/sysstat/sysstat.mk
> @@ -10,7 +10,6 @@ SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard/
>  SYSSTAT_AUTORECONF = NO
>  SYSSTAT_LIBTOOL_PATCH = NO
>  SYSSTAT_INSTALL_STAGING = NO
> -SYSSTAT_INSTALL_TARGET = YES
>  
>  # Should be --disable-man-group, it might be a little mistake in the
>  # configure.in script.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Note that the SYSSTAT_INSTALL_STAGING and SYSSTAT_AUTORECONF could be
dropped as well.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
