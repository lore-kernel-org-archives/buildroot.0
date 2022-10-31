Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679A9FA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 09:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11125400AC;
	Mon, 31 Oct 2022 09:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11125400AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zVW0a3jQxGPV; Mon, 31 Oct 2022 09:59:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAD9E4019F;
	Mon, 31 Oct 2022 09:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAD9E4019F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C7821BF358
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F092402E5
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F092402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id scOpQUrdgcv8 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:57:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26CA34033F
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26CA34033F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24DB387864; Mon, 31 Oct 2022 09:57:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 10:50:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35a6c9cb0dc7f9f7015ecedb9761b1d63a8a587d
X-Git-Newrev: 69ee6fdef440ff69ec174e69b5b0ca214f6c2ee7
X-Patchwork-Hint: ignore
Message-Id: <20221031095716.24DB387864@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups-pk-helper: bump to version
 0.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=69ee6fdef440ff69ec174e69b5b0ca214f6c2ee7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to meson-package

https://gitlab.freedesktop.org/cups-pk-helper/cups-pk-helper/-/blob/0.2.7/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cups-pk-helper/cups-pk-helper.hash | 3 ++-
 package/cups-pk-helper/cups-pk-helper.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/cups-pk-helper/cups-pk-helper.hash b/package/cups-pk-helper/cups-pk-helper.hash
index 18fe789389..75c5a5ffda 100644
--- a/package/cups-pk-helper/cups-pk-helper.hash
+++ b/package/cups-pk-helper/cups-pk-helper.hash
@@ -1,3 +1,4 @@
+# From https://www.freedesktop.org/software/cups-pk-helper/releases/cups-pk-helper-0.2.7.tar.xz.sha256sum
+sha256  66070ddb448fe9fcee76aa26be2ede5a80f85563e3a4afd59d2bfd79fbe2e831  cups-pk-helper-0.2.7.tar.xz
 # Locally computed:
-sha256  959af8f2f5a2761e7e498b61c9caf25ae963335031eae9972d999e9a0d97a228  cups-pk-helper-0.2.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/cups-pk-helper/cups-pk-helper.mk b/package/cups-pk-helper/cups-pk-helper.mk
index c688743160..2bd00c6912 100644
--- a/package/cups-pk-helper/cups-pk-helper.mk
+++ b/package/cups-pk-helper/cups-pk-helper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_PK_HELPER_VERSION = 0.2.6
+CUPS_PK_HELPER_VERSION = 0.2.7
 CUPS_PK_HELPER_SITE = https://www.freedesktop.org/software/cups-pk-helper/releases
 CUPS_PK_HELPER_SOURCE = cups-pk-helper-$(CUPS_PK_HELPER_VERSION).tar.xz
 CUPS_PK_HELPER_LICENSE = GPL-2.0+
@@ -12,4 +12,4 @@ CUPS_PK_HELPER_LICENSE_FILES = COPYING
 CUPS_PK_HELPER_CPE_ID_VENDOR = cups-pk-helper_project
 CUPS_PK_HELPER_DEPENDENCIES = cups libglib2 polkit
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
