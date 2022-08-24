Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A53ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1DBC61075;
	Sun, 11 Sep 2022 09:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1DBC61075
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEMzuyJ2IfXM; Sun, 11 Sep 2022 09:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFC7A6104C;
	Sun, 11 Sep 2022 09:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFC7A6104C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16E451BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A429F81760
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A429F81760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORxT5IpfCofG for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31ECB8002E
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31ECB8002E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 200A483518; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 12:15:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbc8c461e93ce4ced0ac871ca01a2c47bda694fd
X-Git-Newrev: 86ec2b57f48f90b0d7625c4b2cb25ef7c0047a05
X-Patchwork-Hint: ignore
Message-Id: <20220911084827.200A483518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jquery-ui: bump to version 1.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=86ec2b57f48f90b0d7625c4b2cb25ef7c0047a05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The contents of the license file have changed. It adds the following
details:

 - The code examples are distributed under CC0, but we do not install
   them.

 - The files in the node_modules and external directories is provided
   under its own license, but we do not install those files.

Hence, the license remains just MIT.

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
[Thomas: add details on license file change.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jquery-ui/jquery-ui.hash |  4 ++--
 package/jquery-ui/jquery-ui.mk   | 17 ++++++-----------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/package/jquery-ui/jquery-ui.hash b/package/jquery-ui/jquery-ui.hash
index 453ecd5521..92bb5312da 100644
--- a/package/jquery-ui/jquery-ui.hash
+++ b/package/jquery-ui/jquery-ui.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  c76f349930245360f4d1dea672b9a587f8938b536a378e20eeff919f7263f99f  jquery-ui-1.10.4.zip
-sha256  ef1fdd608b20fbea7ef269ed03bd24e637717cc193971798a394bf2fa983cd53  MIT-LICENSE.txt
+sha256  5f063f91df85431e3fea84f5d5709726d6dcd15ee4bf86b0e9a4b134912a5efd  jquery-ui-1.13.1.zip
+sha256  de33fb695880d0b07615d4b86f78cd43796906959ade5fdfef70968827a0db78  LICENSE.txt
diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
index 9284e683f1..98d150bbf3 100644
--- a/package/jquery-ui/jquery-ui.mk
+++ b/package/jquery-ui/jquery-ui.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################
 
-JQUERY_UI_VERSION = 1.10.4
-# Use buildroot mirror since upstream switched the zipfile and directory
-# structure without bumping/renaming.
-# Remember to switch back to jqueryui.com when bumping!
-JQUERY_UI_SITE = http://sources.buildroot.net
+JQUERY_UI_VERSION = 1.13.1
+JQUERY_UI_SITE = https://jqueryui.com/resources/download
 JQUERY_UI_SOURCE = jquery-ui-$(JQUERY_UI_VERSION).zip
 JQUERY_UI_LICENSE = MIT
-JQUERY_UI_LICENSE_FILES = MIT-LICENSE.txt
+JQUERY_UI_LICENSE_FILES = LICENSE.txt
 
 define JQUERY_UI_EXTRACT_CMDS
 	$(UNZIP) -d $(@D) $(JQUERY_UI_DL_DIR)/$(JQUERY_UI_SOURCE)
@@ -20,15 +17,13 @@ define JQUERY_UI_EXTRACT_CMDS
 endef
 
 define JQUERY_UI_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/ui/minified/jquery-ui.min.js \
+	$(INSTALL) -m 0644 -D $(@D)/jquery-ui.min.js \
 		$(TARGET_DIR)/var/www/jquery-ui.js
-	$(INSTALL) -m 0644 -D $(@D)/ui/minified/i18n/jquery-ui-i18n.min.js \
-		$(TARGET_DIR)/var/www/jquery-ui-i18n.js
-	$(INSTALL) -m 0644 -D $(@D)/themes/base/minified/jquery-ui.min.css \
+	$(INSTALL) -m 0644 -D $(@D)/jquery-ui.min.css \
 		$(TARGET_DIR)/var/www/jquery-ui.css
 	$(INSTALL) -d $(TARGET_DIR)/var/www/images
 	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/images \
-		$(@D)/themes/base/minified/images/*.png
+		$(@D)/images/*.png
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
