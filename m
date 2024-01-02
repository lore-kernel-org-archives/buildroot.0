Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF9BC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC67E40A92;
	Tue,  2 Jan 2024 20:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC67E40A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l3IiXB2LiXrJ; Tue,  2 Jan 2024 20:19:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92D8F40A73;
	Tue,  2 Jan 2024 20:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92D8F40A73
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCBE41BF302
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 661C84171C
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 661C84171C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lKCTTXgmV-nN for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C102441720
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C102441720
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0B4C81DBC; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 21:09:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17fb3f966d400943466440704500fd401080f443
X-Git-Newrev: 8cd52a4d8127f31d8e8900c14e90f4bb9634ba11
X-Patchwork-Hint: ignore
Message-Id: <20240102201716.B0B4C81DBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/p11-kit: bump to version 0.25.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=8cd52a4d8127f31d8e8900c14e90f4bb9634ba11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/p11-glue/p11-kit/blob/0.25.3/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/p11-kit/p11-kit.hash | 2 +-
 package/p11-kit/p11-kit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index e950060c91..81d209b2c2 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  d8be783efd5cd4ae534cee4132338e3f40f182c3205d23b200094ec85faaaef8  p11-kit-0.24.1.tar.xz
+sha256  d8ddce1bb7e898986f9d250ccae7c09ce14d82f1009046d202a0eb1b428b2adc  p11-kit-0.25.3.tar.xz
 # Locally computed
 sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 868e3a7c9b..8547ee33c2 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.24.1
+P11_KIT_VERSION = 0.25.3
 P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
 P11_KIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
