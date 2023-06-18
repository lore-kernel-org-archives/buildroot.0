Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AB0EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 11:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D76C40588;
	Sun, 18 Jun 2023 11:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D76C40588
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tc3M7nCwE6DA; Sun, 18 Jun 2023 11:48:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 633E84095D;
	Sun, 18 Jun 2023 11:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 633E84095D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12A471BF5AE
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 630A560F51
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 630A560F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RBeSUAQFkKHE for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 11:45:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E702E60F66
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 11:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E702E60F66
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB42483BB3; Sun, 18 Jun 2023 11:45:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 13:30:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a70ffd6e9dd598b4a2c1a389a18350fd88a6a1e
X-Git-Newrev: cc69dbf8fdef6619c4ea09a4aaa97cd5ad3ee423
X-Patchwork-Hint: ignore
Message-Id: <20230618114558.CB42483BB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libedit: bump version to
 20221030-3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc69dbf8fdef6619c4ea09a4aaa97cd5ad3ee423
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch, switched _SITE to https.

Changelog: https://www.thrysoee.dk/editline/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libedit/0001-check-bsd-functions-in-libbsd.patch | 8 ++++----
 package/libedit/libedit.hash                             | 2 +-
 package/libedit/libedit.mk                               | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libedit/0001-check-bsd-functions-in-libbsd.patch b/package/libedit/0001-check-bsd-functions-in-libbsd.patch
index 0af9472f17..5f056ff5ad 100644
--- a/package/libedit/0001-check-bsd-functions-in-libbsd.patch
+++ b/package/libedit/0001-check-bsd-functions-in-libbsd.patch
@@ -3,20 +3,20 @@ configure: on Linux, the BSD functions require linking against libbsd
 Signed-off-by: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
 (Rebased against 20210910-3.1)
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-(Rebased against 20150325-3.1)
+(Rebased against 20150325-3.1 & 20221030-3.1)
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 diff -durN libedit-20130712-3.1.orig/configure.ac libedit-20130712-3.1/configure.ac
 --- libedit-20130712-3.1.orig/configure.ac	2013-07-12 20:39:22.000000000 +0200
 +++ libedit-20130712-3.1/configure.ac	2013-07-28 23:35:35.012676469 +0200
-@@ -117,6 +117,10 @@
+@@ -119,6 +119,10 @@
+ #AC_FUNC_MALLOC
  #AC_FUNC_REALLOC
- AC_TYPE_SIGNAL
  AC_FUNC_STAT
 +
 +# Search for libbsd for *vis functions
 +AC_CHECK_LIB([bsd], [vis])
 +
- AC_CHECK_FUNCS([endpwent isascii memchr memset re_comp regcomp strcasecmp strchr strcspn strdup strerror strrchr strstr strtol issetugid wcsdup strlcpy strlcat vis strvis strunvis __secure_getenv secure_getenv])
+ AC_CHECK_FUNCS([endpwent isascii memchr memset re_comp regcomp strcasecmp strchr strcspn strdup strerror strrchr strstr strtol issetugid wcsdup strlcpy strlcat vis strvis strunvis __secure_getenv secure_getenv reallocarr])
 
  # strlcpy
diff --git a/package/libedit/libedit.hash b/package/libedit/libedit.hash
index 6d139730e8..2e7363d828 100644
--- a/package/libedit/libedit.hash
+++ b/package/libedit/libedit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6792a6a992050762edcca28ff3318cdb7de37dccf7bc30db59fcd7017eed13c5  libedit-20210910-3.1.tar.gz
+sha256  f0925a5adf4b1bf116ee19766b7daa766917aec198747943b1c4edf67a4be2bb  libedit-20221030-3.1.tar.gz
 sha256  9da6c9c74987a36c84302982799d17d2f748ba1c1c0c471425716173c1d07649  COPYING
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index 595a59f702..576a163173 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBEDIT_VERSION = 20210910-3.1
-LIBEDIT_SITE = http://www.thrysoee.dk/editline
+LIBEDIT_VERSION = 20221030-3.1
+LIBEDIT_SITE = https://www.thrysoee.dk/editline
 LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES = ncurses
 LIBEDIT_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
