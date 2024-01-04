Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E919C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CF3B615F8;
	Thu,  4 Jan 2024 21:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CF3B615F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N8R8MLYF06RM; Thu,  4 Jan 2024 21:28:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A35E61AED;
	Thu,  4 Jan 2024 21:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A35E61AED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A4011BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CE0043825
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CE0043825
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RlzK-ubT_7d1 for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B5FC43818
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B5FC43818
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4778684093; Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jan 2024 22:20:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4536589d3989e7324e61fd3f4ccbad547564f1c
X-Git-Newrev: d8e19f8de8dc7f0e1389515044d584aa4733682a
X-Patchwork-Hint: ignore
Message-Id: <20240104212747.4778684093@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinyxml2: bump to version 10.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8e19f8de8dc7f0e1389515044d584aa4733682a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/leethomason/tinyxml2/releases/tag/10.0.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tinyxml2/tinyxml2.hash | 2 +-
 package/tinyxml2/tinyxml2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinyxml2/tinyxml2.hash b/package/tinyxml2/tinyxml2.hash
index ff799bc2eb..a131b8624d 100644
--- a/package/tinyxml2/tinyxml2.hash
+++ b/package/tinyxml2/tinyxml2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cc2f1417c308b1f6acc54f88eb70771a0bf65f76282ce5c40e54cfe52952702c  tinyxml2-9.0.0.tar.gz
+sha256  3bdf15128ba16686e69bce256cc468e76c7b94ff2c7f391cc5ec09e40bff3839  tinyxml2-10.0.0.tar.gz
 sha256  9332252e9b9e46db8285d4a3f0bf25f139bf1dca6781b956d57f2302efca6432  LICENSE.txt
diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index 0a857e5732..5ea9e13a4b 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYXML2_VERSION = 9.0.0
+TINYXML2_VERSION = 10.0.0
 TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
 TINYXML2_LICENSE = Zlib
 TINYXML2_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
