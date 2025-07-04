Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0D4C83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8576960ECB;
	Fri,  4 Jul 2025 06:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S46JNkkmkK0H; Fri,  4 Jul 2025 06:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6B9F60697
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6B9F60697;
	Fri,  4 Jul 2025 06:48:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B6D87AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F40264040D
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhJv1MvvlVeX for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21FAF40167
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21FAF40167
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C53C85E85; Fri,  4 Jul 2025 06:48:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 4 Jul 2025 08:43:57 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 7a7acd723aa94e5d2351a1806cc99c3431852c40
X-Git-Newrev: b7d87dd285b3015b6c4f5766be6ea3b575b10a7f
X-Patchwork-Hint: ignore
Message-Id: <20250704064812.0C53C85E85@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/systemd: bump to
 256.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7d87dd285b3015b6c4f5766be6ea3b575b10a7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Systemd stable versions don't really have release notes, so best we can
do is link to the diff between the two tags:

https://github.com/systemd/systemd/compare/v256.7...v256.16

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit f11fc147348c77feb687a86e0af0740816e4ead3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 976d88c1f5..e16823ca78 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  896d76ff65c88f5fd9e42f90d152b0579049158a163431dd77cdc57748b1d7b0  systemd-256.7.tar.gz
+sha256  2600db41d9ebd717ca786d754d17699038147b8fddaf15fc935f775a06c0df92  systemd-256.16.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 71fe0de550..bf0f2c1e90 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 256.7
+SYSTEMD_VERSION = 256.16
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
