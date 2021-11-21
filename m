Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160DEC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D20A082862;
	Mon,  6 Dec 2021 18:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iL900nLudbd5; Mon,  6 Dec 2021 18:26:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3581E82893;
	Mon,  6 Dec 2021 18:26:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E326C1BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8290360D76
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Quo1-9BtUVdU for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4D2160D69
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 80C2981468; Mon,  6 Dec 2021 18:07:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:49:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0db05a3d0a57187a017199aad66e97645078f3a1
X-Git-Newrev: 76a9c46b766e093ebb2e1705a5448fd9469e121c
X-Patchwork-Hint: ignore
Message-Id: <20211206180740.80C2981468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: bump version to 6.4.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=76a9c46b766e093ebb2e1705a5448fd9469e121c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/37388106/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 9935858b20..3d4c3da3dc 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/37376434/
-sha256  5f7a5e13731431134a2ca535bbced7adc666d3aeb93169a0830945d91f492300  fetchmail-6.4.23.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/37388106/
+sha256  9c961df25cd922f539218b0b56a77e7a47778e49ed907edaa5b4941ad3b253cf  fetchmail-6.4.24.tar.xz
 # Locally computed:
 sha256  001d1b8d111a83e3bab8b4d511ea4767d37d3bd0583560fccece630df1ba8f3c  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index c909bb5cfb..7d6be71954 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).23
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).24
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
