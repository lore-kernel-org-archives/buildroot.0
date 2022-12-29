Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478EAC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F29CB83EFE;
	Mon, 20 Feb 2023 23:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F29CB83EFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wQc0XoUo-ocC; Mon, 20 Feb 2023 23:35:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13B28830C0;
	Mon, 20 Feb 2023 23:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13B28830C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC7331BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25ED1612BA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25ED1612BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vdFQyChP_3EP for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7E74617B1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7E74617B1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5A8A86494; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:03:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6a11ca5b218e42c970858ba1ef83ec8572c326c1
X-Git-Newrev: 7589bafecd9153d2d7d31978b245e184098753d2
X-Patchwork-Hint: ignore
Message-Id: <20230220205217.D5A8A86494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lcms2: bump to version
 2.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=7589bafecd9153d2d7d31978b245e184098753d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://littlecms.com/blog/2022/11/02/lcms2-2.14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lcms2/lcms2.hash | 6 +++---
 package/lcms2/lcms2.mk   | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index d20cf601fb..700b9746f1 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.13
-sha1  72d0a0b7fbaeca12eb0186ab5728eb0f26806b22  lcms2-2.13.1.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.14
+sha1  94350a2638fe58da736e8726048c859b46a69e6f  lcms2-2.14.tar.gz
 # Locally computed:
-sha256  d473e796e7b27c5af01bd6d1552d42b45b43457e7182ce9903f38bb748203b88  lcms2-2.13.1.tar.gz
+sha256  28474ea6f6591c4d4cee972123587001a4e6e353412a41b3e9e82219818d5740  lcms2-2.14.tar.gz
 sha256  46d4e05af3bce75332a12d01f19bcce7e32b6bac544be28a64043d0231291e31  COPYING
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 63750c43f2..743b0ec858 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LCMS2_VERSION_MAJOR = 2.13
-LCMS2_VERSION = $(LCMS2_VERSION_MAJOR).1
-LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION_MAJOR)
+LCMS2_VERSION = 2.14
+LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
 LCMS2_CPE_ID_VENDOR = littlecms
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
