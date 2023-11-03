Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0926AC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 09:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2344707E4;
	Fri,  3 Nov 2023 09:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2344707E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cpSsQqjfcoR4; Fri,  3 Nov 2023 09:32:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D86AD707F2;
	Fri,  3 Nov 2023 09:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D86AD707F2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEF451BF997
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C72B94F349
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C72B94F349
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3AsTDdL-EIQ for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 09:31:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3892A4F32B
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 09:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3892A4F32B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26391865A2; Fri,  3 Nov 2023 09:31:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Nov 2023 10:26:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7879e349c2edd099fbef52dd9dfd4b95dd45389
X-Git-Newrev: 770384bb94829ba8cea87a8de5ec8e3f0b9c7d64
X-Patchwork-Hint: ignore
Message-Id: <20231103093144.26391865A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gzip: bump to version 1.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=770384bb94829ba8cea87a8de5ec8e3f0b9c7d64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYING (http updated to https with
https://git.savannah.gnu.org/cgit/gzip.git/commit/?id=13dab4245e071c29ef8c36e0a2e0c3fb528b57f2)

https://lists.gnu.org/r/bug-gzip/2023-08/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gzip/gzip.hash | 6 +++---
 package/gzip/gzip.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
index 80b86f4797..4d9d0c721b 100644
--- a/package/gzip/gzip.hash
+++ b/package/gzip/gzip.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gzip/gzip-1.12.tar.xz.sig
+# https://ftp.gnu.org/gnu/gzip/gzip-1.13.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  ce5e03e519f637e1f814011ace35c4f87b33c0bbabeec35baf5fbd3479e91956  gzip-1.12.tar.xz
+sha256  7454eb6935db17c6655576c2e1b0fabefd38b4d0936e0f87f48cd062ce91a057  gzip-1.13.tar.xz
 # Locally calculated
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 2092df363c..330321352c 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GZIP_VERSION = 1.12
+GZIP_VERSION = 1.13
 GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 # Some other tools expect it to be in /bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
