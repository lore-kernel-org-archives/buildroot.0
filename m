Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771F3C46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2187F43543;
	Fri, 29 Dec 2023 21:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2187F43543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-i5Gq0a3nRB; Fri, 29 Dec 2023 21:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EBA043699;
	Fri, 29 Dec 2023 21:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EBA043699
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 116E11BF99A
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC0F54009E
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC0F54009E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72_7Qfm2CYw3 for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF20940066
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF20940066
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF27983911; Fri, 29 Dec 2023 21:17:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 21:56:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70e3b5a800f86e08dce14cb4ac14a3d4d7679904
X-Git-Newrev: 5338da0771a119a16e105f168affa7d0d902b97d
X-Patchwork-Hint: ignore
Message-Id: <20231229211748.DF27983911@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lcms2: bump to version 2.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=5338da0771a119a16e105f168affa7d0d902b97d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file has been renamed and year updated with:
https://github.com/mm2/Little-CMS/commit/120410b92498478405ec571dc304d9c192e50a98
https://github.com/mm2/Little-CMS/commit/6bf0713c1c1155c3299bdee3b896f005170a4226

https://github.com/mm2/Little-CMS/releases/tag/lcms2.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lcms2/lcms2.hash | 8 ++++----
 package/lcms2/lcms2.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index 45728a36f1..362412e3c4 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.15
-sha1  b143ff29b03676119dbca30f13cbed72af15cce8  lcms2-2.15.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.16
+sha1  751d32ba11809e3591c118be9aae8ac2dbd41cb7  lcms2-2.16.tar.gz
 # Locally computed:
-sha256  b20cbcbd0f503433be2a4e81462106fa61050a35074dc24a4e356792d971ab39  lcms2-2.15.tar.gz
-sha256  46d4e05af3bce75332a12d01f19bcce7e32b6bac544be28a64043d0231291e31  COPYING
+sha256  d873d34ad8b9b4cea010631f1a6228d2087475e4dc5e763eb81acc23d9d45a51  lcms2-2.16.tar.gz
+sha256  6dbd60437f8ef91d8de1f08ad75882547fd4931bfcc3566a0735f28db1484d31  LICENSE
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 3892dbfbdc..92aeff8890 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.15
+LCMS2_VERSION = 2.16
 LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
-LCMS2_LICENSE_FILES = COPYING
+LCMS2_LICENSE_FILES = LICENSE
 LCMS2_CPE_ID_VENDOR = littlecms
 LCMS2_CPE_ID_PRODUCT = little_cms
 LCMS2_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
