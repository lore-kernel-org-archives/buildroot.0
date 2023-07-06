Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0097AEB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 12:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8753E40A6A;
	Thu,  6 Jul 2023 12:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8753E40A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vdZCP20inOsl; Thu,  6 Jul 2023 12:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C91E741532;
	Thu,  6 Jul 2023 12:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C91E741532
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 939441BF85D
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 12:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DAFF60B45
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 12:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DAFF60B45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ujxYlo0pqJAq for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 12:08:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A198460B3D
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 12:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A198460B3D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F67D8690B; Thu,  6 Jul 2023 12:08:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 14:02:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6021f3678b44d43da7057e3135da842cde1ffa05
X-Git-Newrev: a7e4f557f5c5874c84d6ae2e28d752603e18ab3f
X-Patchwork-Hint: ignore
Message-Id: <20230706120823.8F67D8690B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: bump version to 1.36.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7e4f557f5c5874c84d6ae2e28d752603e18ab3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.hash | 4 ++--
 package/busybox/busybox.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 6d1c36906d..6eba365ecc 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,5 +1,5 @@
-# From https://busybox.net/downloads/busybox-1.35.0.tar.bz2.sha256
-sha256  542750c8af7cb2630e201780b4f99f3dcceeb06f505b479ec68241c1e6af61a5  busybox-1.36.0.tar.bz2
+# From https://busybox.net/downloads/busybox-1.36.1.tar.bz2.sha256
+sha256  b8cc24c9574d809e7279c3be349795c5d5ceb6fdf19ca709f80cde50e47de314  busybox-1.36.1.tar.bz2
 # Locally computed
 sha256  bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
 sha256  b5a136ed67798e51fe2e0ca0b2a21cb01b904ff0c9f7d563a6292e276607e58f  archival/libarchive/bz/LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index fd4f3c17c5..eb5e7ad922 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.36.0
+BUSYBOX_VERSION = 1.36.1
 BUSYBOX_SITE = https://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
