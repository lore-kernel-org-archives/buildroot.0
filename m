Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2247C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AC5F82A26;
	Mon,  4 Apr 2022 18:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8BKi2qU1qxBn; Mon,  4 Apr 2022 18:14:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B08181882;
	Mon,  4 Apr 2022 18:14:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C74711BF9AD
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5C2381420
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:13:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V9HnGViwrb4m for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:13:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D53881419
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:13:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 792F28139D; Mon,  4 Apr 2022 18:04:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 20:03:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d5cb653f58041dddb8063251c00d0c57c9ab50d
X-Git-Newrev: d7b921e59ada62bee0f3c960dd50ac0838b96a70
X-Patchwork-Hint: ignore
Message-Id: <20220404180428.792F28139D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liblinear: bump to version 2.44
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7b921e59ada62bee0f3c960dd50ac0838b96a70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of COPYRIGHT (date updated:
  https://github.com/cjlin1/liblinear/commit/3d2fdc801ce45f470b1b5ed1945cb63126358485)
- Update LIBLINEAR_INSTALL_SHARED due to
  https://github.com/cjlin1/liblinear/commit/42f423c023e45879c8750b468e0afe74931afe3f
- Some minor bugs are fixed:
  https://github.com/cjlin1/liblinear/compare/v243...v244

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/liblinear/liblinear.hash | 4 ++--
 package/liblinear/liblinear.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
index a714b8bc4e..27aa4e3e87 100644
--- a/package/liblinear/liblinear.hash
+++ b/package/liblinear/liblinear.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  02bad43d745e2796f39a08ac9d117770e71939ef06b1ee7afc6ab7909e304807  liblinear-2.43.tar.gz
-sha256  c5c91211a0edaa4c77e352f6b27a8f9c6768afe27d48176d6094905c534eacb3  COPYRIGHT
+sha256  45572b99d4eeffc3e8ad7b72c27370be867edf3523c396d8b278a2c873bfbb5c  liblinear-2.44.tar.gz
+sha256  d49b7898fd9ea7c29f0478e8c409ee7c0f621533d5eca7b7912e80391dc564e3  COPYRIGHT
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index 1ad734c756..c100ccc6c5 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLINEAR_VERSION = 2.43
+LIBLINEAR_VERSION = 2.44
 LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
 LIBLINEAR_LICENSE = BSD-3-Clause
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
@@ -14,8 +14,8 @@ LIBLINEAR_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 # $1: destination directory
 define LIBLINEAR_INSTALL_SHARED
-	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.4 $(1)/usr/lib/liblinear.so.4
-	ln -sf liblinear.so.4 $(1)/usr/lib/liblinear.so
+	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.5 $(1)/usr/lib/liblinear.so.5
+	ln -sf liblinear.so.5 $(1)/usr/lib/liblinear.so
 endef
 LIBLINEAR_CFLAGS += -fPIC
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
