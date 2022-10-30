Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AACDC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 212E680BA2;
	Sun, 30 Oct 2022 16:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 212E680BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vNYAjh3YQfDZ; Sun, 30 Oct 2022 16:29:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40EF980B37;
	Sun, 30 Oct 2022 16:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40EF980B37
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59C701BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DA628126C
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DA628126C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WEEvOFHFqlbE for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D73381281
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D73381281
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BAC987570; Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 17:20:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79cfc6841943fed1428ea59747920d6b68962b9e
X-Git-Newrev: 517db8e59c30da4d20d93d61466a6c90c5e22a6c
X-Patchwork-Hint: ignore
Message-Id: <20221030162807.3BAC987570@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: bump to version 2.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=517db8e59c30da4d20d93d61466a6c90c5e22a6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.infradead.org/pipermail/linux-mtd/2022-October/095383.html
https://lists.infradead.org/pipermail/linux-mtd/2022-January/090742.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mtd/mtd.hash | 4 ++--
 package/mtd/mtd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 481788f844..a2133e3ce2 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.3.tar.bz2.asc
-sha256  11305a5daf6fc6ed85120695c8593290b577effb039adbfa63d35b4418ff5630  mtd-utils-2.1.3.tar.bz2
+# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.5.tar.bz2.asc
+sha256  386e27fd121699b6b729bc2e8e04dda987b31cca6b16e12fb6cc6dcf26449f46  mtd-utils-2.1.5.tar.bz2
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 45e7c0c61c..6e266a8760 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.1.3
+MTD_VERSION = 2.1.5
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
