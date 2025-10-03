Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04079CAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 19:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87D50614C3;
	Fri,  3 Oct 2025 19:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDgMjTxvis3R; Fri,  3 Oct 2025 19:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1E72613B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E72613B9;
	Fri,  3 Oct 2025 19:48:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DE0F118
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 19:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F67A40286
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 19:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjJ5ZFe5btaM for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 19:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74F3F40244
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74F3F40244
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 19:48:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 646748680D; Fri,  3 Oct 2025 19:48:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Oct 2025 21:23:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b62273acfac190d8a6af0022cae2a5c874140b14
X-Git-Newrev: 989fd5ca73e87befa536995aba7cc5ea112c2805
X-Patchwork-Hint: ignore
Message-Id: <20251003194813.646748680D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fakeroot: bump to version 1.37.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=989fd5ca73e87befa536995aba7cc5ea112c2805
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://salsa.debian.org/clint/fakeroot/-/blob/debian/1.37.1.2-1/debian/changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fakeroot/fakeroot.hash | 6 +++---
 package/fakeroot/fakeroot.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index e8506672d8..1f52d37f1a 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,5 +1,5 @@
-# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.1.1-1.dsc
-sha1  baec51fadb0900cd4ed095c9efcff59699261623  fakeroot_1.37.1.1.orig.tar.gz
-sha256  86b0b75bf319ca42e525c098675b6ed10a06b76e69ec9ccf20ef5e03883b3a14  fakeroot_1.37.1.1.orig.tar.gz
+# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.1.2-1.dsc
+sha1  925958f4730b172f4e1ae5dbeb9734f3da95da13  fakeroot_1.37.1.2.orig.tar.gz
+sha256  959496928c8a676ec8377f665ff6a19a707bfad693325f9cc4a4126642f53224  fakeroot_1.37.1.2.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 8f85fe16a6..ea0edb7665 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.37.1.1
+FAKEROOT_VERSION = 1.37.1.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20250329T150348Z/pool/main/f/fakeroot
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20250513T025019Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
