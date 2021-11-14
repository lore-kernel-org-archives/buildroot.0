Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD758C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:09:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A06860FD8
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A06860FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E57F40338;
	Sun, 14 Nov 2021 14:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id glVXfON0-OdZ; Sun, 14 Nov 2021 14:09:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E0FD40277;
	Sun, 14 Nov 2021 14:09:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE3B61BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DA9640329
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzBI9KqGuGwl for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:09:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF9F640272
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:09:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 921458D1DB; Sun, 14 Nov 2021 14:05:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:09:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7fcf5f3152f2881e2db3357e61abb793782e90e2
X-Git-Newrev: 7ccfc1ffbddd9b6195967f83fc78833decd10ef1
X-Patchwork-Hint: ignore
Message-Id: <20211114140518.921458D1DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/luarocks: bump to
 version 3.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ccfc1ffbddd9b6195967f83fc78833decd10ef1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 42e039214c..d80e08a200 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9255d97fee95cec5b54fc6ac718b11bf5029e45bed7873e053314919cd448551  luarocks-3.7.0.tar.gz
+sha256  56ab9b90f5acbc42eb7a94cf482e6c058a63e8a1effdf572b8b2a6323a06d923  luarocks-3.8.0.tar.gz
 sha256  542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 28a421925e..028e144e25 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.7.0
-LUAROCKS_SITE = http://luarocks.org/releases
+LUAROCKS_VERSION = 3.8.0
+LUAROCKS_SITE = https://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
