From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 9 Mar 2012 07:36:28 +0100
Subject: [Buildroot] [PATCH 06/13] Rename Makefile.cmake.in to
	pkg-cmaketargets.mk
In-Reply-To: <ef899409e3e1ebdb45553340fcbf3fe94354003a.1331148806.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
 <ef899409e3e1ebdb45553340fcbf3fe94354003a.1331148806.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LVsDGrB1e+79QU3s33ZmLEC0h5t-HKV9Nc_amAgWqUdfA@mail.gmail.com>
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
> ?package/{Makefile.cmake.in => pkg-cmaketargets.mk} | ? ?0
> ?2 files changed, 1 insertions(+), 1 deletions(-)
> ?rename package/{Makefile.cmake.in => pkg-cmaketargets.mk} (100%)
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 0a0f94d..5f0d00a 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -299,5 +299,5 @@ SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
> ?endif
>
> ?include package/pkg-autotargets.mk
> -include package/Makefile.cmake.in
> +include package/pkg-cmaketargets.mk
> ?include package/Makefile.package.in
> diff --git a/package/Makefile.cmake.in b/package/pkg-cmaketargets.mk
> similarity index 100%
> rename from package/Makefile.cmake.in
> rename to package/pkg-cmaketargets.mk
> --
> 1.7.4.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
