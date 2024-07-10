Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A12C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 22:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FA214160B;
	Wed, 10 Jul 2024 22:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNOfAZKe4hWr; Wed, 10 Jul 2024 22:15:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2EC9415B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2EC9415B4;
	Wed, 10 Jul 2024 22:15:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C40AD1BF982
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1D7060805
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0uEkG3vMBx3 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 22:15:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03FFF60784
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03FFF60784
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 22:15:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A98F184A1B; Wed, 10 Jul 2024 22:15:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 00:04:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74ebd50ccc6681ef2e07896b8f16afb122db099d
X-Git-Newrev: 295ba8991537a26060cd47421240239fb111b694
X-Patchwork-Hint: ignore
Message-Id: <20240710221545.A98F184A1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/highway: bump to version 1.2.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=295ba8991537a26060cd47421240239fb111b694
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
- https://github.com/google/highway/releases/tag/1.2.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/highway/highway.hash | 2 +-
 package/highway/highway.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/highway/highway.hash b/package/highway/highway.hash
index 270131134e..5addf50eee 100644
--- a/package/highway/highway.hash
+++ b/package/highway/highway.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  354a8b4539b588e70b98ec70844273e3f2741302c4c377bcc4e81b3d1866f7c9  highway-1.1.0.tar.gz
+sha256  7e0be78b8318e8bdbf6fa545d2ecb4c90f947df03f7aadc42c1967f019e63343  highway-1.2.0.tar.gz
 sha256  43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1  LICENSE
 sha256  d25e82e26acd42ca3ccc9993622631163425b869b9e16284226d534cff6470f2  LICENSE-BSD3
diff --git a/package/highway/highway.mk b/package/highway/highway.mk
index 3eb0d7a4aa..a74bc90dd3 100644
--- a/package/highway/highway.mk
+++ b/package/highway/highway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIGHWAY_VERSION = 1.1.0
+HIGHWAY_VERSION = 1.2.0
 HIGHWAY_SITE = $(call github,google,highway,$(HIGHWAY_VERSION))
 HIGHWAY_LICENSE = Apache-2.0 or BSD-3-Clause
 HIGHWAY_LICENSE_FILES = LICENSE LICENSE-BSD3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
