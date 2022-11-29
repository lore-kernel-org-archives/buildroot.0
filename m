Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092C6C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 990744A483;
	Mon, 20 Feb 2023 21:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 990744A483
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8PMHBQTRdvjX; Mon, 20 Feb 2023 21:35:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E32A4A150;
	Mon, 20 Feb 2023 21:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E32A4A150
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 854701BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AD09610F0
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AD09610F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vy8kUK58aW-D for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B95C961095
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B95C961095
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B78288648F; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 29 Nov 2022 22:54:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e3c14de0dfc047817917fb4dbc20c211e751bb3f
X-Git-Newrev: 1fe4f83bf41fd403fde7d0ad23187e0d50aa0bbd
X-Patchwork-Hint: ignore
Message-Id: <20230220205153.B78288648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rtl8188eu: bump to
 2022-11-29 version on v5.2.2.4 branch
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

commit: https://git.buildroot.net/buildroot/commit/?id=1fe4f83bf41fd403fde7d0ad23187e0d50aa0bbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/8bcb4d0adabc141ff8144f9e22bd549e3cd8858a/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 0ad7786328..29ce0e32c2 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  50529c110e0a45fbe3169d0e237c4d0959300840f5e162c24256452976fb2670  rtl8188eu-c4908ca4caf861d858c4d9e8452a2ad5c88cf2ba.tar.gz
+sha256  c573529862861a7a75534a4f2bc34ba7e3b116125298b5bc0d432b3065bd7df6  rtl8188eu-f4af53305cb1e9a0d8d9957a042f7c01b7121bfc.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 199362d7ae..3698115d3c 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = c4908ca4caf861d858c4d9e8452a2ad5c88cf2ba
+RTL8188EU_VERSION = f4af53305cb1e9a0d8d9957a042f7c01b7121bfc
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
