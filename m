Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2B2EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 20:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C4EF60ABD;
	Sat,  1 Jul 2023 20:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C4EF60ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIigpAzfauZJ; Sat,  1 Jul 2023 20:02:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E02C60AE2;
	Sat,  1 Jul 2023 20:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E02C60AE2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B1711BF2BA
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1503660AE2
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1503660AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lfKWLDw5nxXo for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 20:02:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A6A860ABD
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 20:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A6A860ABD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37C5F86277; Sat,  1 Jul 2023 20:02:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 22:00:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86cca91c2498eeb2cd91480de328755f3c32404c
X-Git-Newrev: 61f5ecc56e2cbd129dcfb1f94fef8e57180a5d45
X-Patchwork-Hint: ignore
Message-Id: <20230701200212.37C5F86277@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lightning: bump version to 2.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=61f5ecc56e2cbd129dcfb1f94fef8e57180a5d45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.gnu.org/archive/html/lightning/2023-04/msg00004.html

Fixes:
http://autobuild.buildroot.net/results/c50/c50fa2d861c634eb0800cf551fc4a7e5fa5752bf/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lightning/lightning.hash | 2 +-
 package/lightning/lightning.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lightning/lightning.hash b/package/lightning/lightning.hash
index 97b391674c..6f7c24d19c 100644
--- a/package/lightning/lightning.hash
+++ b/package/lightning/lightning.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98671681d5684770ccb06a07fa3b8f032a454bdb56eafc18e6fab04459ea3caa  lightning-2.2.1.tar.gz
+sha256  0aca8242dead17d62117bcfcb078e6a9ea856cc81742813c9e8394bcce73b3e2  lightning-2.2.2.tar.gz
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index 4a8c7e5efd..c23ae9745e 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIGHTNING_VERSION = 2.2.1
+LIGHTNING_VERSION = 2.2.2
 LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
 LIGHTNING_LICENSE = LGPL-3.0+
 LIGHTNING_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
