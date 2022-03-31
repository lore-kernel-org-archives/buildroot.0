Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29D6C43217
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 15:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 610D46133A;
	Thu, 31 Mar 2022 15:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tsXqUrGBrL_N; Thu, 31 Mar 2022 15:50:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D39D612DB;
	Thu, 31 Mar 2022 15:50:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02C621BF3AE
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 15:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F224183339
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 15:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BPinez3B7IZT for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 15:49:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C581832D8
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 15:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BC95986092; Thu, 31 Mar 2022 15:40:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 17:46:34 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a43cd47910c37a54903714dd1ab32ffecbd86aed
X-Git-Newrev: 3b6347fca9dc103d272d28792f00d214e1452996
X-Patchwork-Hint: ignore
Message-Id: <20220331154028.BC95986092@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qt5/qt5base:
 security bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b6347fca9dc103d272d28792f00d214e1452996
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This fixes CVE-2022-25255 and CVE-2022-25634.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1cae2aa844f5ad0962ec073f6cac103c0dc6af1f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.hash | 2 +-
 package/qt5/qt5base/qt5base.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 1b9ff43ab2..c031f71c77 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  96b1c96041ae7b5186c94f231979217bd50e3c0a4caeba32982faa8054a6d113  qtbase-d16bf02a11953dcac01dca73e6f3778f293adefe.tar.bz2
+sha256  18c17d441fbefa9dd13d1d6bfb5f542c986ba86cc37930247f9e4d782df2244b  qtbase-f31e001a9399e4e620847ea2c3e90749350140ae.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 930b012e94..17c32c86b5 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5BASE_VERSION = d16bf02a11953dcac01dca73e6f3778f293adefe
+QT5BASE_VERSION = f31e001a9399e4e620847ea2c3e90749350140ae
 QT5BASE_SITE = $(QT5_SITE)/qtbase/-/archive/$(QT5BASE_VERSION)
 QT5BASE_SOURCE = qtbase-$(QT5BASE_VERSION).tar.bz2
 
@@ -14,6 +14,10 @@ QT5BASE_SYNC_QT_HEADERS = YES
 
 # 0006-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
 QT5BASE_IGNORE_CVES += CVE-2021-38593
+# From commit 2766b2cba6ca4b1c430304df5437e2a6c874b107 "QProcess/Unix: ensure we don't accidentally execute something from CWD"
+QT5BASE_IGNORE_CVES += CVE-2022-25255
+# From commit e68ca8e51375d963b2391715f70b42707992dbd8 "Windows: use QSystemLibrary instead of LoadLibrary directly"
+QT5BASE_IGNORE_CVES += CVE-2022-25634
 
 # A few comments:
 #  * -no-pch to workaround the issue described at
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
