Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57D8C433FE
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 889F240428;
	Mon,  6 Dec 2021 18:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Izy_PTvHnQaY; Mon,  6 Dec 2021 18:30:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF64641C63;
	Mon,  6 Dec 2021 18:30:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04EA01BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4AC641C49
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AmncWITVLzYC for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A95B41C2B
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8CD6481504; Mon,  6 Dec 2021 18:07:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:29:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d6e55627453a80c887b26ade354a174b6b4fb04
X-Git-Newrev: fd680ed98d6b5dc21ba130efc2f3886d91170b9a
X-Patchwork-Hint: ignore
Message-Id: <20211206180738.8CD6481504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luv: bump to version 1.42.0-1
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
Content-Type: multipart/mixed; boundary="===============4666191392916309143=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4666191392916309143==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fd680ed98d6b5dc21ba130efc2f3886d91170b9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 6dfd8b9f19..2fb2b5c4fc 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b5228a9d0eaacd9f862b6270c732d5c90773a28ce53b6d9e32a14050e7947f36  luv-1.42.0-0.tar.gz
+sha256  4b6fbaa89d2420edf6070ad9e522993e132bd7eb2540ff754c2b9f1497744db2  luv-1.42.0-1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index fae94fa6b2..2dc9af3b7a 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.42.0-0
+LUV_VERSION = 1.42.0-1
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt

--===============4666191392916309143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4666191392916309143==--
