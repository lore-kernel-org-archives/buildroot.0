Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BA6C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB85B4ECE2;
	Mon, 20 Feb 2023 22:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB85B4ECE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DAIeBrXpCIDU; Mon, 20 Feb 2023 22:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D5C14C65F;
	Mon, 20 Feb 2023 22:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D5C14C65F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 499AD1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDC22611D8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDC22611D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RMEsyCB5bHIT for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15B3C61086
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15B3C61086
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 142A0828C8; Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 11:39:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b69acab54b6b258d83833c8f51b09ee0913e9a4d
X-Git-Newrev: 271ad374ced4bfe325bf0d8ba21adb92793d2ae7
X-Patchwork-Hint: ignore
Message-Id: <20230220205205.142A0828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mosh: bump to version
 1.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=271ad374ced4bfe325bf0d8ba21adb92793d2ae7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Many new features & bugfixes.

https://github.com/mobile-shell/mosh/releases

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mosh/mosh.hash | 2 +-
 package/mosh/mosh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
index 3558bf9030..6c1d0e7af3 100644
--- a/package/mosh/mosh.hash
+++ b/package/mosh/mosh.hash
@@ -1,5 +1,5 @@
 # From https://mailman.mit.edu/pipermail/mosh-users/2017-July/000357.html
-sha256  da600573dfa827d88ce114e0fed30210689381bbdcff543c931e4d6a2e851216  mosh-1.3.2.tar.gz
+sha256  872e4b134e5df29c8933dff12350785054d2fd2839b5ae6b5587b14db1465ddd  mosh-1.4.0.tar.gz
 # Locally calculcated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8042495ddc8d99b883335d53552554eccf825fc1f0ba487d0f8e6656baaa8199  COPYING.iOS
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index f9e335799d..c938f70719 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSH_VERSION = 1.3.2
+MOSH_VERSION = 1.4.0
 MOSH_SITE = https://mosh.org
 MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
 MOSH_LICENSE = GPL-3.0+ with exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
