Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F734C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 20:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E59784360;
	Fri, 21 Jun 2024 20:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yFlb5IKoq_z1; Fri, 21 Jun 2024 20:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4396A8434E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4396A8434E;
	Fri, 21 Jun 2024 20:57:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B24B1BF97A
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 20:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38D4060759
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 20:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utJiVR_NWtC8 for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 20:57:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 542E360725
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 542E360725
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 20:57:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40FD282596; Fri, 21 Jun 2024 20:57:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 22:54:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9135bb95fc480841f3b901285803d0a7b1c2d916
X-Git-Newrev: 4ae18c511a2a7e8b0b6cd7a2961ba4c0e395fe2a
X-Patchwork-Hint: ignore
Message-Id: <20240621205750.40FD282596@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/embiggen-disk: bump version to
 v20240521
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ae18c511a2a7e8b0b6cd7a2961ba4c0e395fe2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to the skiffos fork as the upstream is not maintained.

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/embiggen-disk/embiggen-disk.hash | 2 +-
 package/embiggen-disk/embiggen-disk.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/embiggen-disk/embiggen-disk.hash b/package/embiggen-disk/embiggen-disk.hash
index 86e9346e9b..02c99add6a 100644
--- a/package/embiggen-disk/embiggen-disk.hash
+++ b/package/embiggen-disk/embiggen-disk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  aa6019311ea869b1f7cbca640462eae6cfa0fef5a65ec5266ca394b261217960  embiggen-disk-9e7b2fc7b99c4dece41a805489a6ca377ce55a62-go2.tar.gz
+sha256  25e536bd58969077554927a456cd3cb79e21f126e47545ba511abe64a0f3ba5e  embiggen-disk-v20240521-go2.tar.gz
 sha256  063aedec1652c5a05c2d04c40e032b932453142ee8ef7fd53c04a9acc127fc95  LICENSE
diff --git a/package/embiggen-disk/embiggen-disk.mk b/package/embiggen-disk/embiggen-disk.mk
index 66f2087dbd..47b86c072b 100644
--- a/package/embiggen-disk/embiggen-disk.mk
+++ b/package/embiggen-disk/embiggen-disk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EMBIGGEN_DISK_VERSION = 9e7b2fc7b99c4dece41a805489a6ca377ce55a62
-EMBIGGEN_DISK_SITE = $(call github,bradfitz,embiggen-disk,$(EMBIGGEN_DISK_VERSION))
+EMBIGGEN_DISK_VERSION = v20240521
+EMBIGGEN_DISK_SITE = $(call github,skiffos,embiggen-disk,$(EMBIGGEN_DISK_VERSION))
 EMBIGGEN_DISK_LICENSE = Apache-2.0
 EMBIGGEN_DISK_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
