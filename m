Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F89C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 861F461405;
	Fri,  2 May 2025 11:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDES5uoJih2E; Fri,  2 May 2025 11:14:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 916C160093
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 916C160093;
	Fri,  2 May 2025 11:14:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E6A3229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5A2F41A5B
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9SEGikkmJML for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AEFC41A76
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AEFC41A76
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 473CD81E82; Fri,  2 May 2025 11:11:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:13:43 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e34e58191d51648c00de7b6df8d77382d6fd4444
X-Git-Newrev: 45404bb7dc8c8166b4739535d559ef625e22eea9
X-Patchwork-Hint: ignore
Message-Id: <20250502111137.473CD81E82@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cairomm1_14: bump
 to version 1.14.5
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=45404bb7dc8c8166b4739535d559ef625e22eea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

https://gitlab.freedesktop.org/cairo/cairomm/-/blob/1.14.5/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 592a9d07747d2d43ab72173ad3408657ff58a0dc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cairomm1_14/cairomm1_14.hash | 6 +++---
 package/cairomm1_14/cairomm1_14.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cairomm1_14/cairomm1_14.hash b/package/cairomm1_14/cairomm1_14.hash
index 6d58de360a..69511993ce 100644
--- a/package/cairomm1_14/cairomm1_14.hash
+++ b/package/cairomm1_14/cairomm1_14.hash
@@ -1,6 +1,6 @@
-# From https://www.cairographics.org/releases/cairomm-1.14.4.tar.xz.sha1
-sha1  a58419bb9792a2c998631704ce5671c38e0c82a1  cairomm-1.14.4.tar.xz
+# From https://www.cairographics.org/releases/cairomm-1.14.5.tar.xz.sha1
+sha1  c33938b021046619d86cd2631f4c79dfd0f5bdac  cairomm-1.14.5.tar.xz
 
 # Locally computed
-sha256  4749d25a2b2ef67cc0c014caaf5c87fa46792fc4b3ede186fb0fc932d2055158  cairomm-1.14.4.tar.xz
+sha256  70136203540c884e89ce1c9edfb6369b9953937f6cd596d97c78c9758a5d48db  cairomm-1.14.5.tar.xz
 sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
diff --git a/package/cairomm1_14/cairomm1_14.mk b/package/cairomm1_14/cairomm1_14.mk
index 6502d34c5a..b19ba08cfd 100644
--- a/package/cairomm1_14/cairomm1_14.mk
+++ b/package/cairomm1_14/cairomm1_14.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIROMM1_14_VERSION = 1.14.4
+CAIROMM1_14_VERSION = 1.14.5
 CAIROMM1_14_LICENSE = LGPL-2.0+
 CAIROMM1_14_LICENSE_FILES = COPYING
 CAIROMM1_14_SOURCE = cairomm-$(CAIROMM1_14_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
