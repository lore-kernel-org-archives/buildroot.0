Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A4EC369A2
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 17:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6FA660B4A;
	Tue,  8 Apr 2025 17:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jokDytFzwKd2; Tue,  8 Apr 2025 17:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CB6060B7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CB6060B7D;
	Tue,  8 Apr 2025 17:48:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AFA71F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 881D940C26
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHQ34nrlJtAa for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 17:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA43840B35
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA43840B35
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:48:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C50DB83EF5; Tue,  8 Apr 2025 17:48:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 8 Apr 2025 19:33:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c14ce5346d969e660cc788f2f4d8619b27c805a2
X-Git-Newrev: bd6e78103825c6aaed125fa0a67814775dc63b9d
X-Patchwork-Hint: ignore
Message-Id: <20250408174839.C50DB83EF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: bump version to 2.8.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd6e78103825c6aaed125fa0a67814775dc63b9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release announce:
https://lore.kernel.org/linux-nfs/64a11de6-ca85-40ce-9235-954890b3a483@redhat.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add link to release announce]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nfs-utils/nfs-utils.hash | 4 ++--
 package/nfs-utils/nfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index ff3f03799d..af5fc8bd73 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.2/sha256sums.asc
-sha256  a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15  nfs-utils-2.8.2.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.3/sha256sums.asc
+sha256  11e7c5847a8423a72931c865bd9296e7fd56ff270a795a849183900961711725  nfs-utils-2.8.3.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 60e9c26695..0af0254d3f 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.8.2
+NFS_UTILS_VERSION = 2.8.3
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
