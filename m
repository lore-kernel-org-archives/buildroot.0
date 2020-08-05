From: Yair Ben-Avraham <yairba@protonmail.com>
Date: Wed, 05 Aug 2020 10:24:11 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/rauc: bump version to 1.4
In-Reply-To: <KTOG_jC59vdKgtK3NgiEWU857Q6URAQ6zWUK4ORIl0enkXGOELn5TBss1E5v587yRL4Dsxmk93WuB-QIafW_ZoguoUxoIYyGXGqrAeMjAcw=@protonmail.com>
References: <KTOG_jC59vdKgtK3NgiEWU857Q6URAQ6zWUK4ORIl0enkXGOELn5TBss1E5v587yRL4Dsxmk93WuB-QIafW_ZoguoUxoIYyGXGqrAeMjAcw=@protonmail.com>
Message-ID: <oTj77KviaNpO_YChfGe66STn9Y73EoA9dbwQZSyI1ECj114RmmHs91V70U9lpHOQS76e-pswZBxVU1VcklCKg66i79WU0XLQhO5FGTR14OQ=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Should I re-commit this (signature URL changes)?


Yair Ben-Avraham
yairba at protonmail.com
+31.6.1316.5535

??????? Original Message ???????
On Monday, August 3, 2020 10:56 AM, Yair Ben-Avraham <yairba@protonmail.com> wrote:

> Signed-off-by: Yair Ben Avraham yairba at protonmail.com
>
> package/rauc/rauc.hash | 4 ++--
> package/rauc/rauc.mk | 2 +-
> 2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
> index b73eb60d86..d327122293 100644
> --- a/package/rauc/rauc.hash
> +++ b/package/rauc/rauc.hash
> @@ -1,4 +1,4 @@
>
> Locally calculated, after verifying against
>
> ============================================
>
> -# https://github.com/rauc/rauc/releases/download/v1.3/rauc-1.3.tar.xz.asc
> -sha256 4f6144447254753fcd19f2c5c70e79fa91d27253185b8928436f01528aa65e6c rauc-1.3.tar.xz
> +# https://github.com/rauc/rauc/releases/download/v1.4/rauc-1.4.tar.xz.asc
> +sha256 85aabf214cd93a37f7ad0b3aaad89eb94facf0f3ebf6e2edca945acbca9b0967 rauc-1.4.tar.xz
> sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
> diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
> index 5c5bd993ba..1915c783aa 100644
> --- a/package/rauc/rauc.mk
> +++ b/package/rauc/rauc.mk
> @@ -4,7 +4,7 @@
>
> ==
>
> ################################################################################
>
> -RAUC_VERSION = 1.3
> +RAUC_VERSION = 1.4
> RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
> RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
> RAUC_LICENSE = LGPL-2.1
>
> ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>
> 2.20.1
