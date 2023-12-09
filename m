Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAAAC4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 15:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD8E860F49;
	Sat,  9 Dec 2023 15:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD8E860F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9NaP-6DJLkK4; Sat,  9 Dec 2023 15:04:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1241460F22;
	Sat,  9 Dec 2023 15:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1241460F22
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BDDD1BF2AB
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 15:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0513940580
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 15:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0513940580
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1k7f3hp3rCxr for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 15:04:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E0D340570
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 15:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E0D340570
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF07287572; Sat,  9 Dec 2023 15:04:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Dec 2023 16:02:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a32e41b09a7b6547a7df8499c47f6ab63798814b
X-Git-Newrev: db93c5a18c1c24523c3718ee49a66bbeb3783b96
X-Patchwork-Hint: ignore
Message-Id: <20231209150412.EF07287572@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gloox: bump version to 1.0.28
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

commit: https://git.buildroot.net/buildroot/commit/?id=db93c5a18c1c24523c3718ee49a66bbeb3783b96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gloox/gloox.hash | 2 +-
 package/gloox/gloox.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gloox/gloox.hash b/package/gloox/gloox.hash
index 66a3c2d1be..963b798299 100644
--- a/package/gloox/gloox.hash
+++ b/package/gloox/gloox.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0b8b7371439bc58d9e51384b616c964b18b7b41b87af1b7855104380eda86ffb  gloox-1.0.27.tar.bz2
+sha256  591bd12c249ede0b50a1ef6b99ac0de8ef9c1ba4fd2e186f97a740215cc5966c  gloox-1.0.28.tar.bz2
 sha256  40a20c41c8dabb8ba61bea983fa8f2f6989e67fac56bb62c2249053807fd26af  LICENSE
diff --git a/package/gloox/gloox.mk b/package/gloox/gloox.mk
index 3495db96f0..0d24f8008b 100644
--- a/package/gloox/gloox.mk
+++ b/package/gloox/gloox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLOOX_VERSION = 1.0.27
+GLOOX_VERSION = 1.0.28
 GLOOX_SOURCE = gloox-$(GLOOX_VERSION).tar.bz2
 GLOOX_SITE = https://camaya.net/download
 GLOOX_LICENSE = GPL-3.0 with OpenSSL exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
