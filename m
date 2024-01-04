Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67052C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A16A61B27;
	Thu,  4 Jan 2024 21:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A16A61B27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eh_8f3Dbpif4; Thu,  4 Jan 2024 21:28:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FFF061AEB;
	Thu,  4 Jan 2024 21:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FFF061AEB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 672751BF977
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E2DE4381E
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E2DE4381E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbrzNMqBl9eQ for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DDCD43806
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DDCD43806
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDE3283D35; Thu,  4 Jan 2024 21:27:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jan 2024 22:10:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1dce92c728a8df097dee7400305e116485a120a
X-Git-Newrev: fd835c3ef667195d5369b8806471293c81a43515
X-Patchwork-Hint: ignore
Message-Id: <20240104212746.EDE3283D35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/valijson: bump to version 1.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd835c3ef667195d5369b8806471293c81a43515
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of LICENSE file (typo fixed by
https://github.com/tristanpenman/valijson/commit/c0ce4cde7e89c1a88a82ddc4ae32727e1a01998f)

https://github.com/tristanpenman/valijson/releases/tag/v1.0.2
https://github.com/tristanpenman/valijson/releases/tag/v1.0.1
https://github.com/tristanpenman/valijson/releases/tag/v1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/valijson/valijson.hash | 4 ++--
 package/valijson/valijson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/valijson/valijson.hash b/package/valijson/valijson.hash
index aacdf7dedc..592d2c900e 100644
--- a/package/valijson/valijson.hash
+++ b/package/valijson/valijson.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  bc24736709acfb252a5fdcb5145f1f2670c7aecaba3356f6f8ba54903800fa5c  valijson-0.7.tar.gz
-sha256  1a0f99926a2dbec30eba3db820236d9953fbe3048976923ac24980e655fbe991  LICENSE
+sha256  35d86e54fc727f1265226434dc996e33000a570f833537a25c8b702b0b824431  valijson-1.0.2.tar.gz
+sha256  61b5766db38eaa3f320c366357956d7743424bfbf90fd78f5943866ba237589e  LICENSE
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index 875c913b09..5b68dc9864 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALIJSON_VERSION = 0.7
+VALIJSON_VERSION = 1.0.2
 VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
 VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
