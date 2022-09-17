Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD21C6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 19:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EC7741CD1;
	Sat, 17 Sep 2022 19:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EC7741CD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UwgLG1GsgGcb; Sat, 17 Sep 2022 19:44:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88FDC4193B;
	Sat, 17 Sep 2022 19:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88FDC4193B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05EBB1BF267
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4BA14193B
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4BA14193B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YXbnuCncDCz9 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 19:44:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CB90418FD
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 19:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CB90418FD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85E3C8463F; Sat, 17 Sep 2022 19:44:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 21:33:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa47ff60dabd28d1356d72fce56bd7b4191788eb
X-Git-Newrev: 09f75ce62ff267edec73cbf247a099feca96e43c
X-Patchwork-Hint: ignore
Message-Id: <20220917194425.85E3C8463F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsigc: bump to version 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=09f75ce62ff267edec73cbf247a099feca96e43c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/libsigcplusplus/libsigcplusplus/blob/3.2.0/NEWS

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsigc/libsigc.hash | 4 ++--
 package/libsigc/libsigc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsigc/libsigc.hash b/package/libsigc/libsigc.hash
index 97c9d0cc84..046584fc2b 100644
--- a/package/libsigc/libsigc.hash
+++ b/package/libsigc/libsigc.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/3.0/libsigc++-3.0.7.sha256sum
-sha256  bfbe91c0d094ea6bbc6cbd3909b7d98c6561eea8b6d9c0c25add906a6e83d733  libsigc++-3.0.7.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/3.2/libsigc++-3.2.0.sha256sum
+sha256  8cdcb986e3f0a7c5b4474aa3c833d676e62469509f4899110ddf118f04082651  libsigc++-3.2.0.tar.xz
 
 # Locally calculated
 sha256  97628afebc60f026f5c2b25d7491c46a5c4ee61f693e7cfa07fbd2c03605979b  COPYING
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 18be25fd03..eca4111ff6 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSIGC_VERSION_MAJOR = 3.0
-LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).7
+LIBSIGC_VERSION_MAJOR = 3.2
+LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).0
 LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/$(LIBSIGC_VERSION_MAJOR)
 LIBSIGC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
