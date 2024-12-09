Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E548DE77180
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 23:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B23DE605AE;
	Mon,  9 Dec 2024 23:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioGFTMoXHGji; Mon,  9 Dec 2024 23:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBAD26064F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBAD26064F;
	Mon,  9 Dec 2024 23:01:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30FE4ED2
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 23:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FD4581088
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 23:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xe_TTGFv7KcL for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 23:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4963A81062
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4963A81062
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 23:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 349E186B9C; Mon,  9 Dec 2024 23:01:11 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Dec 2024 23:55:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e405092b58b1b066e66dedde7307c6acbad53ad7
X-Git-Newrev: 4ed709184543a77681d8ea3fcee7859ed779d7cd
X-Patchwork-Hint: ignore
Message-Id: <20241209230111.349E186B9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzenoh-c: bump to version 1.0.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ed709184543a77681d8ea3fcee7859ed779d7cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/eclipse-zenoh/zenoh-c/releases/tag/1.0.4

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libzenoh-c/libzenoh-c.hash | 2 +-
 package/libzenoh-c/libzenoh-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index da4596e4dc..058909eaec 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6e3419a3ef9c1d0c65a2749728e332cbc5a8da2ba3dfbc24f310fa8735fb5949  libzenoh-c-1.0.2-cargo2.tar.gz
+sha256  12401035b4652eaa95d5835db85f6597358f3245c2646abb3986291104be566c  libzenoh-c-1.0.4-cargo2.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
index a697146049..6112eda842 100644
--- a/package/libzenoh-c/libzenoh-c.mk
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_C_VERSION = 1.0.2
+LIBZENOH_C_VERSION = 1.0.4
 LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
 LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_C_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
