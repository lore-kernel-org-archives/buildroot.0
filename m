Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C7EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 13:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ACE480E28;
	Sun, 21 Nov 2021 13:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gh656rr26Vql; Sun, 21 Nov 2021 13:53:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C28B80DA0;
	Sun, 21 Nov 2021 13:53:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16DD51BF964
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 13:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C780280F39
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 13:53:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MFrxG5peX6_T for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 13:53:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EB5A814B4
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 13:53:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id ACFF78DC04; Sun, 21 Nov 2021 13:48:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:52:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5373215617d5e9747335ec3354207933a4bd9ba5
X-Git-Newrev: c95b9b98b811fcad463890ac6e57ff9eb5008967
X-Patchwork-Hint: ignore
Message-Id: <20211121134844.ACFF78DC04@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcodec2: bump
 version to 1.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c95b9b98b811fcad463890ac6e57ff9eb5008967
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Reformatted hashes.

Release notes:
https://github.com/drowe67/codec2/releases/tag/v1.0.1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcodec2/libcodec2.hash | 4 ++--
 package/libcodec2/libcodec2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcodec2/libcodec2.hash b/package/libcodec2/libcodec2.hash
index ec4f1f1a32..795ca37006 100644
--- a/package/libcodec2/libcodec2.hash
+++ b/package/libcodec2/libcodec2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 19181a446f4df3e6d616b50cabdac4485abb9cd3242cf312a0785f892ed4c76c  libcodec2-0.9.2.tar.gz
-sha256 9ebb6f82b7380a62ac74c5f0322c88e6744dedf2ebe1f54d6f088282b39844bf  COPYING
+sha256  14227963940d79e0ec5af810f37101b30e1c7e8555abd96c56b3c0473abac8ef  libcodec2-1.0.1.tar.gz
+sha256  9ebb6f82b7380a62ac74c5f0322c88e6744dedf2ebe1f54d6f088282b39844bf  COPYING
diff --git a/package/libcodec2/libcodec2.mk b/package/libcodec2/libcodec2.mk
index 8410ffc90a..b4f08a496e 100644
--- a/package/libcodec2/libcodec2.mk
+++ b/package/libcodec2/libcodec2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCODEC2_VERSION = 0.9.2
+LIBCODEC2_VERSION = 1.0.1
 LIBCODEC2_SITE = $(call github,drowe67,codec2,v$(LIBCODEC2_VERSION))
 LIBCODEC2_LICENSE = LGPL-2.1
 LIBCODEC2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
