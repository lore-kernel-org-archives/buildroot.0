Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839CFC43334
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 19:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDB7960C09;
	Wed,  6 Jul 2022 19:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDB7960C09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06ZtFbM2T86H; Wed,  6 Jul 2022 19:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00F9E60BF5;
	Wed,  6 Jul 2022 19:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00F9E60BF5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B18AE1BF32D
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 19:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A58B60D68
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 19:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A58B60D68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2IwR7pMfU0H for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 19:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BECB0607C9
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 19:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BECB0607C9
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0CB9182819; Wed,  6 Jul 2022 19:38:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 21:46:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f414afe53d5f050cf42173d7870791013a958919
X-Git-Newrev: 528fcb326f88c05e269f81abcf8ef6157d343f4d
X-Patchwork-Hint: ignore
Message-Id: <20220706193851.0CB9182819@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libyang: bump version to 2.0.194
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

commit: https://git.buildroot.net/buildroot/commit/?id=528fcb326f88c05e269f81abcf8ef6157d343f4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libyang/libyang.hash | 2 +-
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index df794cc9f1..c064c2e69c 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7ed65c3e180eb14183d72676468b2b81682baef0957d88d0114341d886c19093  libyang-2.0.164.tar.gz
+sha256  94898ee391c238dcd29ff21092e5dcab4e17b9623e88862a55b72fc6168846f8  libyang-2.0.194.tar.gz
 sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index e2dc810fe0..36f452ca07 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 2.0.164
+LIBYANG_VERSION = 2.0.194
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
