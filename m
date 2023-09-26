Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1CAE8181F
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 06:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 446646146F;
	Tue, 26 Sep 2023 06:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 446646146F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pzIqkIfwrd6p; Tue, 26 Sep 2023 06:14:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ED5061487;
	Tue, 26 Sep 2023 06:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ED5061487
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79D2C1BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A9C881325
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A9C881325
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sI7ZvRR3IrBf for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 06:12:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B348A8131B
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 06:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B348A8131B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3EBC87813; Tue, 26 Sep 2023 06:12:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 08:04:07 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 0dcf973e5557b025f7687ea7a112fadedad184bc
X-Git-Newrev: f35f7c3eabc4225fda225f1e27a6d84e7596fbcb
X-Patchwork-Hint: ignore
Message-Id: <20230926061220.A3EBC87813@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/webkitgtk:
 security bump to version 2.40.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=f35f7c3eabc4225fda225f1e27a6d84e7596fbcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Bugfix release with many security fixes, including (but not limited to)
patches for CVE-2023-37450, CVE-2023-38133, CVE-2023-38572, CVE-2023-38592,
CVE-2023-38594, CVE-2023-38595, CVE-2023-38597, CVE-2023-38599,
CVE-2023-38600, and CVE-2023-38611.

Release notes:

  https://webkitgtk.org/2023/07/21/webkitgtk2.40.4-released.html
  https://webkitgtk.org/2023/08/01/webkitgtk2.40.5-released.html

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2023-0006.html
  https://webkitgtk.org/security/WSA-2023-0007.html

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3ba27e682a861e304138fa2a460c10db2c83abe4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ailure-when-gstreamer-support-is-disabled.patch | 36 ++++++++++++++++++++++
 package/webkitgtk/webkitgtk.hash                   |  6 ++--
 package/webkitgtk/webkitgtk.mk                     |  2 +-
 3 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch b/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
new file mode 100644
index 0000000000..3fa23b215b
--- /dev/null
+++ b/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
@@ -0,0 +1,36 @@
+From 9b31965cdf362768e86f7e592e59e68fb3351261 Mon Sep 17 00:00:00 2001
+From: Matt Turner <mattst88@gmail.com>
+Date: Tue, 8 Aug 2023 16:51:25 -0700
+Subject: [PATCH] Fix build failure when gstreamer support is disabled
+ https://bugs.webkit.org/show_bug.cgi?id=259931 https://bugs.gentoo.org/911663
+
+Reviewed by Carlos Alberto Lopez Perez.
+
+* Source/WebCore/loader/MixedContentChecker.cpp:
+
+Canonical link: https://commits.webkit.org/260527.429@fix-build
+
+(cherry picked from commit f5ceef5bf2e3c4d7203a37b9e2d2fdd9b1bb2732)
+
+Upstream: https://github.com/WebKit/WebKit/commit/f5ceef5bf2e3c4d7203a37b9e2d2fdd9b1bb2732
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ Source/WebCore/loader/MixedContentChecker.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Source/WebCore/loader/MixedContentChecker.cpp b/Source/WebCore/loader/MixedContentChecker.cpp
+index 9b4c7fe62020..ac4733bc08bc 100644
+--- a/Source/WebCore/loader/MixedContentChecker.cpp
++++ b/Source/WebCore/loader/MixedContentChecker.cpp
+@@ -33,6 +33,8 @@
+ #include "ContentSecurityPolicy.h"
+ #include "Document.h"
+ #include "Frame.h"
++#include "FrameLoader.h"
++#include "FrameLoaderClient.h"
+ #include "SecurityOrigin.h"
+ 
+ namespace WebCore {
+-- 
+2.42.0
+
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 756ac13ec2..7f50f1aa7b 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.40.3.tar.xz.sums
-sha1  74ee7241f2add46897019e22bd4f8e19e09027bb  webkitgtk-2.40.3.tar.xz
-sha256  cc0aa83f40dbc64c1c6ae42ec6b85af4be2a9dbf524cfcb95f89a367fb5098dd  webkitgtk-2.40.3.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.40.5.tar.xz.sums
+sha1  2f4d06b021115eb4106177f7d5f534f45b5d3b2e  webkitgtk-2.40.5.tar.xz
+sha256  7de051a263668621d91a61a5eb1c3771d1a7cec900043d4afef06c326c16037f  webkitgtk-2.40.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 56277a0a0a..d5e983e403 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.40.3
+WEBKITGTK_VERSION = 2.40.5
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
