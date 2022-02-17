Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2DCC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 18:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07C5B60BD4;
	Thu, 17 Feb 2022 18:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HQbByXXxy0i6; Thu, 17 Feb 2022 18:48:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A76560B8F;
	Thu, 17 Feb 2022 18:48:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81D861BF3EB
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 18:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7099360B8F
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 18:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bBzggrNLj_Bh for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 18:48:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7938A60ACE
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 18:48:42 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout09.t-online.de (Postfix) with SMTP id 30F963D38;
 Thu, 17 Feb 2022 19:48:39 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.192.64]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nKlpV-0RS8jh0; Thu, 17 Feb 2022 19:48:37 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:37378)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nKlpU-0005ab-Oy;
 Thu, 17 Feb 2022 19:48:36 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 19:48:36 +0100
Message-Id: <20220217184836.418858-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1645123717-0000EDC4-3C006E15/0/0 CLEAN NORMAL
X-TOI-MSGID: 429e4162-2a34-4deb-891f-a5c326e5d561
Subject: [Buildroot] [PATCH/next 1/1] package/tvheadend: bump version
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

Removed patch which was applied upstream:
https://github.com/tvheadend/tvheadend/commit/fb7b24114685a7e38d842168dce4c613360cd330

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-configure-add-execinfo-option.patch  | 55 -------------------
 package/tvheadend/tvheadend.hash              |  2 +-
 package/tvheadend/tvheadend.mk                |  2 +-
 3 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 package/tvheadend/0002-configure-add-execinfo-option.patch

diff --git a/package/tvheadend/0002-configure-add-execinfo-option.patch b/package/tvheadend/0002-configure-add-execinfo-option.patch
deleted file mode 100644
index c55d127d58..0000000000
--- a/package/tvheadend/0002-configure-add-execinfo-option.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 04c01e631cb1bf47dd50b1ef92a086308e380eff Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 1 Jan 2022 16:53:29 +0100
-Subject: [PATCH] configure: add execinfo option
-
-Add execinfo option to allow the user to disable the feature even if
-execinfo.h is found on the system
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upsteam status: https://github.com/tvheadend/tvheadend/pull/1431]
----
- configure | 17 +++++++++++++++--
- 1 file changed, 15 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 4dad024c4..c087502bf 100755
---- a/configure
-+++ b/configure
-@@ -75,6 +75,7 @@ OPTIONS=(
-   "ddci:yes"
-   "cclang_threadsan:no"
-   "gperftools:no"
-+  "execinfo:auto"
- )
- 
- #
-@@ -150,11 +151,23 @@ if [ ${PLATFORM} = "freebsd" ]; then
-     # If we don't have libunwind then fallback to execinfo.
-     if ! enabled libunwind
-     then
--        check_cc_header execinfo
-+        if enabled_or_auto execinfo; then
-+            if check_cc_header execinfo; then
-+                enable execinfo
-+            else
-+                die "execinfo.h not found (use --disable-execinfo)"
-+           fi
-+        fi
-     fi
- 
- else
--    check_cc_header execinfo
-+    if enabled_or_auto execinfo; then
-+        if check_cc_header execinfo; then
-+            enable execinfo
-+        else
-+            die "execinfo.h not found (use --disable-execinfo)"
-+        fi
-+    fi
- fi
- check_cc_option mmx
- check_cc_option sse2
--- 
-2.33.0
-
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index db06af53b7..44ff745221 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  11eeca461e74fbe8306916933cab96d35a99fa89d81e26126e194875c41b6fad  tvheadend-b8710206eb073c72b142bce95846b77a0ffa34a6.tar.gz
+sha256  10b8e8387cf341a8c639b3ecbab17dd245dc109afd6c99ca6b7fc3f2b5efc50e  tvheadend-1295dd2be863f5beb764290fce9317b24193dfc0.tar.gz
 sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 58ebdcb054..d2547b8746 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = b8710206eb073c72b142bce95846b77a0ffa34a6
+TVHEADEND_VERSION = 1295dd2be863f5beb764290fce9317b24193dfc0
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
