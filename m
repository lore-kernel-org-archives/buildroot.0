Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A83BC74A4B
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 12:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C4EF40522;
	Sun, 12 Mar 2023 12:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C4EF40522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QeeVdgq2yrBC; Sun, 12 Mar 2023 12:34:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59B1F40376;
	Sun, 12 Mar 2023 12:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59B1F40376
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 426E61BF584
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CC8C81947
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CC8C81947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y3vDZMrJfP2U for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 12:34:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 372168148D
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 12:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 372168148D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2148486ED7; Sun, 12 Mar 2023 12:34:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 13:34:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: af2cfc61a2a3e630824ac693d961b74f858c0407
X-Git-Newrev: 69053186c9f1561855357be574c70c0b3ad0ddcb
X-Patchwork-Hint: ignore
Message-Id: <20230312123454.2148486ED7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kexec: bump to version
 2.0.26
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=69053186c9f1561855357be574c70c0b3ad0ddcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See release announce:
https://lists.infradead.org/pipermail/kexec/2022-December/026399.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kexec/kexec.hash | 2 +-
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index 34e17339b9..4e16a53a35 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256  7ce2e5def38ec04f79feb107d02243dd586fbc68569eccf02f44bad3a13ec07d  kexec-tools-2.0.25.tar.xz
+sha256  7fe36a064101cd5c515e41b2be393dce3ca88adce59d6ee668e0af7c0c4570cd  kexec-tools-2.0.26.tar.xz
 # locally calculated
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index ced7009ed3..c1411f6ab7 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.25
+KEXEC_VERSION = 2.0.26
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
