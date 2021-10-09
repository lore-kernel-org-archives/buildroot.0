Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A98C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 10:17:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3DE960F39
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 10:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3DE960F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B57CD40670;
	Sat,  9 Oct 2021 10:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwpiT4qnnJKP; Sat,  9 Oct 2021 10:17:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 295F34065D;
	Sat,  9 Oct 2021 10:17:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 513221BF391
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 10:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FB2B60B88
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 10:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diu12rBSW3Wk for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 10:17:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88F84606A0
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 10:17:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E6E9F93503; Sat,  9 Oct 2021 10:14:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 12:14:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: babf10adf958602867ae34978923f0cfd3b31e50
X-Git-Newrev: f5a5b15bd35a4fe2e6a40ba5def8c337c901aa6f
X-Patchwork-Hint: ignore
Message-Id: <20211009101425.E6E9F93503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ser2net: bump to version 4.3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5a5b15bd35a4fe2e6a40ba5def8c337c901aa6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ser2net/ser2net.hash | 6 +++---
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index c6f0bb12a3..31a7518428 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  8209d3dc88a6e16b4f62adbc367e510a  ser2net-4.3.3.tar.gz
-sha1  d735a3f6daaa8334e0ef5d8d1a81f88b61dafb8f  ser2net-4.3.3.tar.gz
+md5  e6d88a440852e28b8e2978003b00e154  ser2net-4.3.4.tar.gz
+sha1  74d02c19c2eef219b59a47fbc61b4fb09cf608d3  ser2net-4.3.4.tar.gz
 # Locally computed:
-sha256  f5be52033a690bd0dd711209a64ebaec024ee4542b1357350aad8489dc2bf720  ser2net-4.3.3.tar.gz
+sha256  c714d6777849100b2ca3f216d1cfc36d4573639ececc91d5c7809dfe27c8428e  ser2net-4.3.4.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 0650ba5b99..bec2a9c202 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.3.3
+SER2NET_VERSION = 4.3.4
 SER2NET_SITE = https://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
