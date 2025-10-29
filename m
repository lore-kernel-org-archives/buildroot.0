Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14BFCCF9EE
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 22:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56F4A6111A;
	Wed, 29 Oct 2025 22:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfciXSsHGiee; Wed, 29 Oct 2025 22:00:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85B706112D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85B706112D;
	Wed, 29 Oct 2025 22:00:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2456F2A3
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 22:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1648C40F07
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 22:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liWPQiONQ2c5 for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 22:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB7DC40EE6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB7DC40EE6
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 22:00:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A964D879D2; Wed, 29 Oct 2025 22:00:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Oct 2025 22:48:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 789d1952d22d17f239158a8a2afd96166be451c2
X-Git-Newrev: b4c9596dbfd3bbf6ae84aaabc84fec03a7232cb4
X-Patchwork-Hint: ignore
Message-Id: <20251029220014.A964D879D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtpms: bump version to 0.10.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4c9596dbfd3bbf6ae84aaabc84fec03a7232cb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/stefanberger/libtpms/releases/tag/v0.10.1

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
[Julien:
 - remove old hash entry
 - fix release note url in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libtpms/libtpms.hash | 2 +-
 package/libtpms/libtpms.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtpms/libtpms.hash b/package/libtpms/libtpms.hash
index 1026aaa4f4..f10364f36e 100644
--- a/package/libtpms/libtpms.hash
+++ b/package/libtpms/libtpms.hash
@@ -1,2 +1,2 @@
-sha256  2807466f1563ebe45fdd12dd26e501e8a0c4fbb99c7c428fbb508789efd221c0  libtpms-0.9.6.tar.gz
+sha256  ebc24f3191d90f6cf0b4d4200cd876db4bd224b3c565708bbea0a82ee275e0fb  libtpms-0.10.1.tar.gz
 sha256  82f1e6bae374bb6a9d4f4596767fd33e499718d560de140fd9f3d402cc5e41fb  LICENSE
diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
index 19d7cef89f..6e5708202e 100644
--- a/package/libtpms/libtpms.mk
+++ b/package/libtpms/libtpms.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTPMS_VERSION = 0.9.6
+LIBTPMS_VERSION = 0.10.1
 LIBTPMS_SITE = $(call github,stefanberger,libtpms,v$(LIBTPMS_VERSION))
 LIBTPMS_LICENSE = BSD-4-Clause
 LIBTPMS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
