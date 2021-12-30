Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EDFC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 12:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7EA360BE0;
	Thu, 30 Dec 2021 12:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zLraqIOHpeXa; Thu, 30 Dec 2021 12:28:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BE3A60BE9;
	Thu, 30 Dec 2021 12:28:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FF0B1BF3EF
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8C2480BFB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AcO54_NzdiL2 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33B0580C25
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 67B3982DA1; Thu, 30 Dec 2021 12:20:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 13:21:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b29096f8fcb0acd8890073a56ba9d620b1f911c
X-Git-Newrev: 81d14a86258592b66b3cb170cda554a1eabf2c3f
X-Patchwork-Hint: ignore
Message-Id: <20211230122038.67B3982DA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/neard: bump to version 0.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=81d14a86258592b66b3cb170cda554a1eabf2c3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Retrieved latest release from git

https://git.kernel.org/pub/scm/network/nfc/neard.git/tree/ChangeLog?h=v0.18

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/neard/neard.hash |  3 +--
 package/neard/neard.mk   | 10 ++++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/neard/neard.hash b/package/neard/neard.hash
index 948314ddd7..1ea95c938a 100644
--- a/package/neard/neard.hash
+++ b/package/neard/neard.hash
@@ -1,4 +1,3 @@
-# From https://www.kernel.org/pub/linux/network/nfc/sha256sums.asc
-sha256  eae3b11c541a988ec11ca94b7deab01080cd5b58cfef3ced6ceac9b6e6e65b36  neard-0.16.tar.xz
 # Locally computed
+sha256  c013e3115315e2e11d16b5f0f1c8ce9afbcdba26800aad91245fd9b4a5dc938b  neard-0.18.tar.gz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index a351469102..1ab3aa353e 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-NEARD_VERSION = 0.16
-NEARD_SOURCE = neard-$(NEARD_VERSION).tar.xz
-NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
+NEARD_VERSION = 0.18
+NEARD_SITE = https://git.kernel.org/pub/scm/network/nfc/neard.git/snapshot
 NEARD_LICENSE = GPL-2.0
 NEARD_LICENSE_FILES = COPYING
 
-NEARD_DEPENDENCIES = host-pkgconf dbus libglib2 libnl
+NEARD_DEPENDENCIES = host-autoconf-archive host-pkgconf dbus libglib2 libnl
+# From git
+NEARD_AUTORECONF = YES
+NEARD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 NEARD_CONF_OPTS = --disable-traces
 
 ifeq ($(BR2_PACKAGE_NEARD_TOOLS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
