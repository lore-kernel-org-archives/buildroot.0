Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94B8CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 20:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A24C41880;
	Wed,  3 Apr 2024 20:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIcMssfEQsIH; Wed,  3 Apr 2024 20:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DD6641868
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DD6641868;
	Wed,  3 Apr 2024 20:07:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 789D01BF408
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 658F9607C2
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4_TTXeSR_dc for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 20:07:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A022360784
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A022360784
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 20:07:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87441847AE; Wed,  3 Apr 2024 20:07:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 22:07:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 796df3ff83b68b584ba1a30d621ba333a59dd1f7
X-Git-Newrev: 1724b094209daed7bb400382ec22d647b8e61276
X-Patchwork-Hint: ignore
Message-Id: <20240403200726.87441847AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fakeroot: bump to version 1.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=1724b094209daed7bb400382ec22d647b8e61276
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fakeroot/fakeroot.hash | 5 +++--
 package/fakeroot/fakeroot.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 5e7b6af94b..a148de6764 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,4 +1,5 @@
-# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.32.1-1.dsc
-sha256  c072b0f65bafc4cc5b6112f7c61185f5170ce4cb0c410d1681c1af4a183e94e6  fakeroot_1.32.1.orig.tar.gz
+# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.34-1.dsc
+sha1  aaa6bf0158d886e0093effc0e9422717d5c60eee  fakeroot_1.34.orig.tar.gz
+sha256  5727f16d8903792588efa7a9f8ef8ce71f8756e746b62e45162e7735662e56bb  fakeroot_1.34.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 1a0ad70c13..1a0996ca12 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.32.1
+FAKEROOT_VERSION = 1.34
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20230724T160429Z/pool/main/f/fakeroot
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20240401T084438Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
