Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1240FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 18:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FA0760BD5;
	Mon,  9 May 2022 18:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYbkc0irsdZ1; Mon,  9 May 2022 18:10:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4713760B00;
	Mon,  9 May 2022 18:10:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E5651BF283
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 18:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7590F60B04
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 18:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-C-uHTG6FRJ for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 18:10:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 112EC606F5
 for <buildroot@buildroot.org>; Mon,  9 May 2022 18:10:41 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 9906A4406E6;
 Mon,  9 May 2022 21:09:40 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1652119780;
 bh=/6X1JymJaPSHAjDmoGx2B6ga6SyTeHMvg0uid6RQdPA=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=Up2fT5y0MDzZ6/G+eOYazPz+/AE+xoyNJNoT7cjkA4eyfeN0CYXBe9xFVCFx798Jj
 NVKweidbu73uz9ASM5WGlmiSjJ5HS4EptkTJA2JsOxy8FRT7B0bt9YpD2i96XYsBo9
 phMUq0qrPiNnhga20zoEOkZvcog2c9aLeOLrMSidFDEXamtU5KZQ6khO+v1W1ahXBp
 9s59SOGPuK2YeqUffiux5wm+amfQ9+OkEfqtQaO8f3yy4JljWTgUWavKSWnhX5KMfQ
 nFEOCwM3ZXmP/bNngmMNTrCervqj/fN1Or8tMIduIKnTreQ2uEPljNewZfyM3omUly
 Z1X+bxVONJYPw==
References: <20220509161258.188861-1-francois.perrad@gadz.org>
User-agent: mu4e 1.6.10; emacs 27.1
To: Francois Perrad <fperrad@gmail.com>
Date: Mon, 09 May 2022 21:09:10 +0300
In-reply-to: <20220509161258.188861-1-francois.perrad@gadz.org>
Message-ID: <87pmkm8tlu.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/htop: bump to version 3.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

On Mon, May 09 2022, Francois Perrad wrote:
> remove merged patch

Is AUTORECONF still needed?

baruch

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...igure.ac-fix-static-build-with-hwloc.patch | 54 -------------------
>  package/htop/htop.hash                        |  4 +-
>  package/htop/htop.mk                          |  2 +-
>  3 files changed, 3 insertions(+), 57 deletions(-)
>  delete mode 100644 package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
>
> diff --git a/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
> b/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
> deleted file mode 100644
> index 0ac79766c..000000000
> --- a/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From 4ccad4604586c921b4ad831b254496c2cdece9fc Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 2 Apr 2022 17:27:01 +0200
> -Subject: [PATCH] configure.ac: fix static build with hwloc
> -
> -Retrieve hwloc dependencies through pkg-config to avoid the following
> -static build failure:
> -
> -checking for hwloc_get_proc_cpubind in -lhwloc... no
> -configure: error: can not find required library libhwloc
> -
> -This build failure is raised because without pkg-config, hwloc
> -dependencies such as libxml2 are not retrieved:
> -
> -configure:8999: checking for hwloc_get_proc_cpubind in -lhwloc
> -configure:9022:
> /home/autobuild/autobuild/instance-0/output-1/host/bin/powerpc-buildroot-linux-uclibc-gcc
> -o conftest -D_GNU_SOURCE
> -I/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/include
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Og -g0
> -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -static conftest.c -lhwloc -llzma
> -L/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/lib
> -lncurses -lm >&5
> -/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld:
> /home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/lib/libhwloc.a(topology-xml-libxml.o):
> in function `hwloc_libxml_free_buffer':
> -topology-xml-libxml.c:(.text+0x6a): undefined reference to `xmlFree'
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/5d815ec08c580005a863df6ac9ac29deff7d4128
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/htop-dev/htop/commit/4ccad4604586c921b4ad831b254496c2cdece9fc]
> ----
> - configure.ac | 14 ++++++++++++--
> - 1 file changed, 12 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 4ecac1ecf..6bb7eb69f 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -456,8 +456,18 @@ case "$enable_hwloc" in
> -    no)
> -       ;;
> -    yes)
> --      AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
> --      AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
> -+      m4_ifdef([PKG_PROG_PKG_CONFIG], [
> -+         PKG_PROG_PKG_CONFIG()
> -+         PKG_CHECK_MODULES(HWLOC, hwloc, [
> -+               CFLAGS="$CFLAGS $HWLOC_CFLAGS" LIBS="$LIBS $HWLOC_LIBS"
> -+            ], [
> -+ AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not
> find required library libhwloc])])
> -+               AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
> -+            ])
> -+         ], [
> -+ AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not
> find required library libhwloc])])
> -+            AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
> -+         ])
> -       ;;
> -    *)
> -       AC_MSG_ERROR([bad value '$enable_hwloc' for --enable-hwloc])
> diff --git a/package/htop/htop.hash b/package/htop/htop.hash
> index d7c39be4d..908dd32c4 100644
> --- a/package/htop/htop.hash
> +++ b/package/htop/htop.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/htop-dev/htop/releases/download/3.1.2/htop-3.1.2.tar.xz.sha256
> -sha256  884bce5b58cb113127860b9e368609019e92416a81550fdf0752052f3a64b388  htop-3.1.2.tar.xz
> +# From https://github.com/htop-dev/htop/releases/download/3.2.0/htop-3.2.0.tar.xz.sha256
> +sha256  e0f645d4ac324f2c4c48aaa7a3a96d007b95516559550be0b56e423fc5b6d783  htop-3.2.0.tar.xz
>  
>  # Locally calculated
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/htop/htop.mk b/package/htop/htop.mk
> index 1e7b171a1..e1aba23b3 100644
> --- a/package/htop/htop.mk
> +++ b/package/htop/htop.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HTOP_VERSION = 3.1.2
> +HTOP_VERSION = 3.2.0
>  HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
>  HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
>  HTOP_DEPENDENCIES = ncurses


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
