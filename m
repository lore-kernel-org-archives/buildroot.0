Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0A5CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FCE941450;
	Mon, 17 Nov 2025 20:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7rMt-BkWftj; Mon, 17 Nov 2025 20:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF3064145B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF3064145B;
	Mon, 17 Nov 2025 20:07:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B46D158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBB4683E1F
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1VIal2epjxO for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E48A383D71
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E48A383D71
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C26CF84996; Mon, 17 Nov 2025 20:07:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 16:48:30 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: fcc7e9c92e6c132366c80998cf14b301e960e08f
X-Git-Newrev: 3e0fe12cc3f0c2ab440004f7c7bf913bcabd8ffb
X-Patchwork-Hint: ignore
Message-Id: <20251117200752.C26CF84996@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/libtpms: bump
 version to 0.10.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3e0fe12cc3f0c2ab440004f7c7bf913bcabd8ffb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Release notes:
https://github.com/stefanberger/libtpms/releases/tag/v0.10.1

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
[Julien:
 - remove old hash entry
 - fix release note url in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b4c9596dbfd3bbf6ae84aaabc84fec03a7232cb4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
