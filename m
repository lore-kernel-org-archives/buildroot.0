Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F249FA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D308606EC;
	Sun, 30 Oct 2022 11:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D308606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UcWCemR68sE2; Sun, 30 Oct 2022 11:05:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 437CC608D8;
	Sun, 30 Oct 2022 11:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 437CC608D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 305341BF95D
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CE44606ED
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CE44606ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oDWv4zO07mSg for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C40160592
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C40160592
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBED687470; Sun, 30 Oct 2022 11:04:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:53:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17f2af56cc03d12023ed9e435a133c52bd495f1f
X-Git-Newrev: 32602849a8352647c46cc5330668339000205bdf
X-Patchwork-Hint: ignore
Message-Id: <20221030110442.EBED687470@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pps-tools: bump to version 1.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=32602849a8352647c46cc5330668339000205bdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/ago/pps-tools is redirecting to
https://github.com/redlab-i/pps-tools

https://github.com/redlab-i/pps-tools/compare/e2b25049df9a4da28168b7378016f1650d0dfa6b...v1.0.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pps-tools/Config.in      | 2 +-
 package/pps-tools/pps-tools.hash | 2 +-
 package/pps-tools/pps-tools.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pps-tools/Config.in b/package/pps-tools/Config.in
index 0c4bb112a9..16caef3e0e 100644
--- a/package/pps-tools/Config.in
+++ b/package/pps-tools/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PPS_TOOLS
 	  Pulse per second tools. Provides timepps.h and other PPS
 	  utilities.
 
-	  https://github.com/ago/pps-tools/
+	  https://github.com/redlab-i/pps-tools/
diff --git a/package/pps-tools/pps-tools.hash b/package/pps-tools/pps-tools.hash
index ee3e4e3d79..b8cc2f64d5 100644
--- a/package/pps-tools/pps-tools.hash
+++ b/package/pps-tools/pps-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1168f1474235017af413afdb07288303ad7a7b12a0282f3bf9ed0e22fe0d7d2e  pps-tools-e2b25049df9a4da28168b7378016f1650d0dfa6b.tar.gz
+sha256  89163e29f1a4a0a702bbe25b900fd37d2eb86442329cefee58847e57e1964d7a  pps-tools-1.0.3.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pps-tools/pps-tools.mk b/package/pps-tools/pps-tools.mk
index 2d82cf7dad..0aa22acf4e 100644
--- a/package/pps-tools/pps-tools.mk
+++ b/package/pps-tools/pps-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PPS_TOOLS_VERSION = e2b25049df9a4da28168b7378016f1650d0dfa6b
-PPS_TOOLS_SITE = $(call github,ago,pps-tools,$(PPS_TOOLS_VERSION))
+PPS_TOOLS_VERSION = 1.0.3
+PPS_TOOLS_SITE = $(call github,redlab-i,pps-tools,v$(PPS_TOOLS_VERSION))
 PPS_TOOLS_INSTALL_STAGING = YES
 PPS_TOOLS_LICENSE = GPL-2.0+
 PPS_TOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
