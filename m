Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5FBC7EE2E
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 09:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1C964041C;
	Sat, 10 Jun 2023 09:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1C964041C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IKWUWcuKh_me; Sat, 10 Jun 2023 09:06:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2DB8401ED;
	Sat, 10 Jun 2023 09:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2DB8401ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FAC41BF3C5
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 09:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18497841D7
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 09:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18497841D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Rrg1tTnuZ_J for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 09:06:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00FEE841CA
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00FEE841CA
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 09:06:10 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout05.t-online.de (Postfix) with SMTP id BB3E41AC5F;
 Sat, 10 Jun 2023 11:06:08 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd72.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q7uXw-0umbA10; Sat, 10 Jun 2023 11:06:08 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:34564)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q7uXw-0006We-0o;
 Sat, 10 Jun 2023 11:06:08 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 11:06:08 +0200
Message-Id: <20230610090608.3255661-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686387968-5BFF457F-7F069068/0/0 CLEAN NORMAL
X-TOI-MSGID: 09c49732-f730-4906-8fa4-ae75680e0322
Subject: [Buildroot] [PATCH 1/1] package/libedit: bump version to
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rebased patch, switched _SITE to https.

Changelog: https://www.thrysoee.dk/editline/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
