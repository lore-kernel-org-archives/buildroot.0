Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B180BEC8735
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 14:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA0EA41D91;
	Thu,  7 Sep 2023 14:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA0EA41D91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BxomWYG9yszk; Thu,  7 Sep 2023 14:51:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AB6341E62;
	Thu,  7 Sep 2023 14:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AB6341E62
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D7451BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3053481FFD
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3053481FFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZ8zYWoMxG0j for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29A4381FF0
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29A4381FF0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 184E186A21; Thu,  7 Sep 2023 14:51:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Aug 2023 23:59:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7991d2c48a859f9c0333ade8192868c21b1a8a31
X-Git-Newrev: fb99d902e4ee36e0f50b3fe0c2ec4a05358b1915
X-Patchwork-Hint: ignore
Message-Id: <20230907145125.184E186A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: bump version to 5.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb99d902e4ee36e0f50b3fe0c2ec4a05358b1915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://git.tukaani.org/?p=xz.git;a=blob;f=NEWS;hb=HEAD

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xz/xz.hash | 4 ++--
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 0a8a13f1eb..92bac40463 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://tukaani.org/xz/xz-5.4.3.tar.gz.sig
-sha256  9243a04598d7a70c1f567a0143a255581ac5c64b140fd55fd5cbc1e00b0e6f90  xz-5.4.3.tar.bz2
+# https://tukaani.org/xz/xz-5.4.4.tar.gz.sig
+sha256  0b6fcde1ac38e90433a2556f500c065950b9bcd2d602006efc334782bdfe6296  xz-5.4.4.tar.bz2
 
 # Hash for license files
 sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index dcdbe142b6..42fee82e80 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.4.3
+XZ_VERSION = 5.4.4
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
