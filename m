Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D2CC54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 15:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B60605EB;
	Sat,  2 Mar 2024 15:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gWTjpoa2BGvU; Sat,  2 Mar 2024 15:30:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9891A60748
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9891A60748;
	Sat,  2 Mar 2024 15:30:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C162F1BF360
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 15:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF60781EC1
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 15:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZ9qXuoynKo1 for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 15:30:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A05281E0A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A05281E0A
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 15:30:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFB1D87DDF; Sat,  2 Mar 2024 15:30:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 2 Mar 2024 16:24:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8b33cb87b6de28e33ac46a20526ebe77c7591f1
X-Git-Newrev: 44dc77af0ed77cefd80985d6bd8380acdbdf1940
X-Patchwork-Hint: ignore
Message-Id: <20240302153025.DFB1D87DDF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: bump to version 2.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=44dc77af0ed77cefd80985d6bd8380acdbdf1940
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 6 +++---
 package/expat/expat.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 043501378b..980a9ab6a7 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.6.0/
-md5  bd169cb11f4b9bdfddadf9e88a5c4d4b  expat-2.6.0.tar.xz
-sha1  d87e8ab2a3c1deb858c6b22e5ade9d5673086004  expat-2.6.0.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.6.1/
+md5  84d0ee1c554212dc8f068e538de5b823  expat-2.6.1.tar.xz
+sha1  1a1804b7c565a8b21abbd3433ef67ed8a4476960  expat-2.6.1.tar.xz
 
 # Locally calculated
 sha256  cb5f5a8ea211e1cabd59be0a933a52e3c02cc326e86a4d387d8d218e7ee47a3e  expat-2.6.0.tar.xz
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 5f4016e0d1..e09fcc673f 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.6.0
+EXPAT_VERSION = 2.6.1
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
