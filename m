From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Thu, 24 Oct 2013 11:02:01 +0200
Subject: [Buildroot] [PATCH] libfreefare: new repository
In-Reply-To: <1382605205-7965-1-git-send-email-arnaud.aujon@gmail.com>
References: <1382605205-7965-1-git-send-email-arnaud.aujon@gmail.com>
Message-ID: <CACjG4B+r7YBsnVYLPWER1fW9j2UNQOtd0zTBsjduGto-574e3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry I miss the patch description but I guess the title is self explaining.

Regards,

Arnaud


2013/10/24 Arnaud Aujon <arnaud.aujon@gmail.com>

> Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
> ---
>  package/libfreefare/libfreefare.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/
> libfreefare.mk
> index 859b5e3..8dcd6b8 100644
> --- a/package/libfreefare/libfreefare.mk
> +++ b/package/libfreefare/libfreefare.mk
> @@ -5,7 +5,7 @@
>
>  ################################################################################
>
>  LIBFREEFARE_VERSION = 0.3.4
> -LIBFREEFARE_SITE = http://nfc-tools.googlecode.com/files
> +LIBFREEFARE_SITE = http://libfreefare.googlecode.com/files
>  LIBFREEFARE_DEPENDENCIES = libnfc openssl
>
>  $(eval $(autotools-package))
> --
> 1.8.3.1
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131024/ef218922/attachment.html>
