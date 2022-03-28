Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5D5C4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 20:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E529940AA2;
	Mon, 28 Mar 2022 20:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6GgH7wln7D5f; Mon, 28 Mar 2022 20:00:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C77240A89;
	Mon, 28 Mar 2022 20:00:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8BD11BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 029E840570
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2WED6gUkGE3 for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F0B440AA2
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 81E2785F3F; Mon, 28 Mar 2022 19:48:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 28 Mar 2022 21:22:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ed1baa7e2d20c2b6184db265f398d1c2bb0e2e8
X-Git-Newrev: 1cae2aa844f5ad0962ec073f6cac103c0dc6af1f
X-Patchwork-Hint: ignore
Message-Id: <20220328194854.81E2785F3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5base: security bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cae2aa844f5ad0962ec073f6cac103c0dc6af1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes CVE-2022-25255 and CVE-2022-25634.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
index 4418f0d3ba..5f158bd6f2 100644
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
