From: Tristan Lelong <blunderer@blunderer.org>
Date: Wed, 28 Sep 2011 23:48:01 +0200
Subject: [Buildroot] [git commit] libroxml: bump version
In-Reply-To: <20110927213337.045DE8D9E7@busybox.osuosl.org>
References: <20110927213337.045DE8D9E7@busybox.osuosl.org>
Message-ID: <CAJb9USVpC8B6sNmc5O1=EnbVkoUe=JyHFNAyTf6J_u=-PXTZ4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

thank you for the version bump. I was wondering what is the best: send
a patch whenever I release a new version or wait for some "big"
changes or fixes to be done?
As I do not have a strict release cycle, there can be sometimes 2
release in a month, and nothing for 3 months after that.

Regards


2011/9/27 Peter Korsgaard <jacmet@sunsite.dk>:
> commit: http://git.buildroot.net/buildroot/commit/?id=c6fe0f1ee7246649c04370bf126c6d766f6e0f19
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
> ?....0-werror.patch => libroxml-2.1.1-werror.patch} | ? ?0
> ?package/libroxml/libroxml.mk ? ? ? ? ? ? ? ? ? ? ? | ? ?2 +-
> ?2 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/package/libroxml/libroxml-2.1.0-werror.patch b/package/libroxml/libroxml-2.1.1-werror.patch
> similarity index 100%
> rename from package/libroxml/libroxml-2.1.0-werror.patch
> rename to package/libroxml/libroxml-2.1.1-werror.patch
> diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
> index 88d3e66..ccaf492 100644
> --- a/package/libroxml/libroxml.mk
> +++ b/package/libroxml/libroxml.mk
> @@ -2,7 +2,7 @@
> ?# libroxml
> ?#
>
> -LIBROXML_VERSION = 2.1.0
> +LIBROXML_VERSION = 2.1.1
> ?LIBROXML_SITE = http://libroxml.googlecode.com/files
> ?LIBROXML_INSTALL_STAGING = YES
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
618FE3EF
