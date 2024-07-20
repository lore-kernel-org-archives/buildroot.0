Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FCCC3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9950B402C4;
	Sat, 20 Jul 2024 21:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTJjDpwyoSyl; Sat, 20 Jul 2024 21:10:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F3DA40549
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F3DA40549;
	Sat, 20 Jul 2024 21:10:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 163E11BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E31760731
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SilJzOV0bGN for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:10:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AFAE6068A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AFAE6068A
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:10:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46BF386EB5; Sat, 20 Jul 2024 21:10:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:09:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3461d083b53ac262dd31e2b93281cecdc8d3147
X-Git-Newrev: b409766234a3aabb33918b935b58704822345e9e
X-Patchwork-Hint: ignore
Message-Id: <20240720211034.46BF386EB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ksmbd-tools: bump to version 3.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b409766234a3aabb33918b935b58704822345e9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.5.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ksmbd-tools/ksmbd-tools.hash | 2 +-
 package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
index c3e6ebefe5..3367886d55 100644
--- a/package/ksmbd-tools/ksmbd-tools.hash
+++ b/package/ksmbd-tools/ksmbd-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ab377b3044c48382303f3f7ec95f2e1a17592c774d70b2a11f32952099dbb214  ksmbd-tools-3.5.1.tar.gz
+sha256  5da7fb4cb4368f9abf56f6f9fbc17b25e387876bed9ff7ee0d6f1140ef07c8d7  ksmbd-tools-3.5.2.tar.gz
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
index c56c6e10bb..261eddad7c 100644
--- a/package/ksmbd-tools/ksmbd-tools.mk
+++ b/package/ksmbd-tools/ksmbd-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KSMBD_TOOLS_VERSION = 3.5.1
+KSMBD_TOOLS_VERSION = 3.5.2
 KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
 KSMBD_TOOLS_LICENSE = GPL-2.0+
 KSMBD_TOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
