Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DA1D2E9C6
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 15:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3557A40297;
	Mon, 11 Nov 2024 15:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVW9WCrBFvfH; Mon, 11 Nov 2024 15:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DFBF402B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DFBF402B1;
	Mon, 11 Nov 2024 15:18:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C1576C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1160605CD
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARicOooqA1Jr for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 15:18:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33570600B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33570600B8
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:18:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DE4D86099; Mon, 11 Nov 2024 15:18:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 16:18:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc4a5acfde2b0285548f0524ab8bfb10169294f4
X-Git-Newrev: d7deecbce2d1f3bb9037cd6c5db9d5a655d6044d
X-Patchwork-Hint: ignore
Message-Id: <20241111151840.1DE4D86099@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uhubctl: bump to version 2.6.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d7deecbce2d1f3bb9037cd6c5db9d5a655d6044d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the release note, see:
https://github.com/mvp/uhubctl/releases/tag/v2.6.0

This commit also updates the LICENSE hash, due to a year update. See:
https://github.com/mvp/uhubctl/commit/4deae1731c337d087e554999bd3dc74199387c1f

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uhubctl/uhubctl.hash | 4 ++--
 package/uhubctl/uhubctl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uhubctl/uhubctl.hash b/package/uhubctl/uhubctl.hash
index 8a4581b84c..a7e4c1c242 100644
--- a/package/uhubctl/uhubctl.hash
+++ b/package/uhubctl/uhubctl.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  d4452252f7862f7a45dd9c62f2ea7cd3a57ab5f5ab0e54a857d4c695699bbba3  uhubctl-2.5.0.tar.gz
-sha256  5eb09049fafa91347386daf769223ba2ee6914cb26ab95b86854ad6edea49b5d  LICENSE
+sha256  56ca15ddf96d39ab0bf8ee12d3daca13cea45af01bcd5a9732ffcc01664fdfa2  uhubctl-2.6.0.tar.gz
+sha256  80b933f8dfea8230f65744d303895ac724240f79ec89cc34a21cc2beba754967  LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/uhubctl/uhubctl.mk b/package/uhubctl/uhubctl.mk
index f9815409ae..284e27a60c 100644
--- a/package/uhubctl/uhubctl.mk
+++ b/package/uhubctl/uhubctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UHUBCTL_VERSION = 2.5.0
+UHUBCTL_VERSION = 2.6.0
 UHUBCTL_SITE = $(call github,mvp,uhubctl,v$(UHUBCTL_VERSION))
 UHUBCTL_LICENSE = GPL-2.0
 UHUBCTL_LICENSE_FILES = LICENSE COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
