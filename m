Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03521CAC588
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFF9D60738;
	Mon,  8 Sep 2025 14:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AolJUsGMIZUG; Mon,  8 Sep 2025 14:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CDC6606D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CDC6606D7;
	Mon,  8 Sep 2025 14:17:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 032DF186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4F2680517
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOnG92IIPNj4 for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2EC38051F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2EC38051F
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D037E83916; Mon,  8 Sep 2025 14:16:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Aug 2025 01:56:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 084737f4cfd8442dfa703bcf5e1ca7e6cb914db5
X-Git-Newrev: c270e1a13544ed9bab4b7cf7f25783a847f6565e
X-Patchwork-Hint: ignore
Message-Id: <20250908141622.D037E83916@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-ddr-phy-binary: bump version
 to lf-6.12.20-2.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c270e1a13544ed9bab4b7cf7f25783a847f6565e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No change.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash | 2 +-
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
index 7a689d42a5..439d8e3a8f 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  475bca55d8b05463e75f6d47a8ea7e3def8505a614170b0a3976bd342ca3d759  qoriq-ddr-phy-binary-lf-6.12.3-1.0.0.tar.gz
+sha256  0837d5752a89ae7b9779cceac4aa758aad89688154a6a110a53fe16cbe6adca4  qoriq-ddr-phy-binary-lf-6.12.20-2.0.0.tar.gz
 sha256  e7e5f4949f7ac9f9a5d4d68b8f835f3ddc93ad47b594a11de699d90b9175413f  NXP-Binary-EULA.txt
diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
index 5ce990b75b..665b653d20 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_DDR_PHY_BINARY_VERSION = lf-6.12.3-1.0.0
+QORIQ_DDR_PHY_BINARY_VERSION = lf-6.12.20-2.0.0
 QORIQ_DDR_PHY_BINARY_SITE = $(call github,nxp-qoriq,ddr-phy-binary,$(QORIQ_DDR_PHY_BINARY_VERSION))
 QORIQ_DDR_PHY_BINARY_LICENSE = NXP Binary EULA
 QORIQ_DDR_PHY_BINARY_LICENSE_FILES = NXP-Binary-EULA.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
