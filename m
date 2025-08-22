Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3A7CAC589
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D84880586;
	Mon,  8 Sep 2025 14:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1u8_DGRRvpD; Mon,  8 Sep 2025 14:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD0F18064B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD0F18064B;
	Mon,  8 Sep 2025 14:17:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3143E234
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9821B4020B
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTtF-GC9FFCn for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC00B40209
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC00B40209
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD42B83CAF; Mon,  8 Sep 2025 14:16:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Aug 2025 01:56:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ae74b80b71ce89d56b28b54303be5171070d22e
X-Git-Newrev: 084737f4cfd8442dfa703bcf5e1ca7e6cb914db5
X-Patchwork-Hint: ignore
Message-Id: <20250908141622.BD42B83CAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-fm-ucode: bump version to
 lf-6.12.20-2.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=084737f4cfd8442dfa703bcf5e1ca7e6cb914db5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No change.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash | 2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
index dfad7affe0..fb5fdac9a6 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  18824746f144ff8f39a5f2f62f7777de7c6cb8ab1a3303a5cad5beadd8aac9fd  qoriq-fm-ucode-lf-6.12.3-1.0.0.tar.gz
+sha256  12894dd52239e98b00bdd0a4e30b57d7bf6c37becf2a5db4a2e7d0074435d072  qoriq-fm-ucode-lf-6.12.20-2.0.0.tar.gz
 sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
index 6df0839be3..fe71c283ea 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_FM_UCODE_VERSION = lf-6.12.3-1.0.0
+QORIQ_FM_UCODE_VERSION = lf-6.12.20-2.0.0
 QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
 QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
 QORIQ_FM_UCODE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
