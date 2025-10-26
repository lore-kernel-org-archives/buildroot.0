Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DE8CCF9E9
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 18:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABC8840F8F;
	Sun, 26 Oct 2025 18:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKrUK14LmA51; Sun, 26 Oct 2025 18:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B483040F90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B483040F90;
	Sun, 26 Oct 2025 18:14:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EB2A25B
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 18:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30ED640F90
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 18:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C90zzfY_3gQR for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 18:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7348B40F8F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7348B40F8F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 18:14:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A6088760B; Sun, 26 Oct 2025 18:14:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 18:59:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0198b983093cd25b46f232b12670849171894d68
X-Git-Newrev: 5740cfdd5c870388b7846ec0b279edb7f3d0e2f0
X-Patchwork-Hint: ignore
Message-Id: <20251026181432.4A6088760B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: bump version to 3.11.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5740cfdd5c870388b7846ec0b279edb7f3d0e2f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/OSGeo/gdal/blob/v3.11.4/NEWS.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gdal/gdal.hash | 6 +++---
 package/gdal/gdal.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gdal/gdal.hash b/package/gdal/gdal.hash
index baec7c910e..a264a44b7c 100644
--- a/package/gdal/gdal.hash
+++ b/package/gdal/gdal.hash
@@ -1,6 +1,6 @@
-# md5 from: https://download.osgeo.org/gdal/3.8.2/gdal-3.8.2.tar.gz.md5, sha256 locally computed:
-md5  178461c9c1cd4503e36559a1063bb752  gdal-3.8.2.tar.xz
-sha256  dc2921ee1cf7a5c0498e94d15fb9ab9c9689c296363a1d021fc3293dd242b4db  gdal-3.8.2.tar.xz
+# md5 from: https://download.osgeo.org/gdal/3.11.4/gdal-3.11.4.tar.xz.md5, sha256 locally computed:
+md5  5d60c5213d22a636913dbe4b3164281f  gdal-3.11.4.tar.xz
+sha256  6401eba2bb63f5ef7a08d2157f240194f06d508d096898a705637aeea9d3bbe8  gdal-3.11.4.tar.xz
 
 # Hashes of license files:
 sha256  1dae3468e81d00da56e2936f74d33b8b3ad09d726437f19ce209a5dabea41f77  LICENSE.TXT
diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 77ffb514c2..4217f178b5 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDAL_VERSION = 3.8.2
+GDAL_VERSION = 3.11.4
 GDAL_SITE = https://download.osgeo.org/gdal/$(GDAL_VERSION)
 GDAL_SOURCE = gdal-$(GDAL_VERSION).tar.xz
 GDAL_LICENSE = Apache-2.0, ISC, MIT, many others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
