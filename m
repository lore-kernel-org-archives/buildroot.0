From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 30 Nov 2012 06:42:07 +0100
Subject: [Buildroot] [PATCH v2] libroxml: bump version to 2.2.1
In-Reply-To: <1354245658-7675-1-git-send-email-blunderer@blunderer.org>
References: <1354245658-7675-1-git-send-email-blunderer@blunderer.org>
Message-ID: <CAHXCMM+aQy32Bbt+ENeeu-y5r+VinsnoJ1J3QftuUqZMH8jchw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tristan,

2012/11/30  <blunderer@blunderer.org>:
> From: Tristan Lelong <tristan.lelong@blunderer.org>
>
> Thank you Arnout for your quick answer.
> I regenerated the patch according to your advice.
>
> Regards,
>
> Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>
> ---

Well,keep the commit as much relevent as possible, without personal comment.

If you want to add additional comments that aren't supposed to go in the git log
message, add it below the Signed-off-by line, separated by ---.
Then git-am will remove that part automatically.
This comment section is usually used for the changelog in case of
update of the patch.
So typically you'll see:

Signed-off-by: ...
---
Some comments.

v2:
* fix this
* rework that as suggested by John Doe


>  .../{libroxml-2.2.0-werror.patch => libroxml-werror.patch}       |    6 +++---
>  package/libroxml/libroxml.mk                                     |    2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename package/libroxml/{libroxml-2.2.0-werror.patch => libroxml-werror.patch} (86%)
>
> diff --git a/package/libroxml/libroxml-2.2.0-werror.patch b/package/libroxml/libroxml-werror.patch
> similarity index 86%
> rename from package/libroxml/libroxml-2.2.0-werror.patch
> rename to package/libroxml/libroxml-werror.patch
> index a72f2a7..a99962f 100644
> --- a/package/libroxml/libroxml-2.2.0-werror.patch
> +++ b/package/libroxml/libroxml-werror.patch
> @@ -7,10 +7,10 @@ Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
>   Makefile |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -Index: libroxml-2.1.0/Makefile
> +Index: a/Makefile
>  ===================================================================
> ---- libroxml-2.1.0.orig/Makefile
> -+++ libroxml-2.1.0/Makefile
> +--- a/Makefile
> ++++ b/Makefile
>  @@ -41,7 +41,7 @@
>
>   # options
The change in package/libroxml/libroxml-2.2.0-werror.patch does not
seem really needed, though the renaming is ok.


> diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
> index 457a28a..d7ef6a4 100644
> --- a/package/libroxml/libroxml.mk
> +++ b/package/libroxml/libroxml.mk
> @@ -2,7 +2,7 @@
>  # libroxml
>  #
>
> -LIBROXML_VERSION = 2.2.0
> +LIBROXML_VERSION = 2.2.1
>  LIBROXML_SITE = http://libroxml.googlecode.com/files
>  LIBROXML_INSTALL_STAGING = YES
>
> --


Regards,

-- 
Sam
