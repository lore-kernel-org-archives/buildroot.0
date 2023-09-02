Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00984EC8737
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0432831EF;
	Thu,  7 Sep 2023 15:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0432831EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0UbzhqTGVL6; Thu,  7 Sep 2023 15:16:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F00C883A43;
	Thu,  7 Sep 2023 15:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F00C883A43
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8FB21BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED078612AD
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED078612AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fyp0vKpRv3nV for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37F47612B1
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37F47612B1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3634286A22; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 09:36:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b3388f1e2a23f9cfa922128304e6db803e1093c
X-Git-Newrev: d0e30b87f9a278218950000882c607cf39a79e45
X-Patchwork-Hint: ignore
Message-Id: <20230907145134.3634286A22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freetype: bump to version 2.13.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0e30b87f9a278218950000882c607cf39a79e45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index ea03526c99..e7331d5ba0 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.1/
-sha1  af9b6b754320a0526179f166e3f8cffce78526ca  freetype-2.13.1.tar.xz
-sha256  ea67e3b019b1104d1667aa274f5dc307d8cbd606b399bc32df308a77f1a564bf  freetype-2.13.1.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.2/
+sha1  2d8d5917a1983ebd04921f2993a88858d6f72dec  freetype-2.13.2.tar.xz
+sha256  12991c4e55c506dd7f9b765933e62fd2be2e06d421505d7950a132e4f1bb484d  freetype-2.13.2.tar.xz
 
 # Locally calculated
 sha256  2e3bbb7d7c5c396368dd0853a790ec29ce5b8647163dde42a0493fb0d6556b2b  LICENSE.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index c6bc0673f6..1f4bcaf341 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.13.1
+FREETYPE_VERSION = 2.13.2
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
