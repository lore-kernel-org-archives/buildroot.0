Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01699C04AB8
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 17:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88A7261318;
	Wed, 20 Sep 2023 17:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88A7261318
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yZDJZopAJaVk; Wed, 20 Sep 2023 17:31:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2D0860DDF;
	Wed, 20 Sep 2023 17:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2D0860DDF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E9811BF95F
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83B1C41FA2
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83B1C41FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0bwY_ViKhZXa for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 17:31:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62F0541962
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 17:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62F0541962
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EAEE87336; Wed, 20 Sep 2023 17:31:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 19:17:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96130dc204d193f68070f8aa1665123e913c5f5b
X-Git-Newrev: 334d8078483f779b743b8e36dc34b2aab4220b18
X-Patchwork-Hint: ignore
Message-Id: <20230920173110.4EAEE87336@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sshguard: bump to version 2.4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=334d8078483f779b743b8e36dc34b2aab4220b18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sshguard/sshguard.hash | 4 ++--
 package/sshguard/sshguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sshguard/sshguard.hash b/package/sshguard/sshguard.hash
index b1752f1c68..d018428d19 100644
--- a/package/sshguard/sshguard.hash
+++ b/package/sshguard/sshguard.hash
@@ -1,4 +1,4 @@
-# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.4.2/sshguard-2.4.2.sha256
-sha256  2770b776e5ea70a9bedfec4fd84d57400afa927f0f7522870d2dcbbe1ace37e8  sshguard-2.4.2.tar.gz
+# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.4.3/sshguard-2.4.3.sha256
+sha256  64029deff6de90fdeefb1f497d414f0e4045076693a91da1a70eb7595e97efeb  sshguard-2.4.3.tar.gz
 # Locally calculated
 sha256  c3ae64f12153a1bc55bc234d09f40a08ab0e0149fffc972c0b7f02d5a12c1a5c  COPYING
diff --git a/package/sshguard/sshguard.mk b/package/sshguard/sshguard.mk
index d27c76e63f..8d03635743 100644
--- a/package/sshguard/sshguard.mk
+++ b/package/sshguard/sshguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHGUARD_VERSION = 2.4.2
+SSHGUARD_VERSION = 2.4.3
 SSHGUARD_SITE = https://sourceforge.net/projects/sshguard/files/sshguard/$(SSHGUARD_VERSION)
 SSHGUARD_LICENSE = ISC, Public Domain (fnv hash), BSD-3-Clause (SimCList)
 SSHGUARD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
