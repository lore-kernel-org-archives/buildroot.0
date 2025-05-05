Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383DEC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA0E370ABE;
	Mon, 19 May 2025 10:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eeJe3YlqPRhn; Mon, 19 May 2025 10:57:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F3A160F01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F3A160F01;
	Mon, 19 May 2025 10:57:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19177E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93DEF42446
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5CG0uo0glnyB for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A605C410BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A605C410BD
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2FF782A2E; Mon, 19 May 2025 10:39:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 May 2025 21:33:16 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1ed23e2089f21b32d5a75aaba49d259d8aec6dae
X-Git-Newrev: 18ecf1c64866e603ad8ff318d93e058b61263d78
X-Patchwork-Hint: ignore
Message-Id: <20250519103958.A2FF782A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zfs: bump version to
 2.3.2
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
Content-Type: multipart/mixed; boundary="===============1917931901454321844=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1917931901454321844==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=18ecf1c64866e603ad8ff318d93e058b61263d78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release note, see:
https://github.com/openzfs/zfs/releases/tag/zfs-2.3.2

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zfs/zfs.hash | 4 ++--
 package/zfs/zfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 3640963bdb..4c607d84a4 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.3.1/zfs-2.3.1.sha256.asc
-sha256  053233799386920bdc636e22d0e19a8c2c3e642e8bd847ff87e108f8bb1f9006  zfs-2.3.1.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.3.2/zfs-2.3.2.sha256.asc
+sha256  80da628a9543ec3355bf410617450e167706948ceb287541455a1b8d87b8758a  zfs-2.3.2.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index b2edeb1268..bdd7b2a3b0 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.3.1
+ZFS_VERSION = 2.3.2
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL

--===============1917931901454321844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1917931901454321844==--
