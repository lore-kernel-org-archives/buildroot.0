Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0CEFA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAFE640376;
	Sun, 30 Oct 2022 11:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAFE640376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7tTMNHIw6NAP; Sun, 30 Oct 2022 11:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1532440347;
	Sun, 30 Oct 2022 11:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1532440347
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D01B1BF95C
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE7CF812FC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE7CF812FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UmMguS7M35xn for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26CCA812DB
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26CCA812DB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13A4D8746D; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:53:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a5178293fa9dcfab1e2599de6dd7d6b163c7007
X-Git-Newrev: 9cee6283459169a08cb72b96362de8bd4d1bb69f
X-Patchwork-Hint: ignore
Message-Id: <20221030110443.13A4D8746D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sedutil: bump to version 1.20.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9cee6283459169a08cb72b96362de8bd4d1bb69f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/Drive-Trust-Alliance/sedutil/compare/1.15.1...1.20.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sedutil/sedutil.hash | 2 +-
 package/sedutil/sedutil.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sedutil/sedutil.hash b/package/sedutil/sedutil.hash
index 26643ef684..2ceb5db659 100644
--- a/package/sedutil/sedutil.hash
+++ b/package/sedutil/sedutil.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9259466b4f73af276153c5245834a56f48f8721ea7263611b5d5e8326bc43d9e  sedutil-1.15.1.tar.gz
+sha256  88016b93cbbef98fa6f5c4e6f58e6c871662b6a7f1fc8dc788c8599fa37a44f3  sedutil-1.20.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  Common/LICENSE.txt
diff --git a/package/sedutil/sedutil.mk b/package/sedutil/sedutil.mk
index c80e43448d..566ed4fae8 100644
--- a/package/sedutil/sedutil.mk
+++ b/package/sedutil/sedutil.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEDUTIL_VERSION = 1.15.1
+SEDUTIL_VERSION = 1.20.0
 SEDUTIL_SITE = $(call github,Drive-Trust-Alliance,sedutil,$(SEDUTIL_VERSION))
 SEDUTIL_LICENSE = GPL-3.0+
 SEDUTIL_LICENSE_FILES = Common/LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
