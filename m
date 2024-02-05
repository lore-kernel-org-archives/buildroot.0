Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EEFC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 09:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55EC160F2A;
	Mon,  5 Feb 2024 09:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55EC160F2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EMywwuSLROxk; Mon,  5 Feb 2024 09:17:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 918E060EF7;
	Mon,  5 Feb 2024 09:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 918E060EF7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA8641BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 901CE40A56
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 901CE40A56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mz7D09X91lV4 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 09:16:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6587840A06
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 09:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6587840A06
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E6E286990; Mon,  5 Feb 2024 09:16:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 10:15:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d26991f76b0f6b57282c71a045e5f5fecb8f0374
X-Git-Newrev: 2c7e6a5d57b83f71f21821cd56c21e0514128a7e
X-Patchwork-Hint: ignore
Message-Id: <20240205091649.4E6E286990@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjpeg: bump to version 9f
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c7e6a5d57b83f71f21821cd56c21e0514128a7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of README (changes not related to license)

https://jpegclub.org/reference/reference-sources/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libjpeg/libjpeg.hash | 4 ++--
 package/libjpeg/libjpeg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libjpeg/libjpeg.hash b/package/libjpeg/libjpeg.hash
index 1a2e82caef..5c223b4e3c 100644
--- a/package/libjpeg/libjpeg.hash
+++ b/package/libjpeg/libjpeg.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  4077d6a6a75aeb01884f708919d25934c93305e49f7e3f36db9129320e6f4f3d  jpegsrc.v9e.tar.gz
-sha256  50c1c5978d490c7f13062d91c4b89affc83774f87bc4568a714f748b62a5b216  README
+sha256  04705c110cb2469caa79fb71fba3d7bf834914706e9641a4589485c1f832565b  jpegsrc.v9f.tar.gz
+sha256  7c25493a9f64fed34d01445467341bda77bc1cdbeccbe33558659ef173fb9ff2  README
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index caf7f05f44..2eb64e83e7 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJPEG_VERSION = 9e
+LIBJPEG_VERSION = 9f
 LIBJPEG_SITE = http://www.ijg.org/files
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = IJG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
