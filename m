Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77ED0C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3430141624;
	Tue,  1 Feb 2022 22:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xI3ckFFnOm1C; Tue,  1 Feb 2022 22:06:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53F8041615;
	Tue,  1 Feb 2022 22:06:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 236DC1BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E355A60B3A
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fAuXbXevLpCg for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C17760D54
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 40CF582817; Tue,  1 Feb 2022 21:58:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Feb 2022 22:58:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40f7b0bb6b91400b9e1fc60f410c9cdcbd1998ab
X-Git-Newrev: 145a401b3b2d94e39e76b7ffea154971711aa6f3
X-Patchwork-Hint: ignore
Message-Id: <20220201215822.40CF582817@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/umtprd: bump to version 1.6.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=145a401b3b2d94e39e76b7ffea154971711aa6f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/viveris/uMTP-Responder/blob/umtprd-1.6.2/Release-notes.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/umtprd/umtprd.hash | 4 ++--
 package/umtprd/umtprd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/umtprd/umtprd.hash b/package/umtprd/umtprd.hash
index 170837d84b..7cd75619ab 100644
--- a/package/umtprd/umtprd.hash
+++ b/package/umtprd/umtprd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	cce45c7d3df0022fc013c79de21b1f11b1027d090aeb628669f08b0c20d2afdd	umtprd-1.3.10.tar.gz
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	LICENSE
+sha256  1de40511c1dd4618719cff2058dfe68a595f1b9284c80afa89d6d1a1c80aec29  umtprd-1.6.2.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/umtprd/umtprd.mk b/package/umtprd/umtprd.mk
index f1a4e66cff..c5e0ee512e 100644
--- a/package/umtprd/umtprd.mk
+++ b/package/umtprd/umtprd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UMTPRD_VERSION = 1.3.10
+UMTPRD_VERSION = 1.6.2
 UMTPRD_SITE = https://github.com/viveris/uMTP-Responder/archive
 UMTPRD_LICENSE = GPL-3.0+
 UMTPRD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
