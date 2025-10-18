Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03332CCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 16:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9E3180FFF;
	Sat, 18 Oct 2025 16:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pswWDD-QdAAN; Sat, 18 Oct 2025 16:29:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEE5181098
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEE5181098;
	Sat, 18 Oct 2025 16:29:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27DED43F
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F53F60B60
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-KqnvpIl9Ee for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 16:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 728D560B62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 728D560B62
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:29:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60F90874A8; Sat, 18 Oct 2025 16:29:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 18:18:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7410161d2b431616f5b28bc169e4241ae3ca9331
X-Git-Newrev: 23db2ff030e165fb82c760c68e9a4055fa8438a6
X-Patchwork-Hint: ignore
Message-Id: <20251018162937.60F90874A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cage: bump to version 0.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=23db2ff030e165fb82c760c68e9a4055fa8438a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/cage-kiosk/cage/releases/tag/v0.2.1

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cage/cage.hash | 2 +-
 package/cage/cage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cage/cage.hash b/package/cage/cage.hash
index 4d376c322d..018404a2c5 100644
--- a/package/cage/cage.hash
+++ b/package/cage/cage.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  6b72e034c78c55432ad815e651ead8bd732ccc2087b08c666a68b865ba72ceff  cage-v0.2.0-15-g2e593fe5a8a2186a558ceb414674775e4ba5d2b1-git4.tar.gz
+sha256  9603ba1a130696dd39793ffab68397db504b378a733c09c0b86a5ebe3d6fe58d  cage-v0.2.1-git4.tar.gz
 
 # Hashes for license files:
 sha256  e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index 7f8fff4833..9b5778449b 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAGE_VERSION = v0.2.0-15-g2e593fe5a8a2186a558ceb414674775e4ba5d2b1
+CAGE_VERSION = v0.2.1
 CAGE_SITE = https://github.com/cage-kiosk/cage.git
 CAGE_SITE_METHOD = git
 CAGE_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
