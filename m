Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E5CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 12:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DC6760BEC;
	Thu, 30 Dec 2021 12:27:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBYxrwrethrs; Thu, 30 Dec 2021 12:27:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDDF560BE8;
	Thu, 30 Dec 2021 12:27:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04B751BF3EF
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B256C60BE0
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJ2Ayhe639k8 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A4C060BE5
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4E2E182DA1; Thu, 30 Dec 2021 12:20:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 13:21:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b4e5f4c57f71e0b0677792818cd6fb526e65493
X-Git-Newrev: 6969ec0f74a48f8bb37a6ccf8c93907960925fd0
X-Patchwork-Hint: ignore
Message-Id: <20211230122038.4E2E182DA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcli: bump to version 1.10.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=6969ec0f74a48f8bb37a6ccf8c93907960925fd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/dparrish/libcli/releases/tag/V1.10.5
https://github.com/dparrish/libcli/releases/tag/V1.10.6
https://github.com/dparrish/libcli/releases/tag/V1.10.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcli/libcli.hash | 2 +-
 package/libcli/libcli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcli/libcli.hash b/package/libcli/libcli.hash
index a17a176fe5..a1a5459e9c 100644
--- a/package/libcli/libcli.hash
+++ b/package/libcli/libcli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  43efade6f3deb621e1e226b7854274a869fca57e12e74e61c5496d5dea7c445d  libcli-1.10.4.tar.gz
+sha256  179f78592f73492c22cc1b544b6f8cb0f6630a2f670430c118b8e084e6562e74  libcli-1.10.7.tar.gz
 sha256  376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  COPYING
diff --git a/package/libcli/libcli.mk b/package/libcli/libcli.mk
index 2dedc9d5df..a18daa911c 100644
--- a/package/libcli/libcli.mk
+++ b/package/libcli/libcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCLI_VERSION = 1.10.4
+LIBCLI_VERSION = 1.10.7
 LIBCLI_SITE = $(call github,dparrish,libcli,V$(LIBCLI_VERSION))
 LIBCLI_LICENSE = LGPL-2.1
 LIBCLI_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
