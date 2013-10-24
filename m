From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2013 14:25:43 +0200
Subject: [Buildroot] [PATCH] libfreefare: new repository
In-Reply-To: <CACjG4B+r7YBsnVYLPWER1fW9j2UNQOtd0zTBsjduGto-574e3Q@mail.gmail.com>
References: <1382605205-7965-1-git-send-email-arnaud.aujon@gmail.com>
 <CACjG4B+r7YBsnVYLPWER1fW9j2UNQOtd0zTBsjduGto-574e3Q@mail.gmail.com>
Message-ID: <526911C7.7080803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/10/13 11:02, arnaud aujon wrote:
> Sorry I miss the patch description but I guess the title is self explaining.

  Yes, it's good enough.


  Regards,
  Arnout

>
> Regards,
>
> Arnaud
>
>
> 2013/10/24 Arnaud Aujon <arnaud.aujon@gmail.com
> <mailto:arnaud.aujon@gmail.com>>
>
>     Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com
>     <mailto:arnaud.aujon@gmail.com>>
>     ---
>       package/libfreefare/libfreefare.mk <http://libfreefare.mk> | 2 +-
>       1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/package/libfreefare/libfreefare.mk
>     <http://libfreefare.mk> b/package/libfreefare/libfreefare.mk
>     <http://libfreefare.mk>
>     index 859b5e3..8dcd6b8 100644
>     --- a/package/libfreefare/libfreefare.mk <http://libfreefare.mk>
>     +++ b/package/libfreefare/libfreefare.mk <http://libfreefare.mk>
>     @@ -5,7 +5,7 @@
>       ################################################################################
>
>       LIBFREEFARE_VERSION = 0.3.4
>     -LIBFREEFARE_SITE = http://nfc-tools.googlecode.com/files
>     +LIBFREEFARE_SITE = http://libfreefare.googlecode.com/files
>       LIBFREEFARE_DEPENDENCIES = libnfc openssl
>
>       $(eval $(autotools-package))
>     --
>     1.8.3.1
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
