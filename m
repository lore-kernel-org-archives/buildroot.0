Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6349DC02193
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 18:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FDD060770;
	Mon,  3 Feb 2025 18:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCnUcMjuYOnf; Mon,  3 Feb 2025 18:46:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 335EE607B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 335EE607B1;
	Mon,  3 Feb 2025 18:46:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB999185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF9EC82102
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wB25kxoYeWTL for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 18:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BADD820D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BADD820D4
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:45:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFF2E86A02; Mon,  3 Feb 2025 18:45:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 19:45:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3ef04114b146a91515eff8a1e207b4bdab89c0a
X-Git-Newrev: 1c027aa66990f92f44be3742ff375941db3fdd30
X-Patchwork-Hint: ignore
Message-Id: <20250203184558.EFF2E86A02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-pi: bump to version
 af8c8d66c5f40a6aaf366882bb9ca525be9c600a
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1c027aa66990f92f44be3742ff375941db3fdd30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/flutter-pi/flutter-pi.hash | 2 +-
 package/flutter-pi/flutter-pi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
index 6a73524745..892aff75f5 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c3c7df5712cd7c45539b325b0d8d58d0942b08a6f66c55e3f53aa5225cbe86af  flutter-pi-37bd9773c1938e5f76208bc4e8632fdbbb4190ff-git4.tar.gz
+sha256  b30e8b67109a81a7c2a2bbec3d82491b69e827a1eb84c529f3e31691c19671d5  flutter-pi-af8c8d66c5f40a6aaf366882bb9ca525be9c600a-git4.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index fad1da3215..4444493e61 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PI_VERSION = 37bd9773c1938e5f76208bc4e8632fdbbb4190ff
+FLUTTER_PI_VERSION = af8c8d66c5f40a6aaf366882bb9ca525be9c600a
 FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
 FLUTTER_PI_SITE_METHOD = git
 FLUTTER_PI_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
