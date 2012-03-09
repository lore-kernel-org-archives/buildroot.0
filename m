From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 9 Mar 2012 07:35:43 +0100
Subject: [Buildroot] [PATCH 05/13] Rename Makefile.autotools.in to
	pkg-autotargets.mk
In-Reply-To: <6f9208d76730dea4602b8bb3cc076bdb9def9539.1331148806.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
 <6f9208d76730dea4602b8bb3cc076bdb9def9539.1331148806.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWuqeKM-8PFGiEXWQXrmJD9uyAFX_qNUx89tkcQgT_BfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 7, 2012 at 8:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

> ---
> ?package/Makefile.in ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?| ? ?2 +-
> ?.../{Makefile.autotools.in => pkg-autotargets.mk} ?| ? ?0
> ?2 files changed, 1 insertions(+), 1 deletions(-)
> ?rename package/{Makefile.autotools.in => pkg-autotargets.mk} (100%)
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index dc8d038..0a0f94d 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -298,6 +298,6 @@ else
> ?SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
> ?endif
>
> -include package/Makefile.autotools.in
> +include package/pkg-autotargets.mk
> ?include package/Makefile.cmake.in
> ?include package/Makefile.package.in
> diff --git a/package/Makefile.autotools.in b/package/pkg-autotargets.mk
> similarity index 100%
> rename from package/Makefile.autotools.in
> rename to package/pkg-autotargets.mk


In addition you should fix the comment

> --
> 1.7.4.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
