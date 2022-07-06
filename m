Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3637C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43E6A61131;
	Wed,  6 Jul 2022 21:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43E6A61131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98Ph1RtvqWDr; Wed,  6 Jul 2022 21:18:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32D6761123;
	Wed,  6 Jul 2022 21:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32D6761123
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 574E41BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F7E46111F
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F7E46111F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZWtI4GnL-7U6 for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:17:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BC2D6058A
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BC2D6058A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AFE2E82A4F; Wed,  6 Jul 2022 21:04:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:15:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 569873ae9d7caa7e33e72109314a3a3892c8ecd1
X-Git-Newrev: 0cd5902030958e356317cca4f398fc4e16ebc726
X-Patchwork-Hint: ignore
Message-Id: <20220706210420.AFE2E82A4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libva: bump version to 2.15.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cd5902030958e356317cca4f398fc4e16ebc726
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/intel/libva/blob/v2.15-branch/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva/libva.hash | 6 +++---
 package/libva/libva.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 4646a816bb..ecca9271cc 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva/releases/download/2.14.0/libva-2.14.0.tar.bz2.sha1sum
-sha1  36b482ec8c361a6c3a6198f4777409b136f2713c  libva-2.14.0.tar.bz2
+# From https://github.com/intel/libva/releases/download/2.15.0/libva-2.15.0.tar.bz2.sha1sum
+sha1  b4fca8600961336b246e80552f9b0278c187051b  libva-2.15.0.tar.bz2
 # Locally computed
-sha256  511e9a74d1ccfb548bc192290603082c11074ac59b17aadfd5d56a3f93e58454  libva-2.14.0.tar.bz2
+sha256  258ed409458d3e7a000e1908bc852619615ee6a933359c745fcd93eb3e461eca  libva-2.15.0.tar.bz2
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index db1cfd29be..f89dac335f 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.14.0
+LIBVA_VERSION = 2.15.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
