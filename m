Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7E4C71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63829403B2;
	Tue, 17 Jun 2025 19:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAw5F77I0MJd; Tue, 17 Jun 2025 19:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9238F40364
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9238F40364;
	Tue, 17 Jun 2025 19:00:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CEA3C16B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 18:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C063A40377
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 18:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUPRZ9DeRvVw for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 18:59:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C60B40339
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C60B40339
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 18:59:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE07D83CFE; Tue, 17 Jun 2025 18:59:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Jun 2025 20:58:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77684698264d32cf20c4953b60b1021ae87e2a26
X-Git-Newrev: 49acad9f175443e0fa308a9208c321ae5fb007ae
X-Patchwork-Hint: ignore
Message-Id: <20250617185958.EE07D83CFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lcms2: bump version to 2.17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=49acad9f175443e0fa308a9208c321ae5fb007ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://littlecms.com/blog/2025/02/08/lcms2-2.17/

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lcms2/lcms2.hash | 6 +++---
 package/lcms2/lcms2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index 362412e3c4..eef8229eef 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.16
-sha1  751d32ba11809e3591c118be9aae8ac2dbd41cb7  lcms2-2.16.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.17
+sha1  213382ca260cf761f264f185407f75bb1c6e2ce8  lcms2-2.17.tar.gz
 # Locally computed:
-sha256  d873d34ad8b9b4cea010631f1a6228d2087475e4dc5e763eb81acc23d9d45a51  lcms2-2.16.tar.gz
+sha256  d11af569e42a1baa1650d20ad61d12e41af4fead4aa7964a01f93b08b53ab074  lcms2-2.17.tar.gz
 sha256  6dbd60437f8ef91d8de1f08ad75882547fd4931bfcc3566a0735f28db1484d31  LICENSE
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 92aeff8890..5137c7ea20 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.16
-LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
+LCMS2_VERSION = 2.17
+LCMS2_SITE = https://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = LICENSE
 LCMS2_CPE_ID_VENDOR = littlecms
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
