Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4335DC3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 22:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D38C080FA4;
	Sun, 17 Dec 2023 22:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D38C080FA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id faMxTVa4oOQQ; Sun, 17 Dec 2023 22:01:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC3681E3A;
	Sun, 17 Dec 2023 22:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BC3681E3A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E47F91BF371
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 22:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9F9060A84
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 22:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9F9060A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q96HV-Xi99dK for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 22:01:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7800608A6
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 22:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7800608A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3A1A87B46; Sun, 17 Dec 2023 22:01:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 Dec 2023 22:48:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b71ce5018adb99c93e9b7d1fae4c2926c0fe130
X-Git-Newrev: afa5c2da338a555ba0c11e5e352c987449288c0a
X-Patchwork-Hint: ignore
Message-Id: <20231217220104.C3A1A87B46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/firewalld: bump version to 2.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=afa5c2da338a555ba0c11e5e352c987449288c0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/firewalld/firewalld.hash | 2 +-
 package/firewalld/firewalld.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/firewalld/firewalld.hash b/package/firewalld/firewalld.hash
index 53bfed0347..cbd4c7685b 100644
--- a/package/firewalld/firewalld.hash
+++ b/package/firewalld/firewalld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  61022eec66fa7ea0561924dfe65d17bab5ec512b3559198a05048a32264612d1  firewalld-2.0.1.tar.gz
+sha256  1433247299367f707279d50e0759ed27fbcc9bb973b7b2131e8cee96e006d96e  firewalld-2.0.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index 23ba1e6c2a..eae8afc27f 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIREWALLD_VERSION = 2.0.1
+FIREWALLD_VERSION = 2.0.2
 FIREWALLD_SITE = $(call github,firewalld,firewalld,v$(FIREWALLD_VERSION))
 FIREWALLD_LICENSE = GPL-2.0
 FIREWALLD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
