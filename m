Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9408BD58D69
	for <buildroot@archiver.kernel.org>; Mon, 25 Nov 2024 16:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CCF984FBE;
	Mon, 25 Nov 2024 16:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJ4gkc2eVTah; Mon, 25 Nov 2024 16:43:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4742280ECB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4742280ECB;
	Mon, 25 Nov 2024 16:43:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CA6BE11
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8728E4033F
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHak-VDqFTVH for <buildroot@buildroot.org>;
 Mon, 25 Nov 2024 16:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 725F44339C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 725F44339C
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:43:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F369865DE; Mon, 25 Nov 2024 16:43:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Nov 2024 17:40:08 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: fee127154a7bb889cff6c64046c05888f5257168
X-Git-Newrev: 30a1d2196e0aa972031fa309308f37001cf2ffd8
X-Patchwork-Hint: ignore
Message-Id: <20241125164339.5F369865DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/irssi: bump
 version to 1.4.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=30a1d2196e0aa972031fa309308f37001cf2ffd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

For change log, see:
https://irssi.org/NEWS/#news-v1-4-5

This commit also adds the pgp key id used for the signature
verification.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 525c1369bc76831e8f1722d9fdad94422ab89784)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irssi/irssi.hash | 5 +++--
 package/irssi/irssi.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index df72ee4d76..f2798d14c8 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,4 +1,5 @@
-# Locally calculated after checking pgp signature
-sha256  fefe9ec8c7b1475449945c934a2360ab12693454892be47a6d288c63eb107ead  irssi-1.4.4.tar.xz
+# Locally calculated after checking pgp signature with key
+# 7EE65E3082A5FB06AC7C368D00CCB587DDBEF0E1
+sha256  72a951cb0ad622785a8962801f005a3a412736c7e7e3ce152f176287c52fe062  irssi-1.4.5.tar.xz
 # Locally calculated
 sha256  a1a27cb2ecee8d5378fbb3562f577104a445d6d66fee89286e16758305e63e2b  COPYING
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index 6790bf0c96..7c86569d62 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 1.4.4
+IRSSI_VERSION = 1.4.5
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 IRSSI_SITE = https://codeberg.org/irssi/irssi/releases/download/$(IRSSI_VERSION)
 IRSSI_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
