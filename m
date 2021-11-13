Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70696C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 362734044D;
	Mon,  6 Dec 2021 18:14:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CIGs4ZvPys0; Mon,  6 Dec 2021 18:14:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF27641C15;
	Mon,  6 Dec 2021 18:14:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16F3B1BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D33E60D66
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VCEjFeCmgwKh for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF97B60D65
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5B8EC81504; Mon,  6 Dec 2021 18:07:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 18:05:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 200f46b940965ea3eccab4b277f4990ec6ee755f
X-Git-Newrev: b35be2baf2cb3039baa047c6c00715df4aa18cc4
X-Patchwork-Hint: ignore
Message-Id: <20211206180737.5B8EC81504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinyxml2: bump to version 9.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b35be2baf2cb3039baa047c6c00715df4aa18cc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tinyxml2/tinyxml2.hash | 4 ++--
 package/tinyxml2/tinyxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tinyxml2/tinyxml2.hash b/package/tinyxml2/tinyxml2.hash
index 3c59d159b5..ff799bc2eb 100644
--- a/package/tinyxml2/tinyxml2.hash
+++ b/package/tinyxml2/tinyxml2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 6ce574fbb46751842d23089485ae73d3db12c1b6639cda7721bf3a7ee862012c  tinyxml2-8.0.0.tar.gz
-sha256 9332252e9b9e46db8285d4a3f0bf25f139bf1dca6781b956d57f2302efca6432  LICENSE.txt
+sha256  cc2f1417c308b1f6acc54f88eb70771a0bf65f76282ce5c40e54cfe52952702c  tinyxml2-9.0.0.tar.gz
+sha256  9332252e9b9e46db8285d4a3f0bf25f139bf1dca6781b956d57f2302efca6432  LICENSE.txt
diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index d760d54a2f..0a857e5732 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYXML2_VERSION = 8.0.0
+TINYXML2_VERSION = 9.0.0
 TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
 TINYXML2_LICENSE = Zlib
 TINYXML2_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
