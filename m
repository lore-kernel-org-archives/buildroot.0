From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 22 Sep 2016 12:16:42 +0200
Subject: [Buildroot] [PATCH 3/3] Patches to update at91bootstrap3
 package to 3.8.6 version
In-Reply-To: <1474537834-6002-3-git-send-email-biagio.hkr@gmail.com>
References: <1474537834-6002-1-git-send-email-biagio.hkr@gmail.com>
 <1474537834-6002-3-git-send-email-biagio.hkr@gmail.com>
Message-ID: <CA+TH9VntdBhcwLcdRKR3ga7hR+uQ0nkw5EhX2aUQ1SQcJuuVmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Biagio,

2016-09-22 11:50 GMT+02:00 Biagio Montaruli <biagio.hkr@gmail.com>:

> - boot/at91bootstrap3/Config.in :
>   add support for the latest version (3.8.6) of AT91bootstrap
>
> - boot/at91bootstrap3/at91bootstrap3.hash :
>   add the hash file of at91bootstrap-3.8.6.tar.gz
>

This patch should have a subject like:

boot/at91bootstrap3: bump to version 3.8.6


>
> Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
> ---
>  boot/at91bootstrap3/Config.in           | 4 ++--
>  boot/at91bootstrap3/at91bootstrap3.hash | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
> index b8ebe80..237deb9 100644
> --- a/boot/at91bootstrap3/Config.in
> +++ b/boot/at91bootstrap3/Config.in
> @@ -15,7 +15,7 @@ choice
>         prompt "AT91 Bootstrap 3 version"
>
>  config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
> -       bool "3.8"
> +       bool "3.8.6"
>
>  config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
>         bool "Custom Git repository"
> @@ -40,7 +40,7 @@ endif
>
>  config BR2_TARGET_AT91BOOTSTRAP3_VERSION
>         string
> -       default "v3.8" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
> +       default "v3.8.6" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
>         default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
>                 if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
>
> diff --git a/boot/at91bootstrap3/at91bootstrap3.hash
> b/boot/at91bootstrap3/at91bootstrap3.hash
> index eee6482..a3389b7 100644
> --- a/boot/at91bootstrap3/at91bootstrap3.hash
> +++ b/boot/at91bootstrap3/at91bootstrap3.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 ae7bb3f8e631f5216f05fd4650b37f2e76d88d0b893bd680f4f398f33b8f3470
> at91bootstrap3-v3.8.tar.gz
> +sha256 a2e9ec6f42ee3b5a805fe215257b63070b6c498d57c568c46fcb18fd1b38ea7e
> at91bootstrap-3.8.6.tar.gz
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160922/dfb83b35/attachment.html>
