Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C192C87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 14:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC24B60D5E;
	Sun,  3 Aug 2025 14:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdYu3K7d1r_A; Sun,  3 Aug 2025 14:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0168A60DE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0168A60DE8;
	Sun,  3 Aug 2025 14:37:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2438C118
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C50040486
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yqvwZ68mZUv for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 14:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B00E4047C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B00E4047C
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:37:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1807E86DA0; Sun,  3 Aug 2025 14:37:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Aug 2025 16:29:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5101638b9f917dc4c569828ff3fee0c486ba8f8
X-Git-Newrev: a28756bdee00e27561e8faba9e0ae5dcb24b9891
X-Patchwork-Hint: ignore
Message-Id: <20250803143706.1807E86DA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc-hawkbit-updater: bump to
 version 1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a28756bdee00e27561e8faba9e0ae5dcb24b9891
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://github.com/rauc/rauc-hawkbit-updater/releases/tag/v1.4

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash | 2 +-
 package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
index c65ead3784..b0833a744f 100644
--- a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
+++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  42318e96a464e6c716edb45c48bd3ec3b874462973db902fbe099a395e4acb4b  rauc-hawkbit-updater-1.3.tar.xz
+sha256  635da0807699d2efef63e44f6f6563efdb88f2f826f8ad7f8f852473a5416d71  rauc-hawkbit-updater-1.4.tar.xz
 sha256  041234c81fd6fe6c531ea1a886b9e740b9ee06759d1a910a14edbd06f4aa62c7  LICENSE
diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
index e31a4deb5f..04b2e195d7 100644
--- a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
+++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_HAWKBIT_UPDATER_VERSION = 1.3
+RAUC_HAWKBIT_UPDATER_VERSION = 1.4
 RAUC_HAWKBIT_UPDATER_SITE = https://github.com/rauc/rauc-hawkbit-updater/releases/download/v$(RAUC_HAWKBIT_UPDATER_VERSION)
 RAUC_HAWKBIT_UPDATER_SOURCE = rauc-hawkbit-updater-$(RAUC_HAWKBIT_UPDATER_VERSION).tar.xz
 RAUC_HAWKBIT_UPDATER_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
