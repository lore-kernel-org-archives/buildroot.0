Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E840AC4332F
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 08:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87C6C607B0;
	Fri,  4 Nov 2022 08:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87C6C607B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2jp7XminjCzK; Fri,  4 Nov 2022 08:14:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EC8C605EE;
	Fri,  4 Nov 2022 08:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EC8C605EE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E06C81BF2AB
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 08:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C90C8605EE
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 08:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C90C8605EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8R4djDT-SFAd for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 08:14:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCD85605EA
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 08:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCD85605EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCFFB87DA6; Fri,  4 Nov 2022 08:14:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Nov 2022 09:12:48 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 36222e99f43b2c6cbcac73942d75b5c6b22d6691
X-Git-Newrev: 645b4fb5149d5a9ef53346458c7492847e256bb7
X-Patchwork-Hint: ignore
Message-Id: <20221104081438.CCFFB87DA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/libpng: bump to
 version 1.6.38
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

commit: https://git.buildroot.net/buildroot/commit/?id=645b4fb5149d5a9ef53346458c7492847e256bb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Version 1.6.38 [September 14, 2022]
  Added configurations and scripts for continuous integration.
  Fixed various errors in the handling of tRNS, hIST and eXIf.
  Implemented many stability improvements across all platforms.
  Updated the internal documentation.

Update hash of LICENSE file (update in year with
https://sourceforge.net/p/libpng/code/ci/723b2d9f2e2bb65c605274ee052f9773e594a5aa)

https://sourceforge.net/p/libpng/code/ci/v1.6.38/tree/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6fa63bce3f95105220474c1bc6b940e8f2340546)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.hash | 10 +++++-----
 package/libpng/libpng.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index b57b1251a0..34b0a8a8b6 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.37/
-md5  015e8e15db1eecde5f2eb9eb5b6e59e9  libpng-1.6.37.tar.xz
-sha1  3ab93fabbf4c27e1c4724371df408d9a1bd3f656  libpng-1.6.37.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.38/
+md5  122e6b7837811698563083b352bc8ca2  libpng-1.6.38.tar.xz
+sha1  60960ed110094843e5efa221df6a7d21614a4dba  libpng-1.6.38.tar.xz
 # Locally computed:
-sha256  505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca  libpng-1.6.37.tar.xz
-sha256  bf5e22b9dce8464064ae17a48ea1133c3369ac9e1d80ef9e320e5219aa14ea9b  LICENSE
+sha256  b3683e8b8111ebf6f1ac004ebb6b0c975cd310ec469d98364388e9cedbfa68be  libpng-1.6.38.tar.xz
+sha256  dfe5a536b0e5a531f844fb9c101a3089aca60772a503893b8e15f9457e369960  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index e4e629bbb5..43b4f373f1 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.37
+LIBPNG_VERSION = 1.6.38
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
