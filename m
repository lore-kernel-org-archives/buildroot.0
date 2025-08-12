Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECB5CA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 15:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD52E613BC;
	Tue, 12 Aug 2025 15:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLo716vvx6xo; Tue, 12 Aug 2025 15:42:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C645761503
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C645761503;
	Tue, 12 Aug 2025 15:42:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34845158
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25D93841BD
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nu9fBomb52U7 for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 15:42:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B75E841A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B75E841A4
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:42:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AD45874D4; Tue, 12 Aug 2025 15:42:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 Aug 2025 17:38:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1788598fff138078e5ebdcb96e9c23abe0b2bd68
X-Git-Newrev: 6e51f5835567051d5feb2e3d08e9a3c802e1a440
X-Patchwork-Hint: ignore
Message-Id: <20250812154215.3AD45874D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nut: bump to version
 2.8.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e51f5835567051d5feb2e3d08e9a3c802e1a440
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/networkupstools/nut/releases/tag/v2.8.4

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nut/nut.hash | 4 ++--
 package/nut/nut.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nut/nut.hash b/package/nut/nut.hash
index 7346070f77..0d78324818 100644
--- a/package/nut/nut.hash
+++ b/package/nut/nut.hash
@@ -1,5 +1,5 @@
-# From https://github.com/networkupstools/nut/releases/download/v2.8.3/nut-2.8.3.tar.gz.sha256
-sha256  d6ca17f0b39003bac7649eb17ab4a713e4d5fcaa8fd1aedca28357d59df095ed  nut-2.8.3.tar.gz
+# From https://github.com/networkupstools/nut/releases/download/v2.8.4/nut-2.8.4.tar.gz.sha256
+sha256  0130ba82ea79f04ba4f34c5249a85943977efd984ed7df6aec1a518d5a3594f8  nut-2.8.4.tar.gz
 
 # Locally computed
 sha256  40885775f43463c404d74bbd00a59fac6c0fe73f838d4520472d721917412577  COPYING
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 379f31bef2..4fc461a993 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUT_VERSION = 2.8.3
+NUT_VERSION = 2.8.4
 NUT_SITE = https://github.com/networkupstools/nut/releases/download/v$(NUT_VERSION)
 NUT_LICENSE = GPL-2.0+, GPL-3.0+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
