Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F073C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 21:34:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 091C46121E
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 21:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 091C46121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A8A560BC4;
	Wed, 20 Oct 2021 21:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgC718i20yEF; Wed, 20 Oct 2021 21:34:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC43160BBB;
	Wed, 20 Oct 2021 21:34:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68A411BF2C2
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 21:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 580CC402E0
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 21:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g3OHTCHx9wZ6 for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 21:34:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85D5E4028B
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 21:34:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 68BDD88135; Wed, 20 Oct 2021 21:30:57 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 23:34:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fd93fc47fcf5547fc90d4302f58c1052d405e62
X-Git-Newrev: b97696a2d26b1e88fcc982b2f15894fe97d97fe6
X-Patchwork-Hint: ignore
Message-Id: <20211020213057.68BDD88135@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sudo: bump to version 1.9.8p2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b97696a2d26b1e88fcc982b2f15894fe97d97fe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of license file due to removal of trailing whitespaces:
https://github.com/sudo-project/sudo/commit/bf7d20b482edea8c4f2f945a27f51c7eaf6aa203

https://www.sudo.ws/stable.html#1.9.8p2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sudo/sudo.hash | 4 ++--
 package/sudo/sudo.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index ee30b32265..1b494af69c 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: http://www.sudo.ws/download.html
-sha256  539e2ef43c8a55026697fb0474ab6a925a11206b5aa58710cb42a0e1c81f0978  sudo-1.9.5p2.tar.gz
+sha256  9e3b8b8da7def43b6e60c257abe80467205670fd0f7c081de1423c414b680f2d  sudo-1.9.8p2.tar.gz
 # Locally calculated
-sha256  505c5955c373514e2533a24a8346f44038e29cba874f5ca83beb171a7409089f  doc/LICENSE
+sha256  b678438594f04a7070a5fd125f7edffc871e13234baad318690b647bfc60705d  doc/LICENSE
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index df09161957..f2c074e55f 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION_MAJOR = 1.9.5
+SUDO_VERSION_MAJOR = 1.9.8
 SUDO_VERSION_MINOR = p2
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
