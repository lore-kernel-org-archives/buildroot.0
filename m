Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B95E6FE48
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CFE184A04;
	Fri,  6 Sep 2024 20:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mqkr10keLK3t; Fri,  6 Sep 2024 20:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5734E84A0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5734E84A0B;
	Fri,  6 Sep 2024 20:05:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF5D1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1618460770
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBug_Ad-X04z for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A456610C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A456610C1
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06E4B828CC; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 18:39:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91f3ffd847c95aff43886140854f52f9ef122171
X-Git-Newrev: b5fe7088e842aaaed1730f2d50d60e514e052105
X-Patchwork-Hint: ignore
Message-Id: <20240906195856.06E4B828CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.20.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5fe7088e842aaaed1730f2d50d60e514e052105
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.samba.org/samba/history/samba-4.20.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index d2512f2e0a..71fe862901 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.20.3.tar.asc
-sha256  afd5a9bb03e5c921c4c1d4e4b4fa6ea16cf798d94e5e5bffb9fd61716641cf30  samba-4.20.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.20.4.tar.asc
+sha256  3a92e97eaeb345b6b32232f503e14d34f03a7aa64c451fe8c258a11bbda908e5  samba-4.20.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index d48a02140f..f08303a346 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.20.3
+SAMBA4_VERSION = 4.20.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
