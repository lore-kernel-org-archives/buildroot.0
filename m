From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 6 Jun 2013 20:56:28 +0200
Subject: [Buildroot] [PATCH 01/14] jsmin: fix github tarball to use
	commit id
In-Reply-To: <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
References: <bug-6302-163@https.bugs.busybox.net/>
 <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
Message-ID: <CAHXCMML7Wan5FqvqHjUnXxCpS2N628pJa-SDV_NT9A46uQASnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Spencer, all,

2013/6/6 Spenser Gilliland <spenser@gillilanding.com>:
>
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/jsmin/jsmin.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
> index 0e82008..bb65c6c 100644
> --- a/package/jsmin/jsmin.mk
> +++ b/package/jsmin/jsmin.mk
> @@ -1,5 +1,5 @@
>  JSMIN_VERSION = a9b4755
> -JSMIN_SITE = http://github.com/douglascrockford/JSMin/tarball/master
> +JSMIN_SITE = http://github.com/douglascrockford/JSMin/tarball/$(JSMIN_VERSION)
>
>  define JSMIN_BUILD_CMDS
>         $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
> --
> 1.7.9.5
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Also, it'd be nice to update the manual accordingly.

Regards,

-- 
Samuel
