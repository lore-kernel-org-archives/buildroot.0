Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97BCC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 17:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A694D60BE3;
	Sat, 30 Dec 2023 17:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A694D60BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UArd4JIrh6RU; Sat, 30 Dec 2023 17:56:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7A2860A87;
	Sat, 30 Dec 2023 17:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7A2860A87
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B27EF1BF86B
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99C0F60A7D
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99C0F60A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKOht7u3LG2Z for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CCA660A5A
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CCA660A5A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 871AB839AF; Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 18:53:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15515ed0cd7efe586dd488a91d66ca6133de9f86
X-Git-Newrev: 00e5f52f2f3caf8f125bae400be026e7c7747c83
X-Patchwork-Hint: ignore
Message-Id: <20231230175629.871AB839AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cracklib: bump to version 2.9.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=00e5f52f2f3caf8f125bae400be026e7c7747c83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/cracklib/cracklib/blob/v2.9.11/src/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cracklib/cracklib.hash | 4 ++--
 package/cracklib/cracklib.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/cracklib/cracklib.hash b/package/cracklib/cracklib.hash
index ff527d517a..a97818cbdd 100644
--- a/package/cracklib/cracklib.hash
+++ b/package/cracklib/cracklib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1f9d34385ea3aa7cd7c07fa388dc25810aea9d3c33e260c713a3a5873d70e386  cracklib-2.9.8.tar.bz2
-sha256  ec25ac4a474588c58d901715512d8902b276542b27b8dd197e9c2ad373739ec4  cracklib-words-2.9.8.bz2
+sha256  2c83a91dd21d035eab98bded764eb4579b73fd837b683e1a447b11ef604ee130  cracklib-2.9.11.tar.xz
+sha256  b3d1e0e0ae9bc7ffed65c0042d7c68bdb903368aa6b918f94572453c6ea874dc  cracklib-words-2.9.11.xz
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index bb7c18d5be..c1834b4730 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRACKLIB_VERSION = 2.9.8
-CRACKLIB_SOURCE = cracklib-$(CRACKLIB_VERSION).tar.bz2
+CRACKLIB_VERSION = 2.9.11
+CRACKLIB_SOURCE = cracklib-$(CRACKLIB_VERSION).tar.xz
 CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/v$(CRACKLIB_VERSION)
 CRACKLIB_LICENSE = LGPL-2.1
 CRACKLIB_LICENSE_FILES = COPYING.LIB
@@ -34,8 +34,8 @@ endif
 HOST_CRACKLIB_CONF_OPTS += --without-python --without-zlib
 
 ifeq ($(BR2_PACKAGE_CRACKLIB_FULL_DICT),y)
-CRACKLIB_EXTRA_DOWNLOADS = cracklib-words-$(CRACKLIB_VERSION).bz2
-CRACKLIB_DICT_SOURCE = $(CRACKLIB_DL_DIR)/cracklib-words-$(CRACKLIB_VERSION).bz2
+CRACKLIB_EXTRA_DOWNLOADS = cracklib-words-$(CRACKLIB_VERSION).xz
+CRACKLIB_DICT_SOURCE = $(CRACKLIB_DL_DIR)/cracklib-words-$(CRACKLIB_VERSION).xz
 else
 CRACKLIB_DICT_SOURCE = $(@D)/dicts/cracklib-small
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
