Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0B5C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46EA760D91;
	Fri,  7 Jan 2022 21:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T6KvzugFGgQr; Fri,  7 Jan 2022 21:03:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8198960AFE;
	Fri,  7 Jan 2022 21:03:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B7931BF5DA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19EC560AF1
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XH2j9nJzIQya for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:03:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9A4B60AED
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:03:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1E77082B50; Fri,  7 Jan 2022 20:56:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 22:01:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fb16a85da1f5c1c34af0da4c247c79f8d76bcab
X-Git-Newrev: bc1b52c53ec23ea10f5893914fb17339694b3c26
X-Patchwork-Hint: ignore
Message-Id: <20220107205655.1E77082B50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libedit: bump to version
 20210910-3.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bc1b52c53ec23ea10f5893914fb17339694b3c26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Refresh patch

https://www.thrysoee.dk/editline

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libedit/0001-check-bsd-functions-in-libbsd.patch | 4 ++--
 package/libedit/libedit.hash                             | 2 +-
 package/libedit/libedit.mk                               | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libedit/0001-check-bsd-functions-in-libbsd.patch b/package/libedit/0001-check-bsd-functions-in-libbsd.patch
index 7438340d48..0af9472f17 100644
--- a/package/libedit/0001-check-bsd-functions-in-libbsd.patch
+++ b/package/libedit/0001-check-bsd-functions-in-libbsd.patch
@@ -1,7 +1,7 @@
 configure: on Linux, the BSD functions require linking against libbsd
 
 Signed-off-by: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
-(Rebased against 20170329-3.1)
+(Rebased against 20210910-3.1)
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 (Rebased against 20150325-3.1)
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
@@ -17,6 +17,6 @@ diff -durN libedit-20130712-3.1.orig/configure.ac libedit-20130712-3.1/configure
 +# Search for libbsd for *vis functions
 +AC_CHECK_LIB([bsd], [vis])
 +
- AC_CHECK_FUNCS([endpwent isascii memchr memset re_comp regcomp strcasecmp strchr strcspn strdup strerror strrchr strstr strtol issetugid wcsdup strlcpy strlcat getline vis strvis strunvis __secure_getenv secure_getenv])
+ AC_CHECK_FUNCS([endpwent isascii memchr memset re_comp regcomp strcasecmp strchr strcspn strdup strerror strrchr strstr strtol issetugid wcsdup strlcpy strlcat vis strvis strunvis __secure_getenv secure_getenv])
 
  # strlcpy
diff --git a/package/libedit/libedit.hash b/package/libedit/libedit.hash
index d405e47b42..6d139730e8 100644
--- a/package/libedit/libedit.hash
+++ b/package/libedit/libedit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dbb82cb7e116a5f8025d35ef5b4f7d4a3cdd0a3909a146a39112095a2d229071  libedit-20191231-3.1.tar.gz
+sha256  6792a6a992050762edcca28ff3318cdb7de37dccf7bc30db59fcd7017eed13c5  libedit-20210910-3.1.tar.gz
 sha256  9da6c9c74987a36c84302982799d17d2f748ba1c1c0c471425716173c1d07649  COPYING
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index cb18b97f6d..595a59f702 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEDIT_VERSION = 20191231-3.1
+LIBEDIT_VERSION = 20210910-3.1
 LIBEDIT_SITE = http://www.thrysoee.dk/editline
 LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES = ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
