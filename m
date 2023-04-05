Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA3AC76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D84AD6141D;
	Wed,  5 Apr 2023 20:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D84AD6141D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_8VIP5KYDqU; Wed,  5 Apr 2023 20:36:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DDB76143B;
	Wed,  5 Apr 2023 20:36:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DDB76143B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1469E1BF364
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 708B76142E
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 708B76142E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KwoQ9-MmgHk9 for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:35:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A7D360F40
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A7D360F40
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05E5883942; Wed,  5 Apr 2023 20:35:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 5 Apr 2023 22:19:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7eaa9af7ba87f2eac1ec9d2f7116b4ecf4f78be
X-Git-Newrev: f89f3787a05d123a33f1a000c802fe42c96a487f
X-Patchwork-Hint: ignore
Message-Id: <20230405203540.05E5883942@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avrdude: bump to version 7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f89f3787a05d123a33f1a000c802fe42c96a487f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to cmake-package (autotools removed)

https://github.com/avrdudes/avrdude/blob/v7.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avrdude/avrdude.hash |  2 +-
 package/avrdude/avrdude.mk   | 13 +++++--------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index d53d4dd60d..5910a568db 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bbe2cf09163b3561ea28e9d48c2a588838f7adcd7858e34ced9c886feacb5be6  avrdude-6.4.tar.gz
+sha256  016a5c95746fadc169cfb3009f6aa306ccdea2ff279fdb6fddcbe7526d84e5eb  avrdude-7.1.tar.gz
 sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  COPYING
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index accd92c1d5..8ebe33b372 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -4,22 +4,19 @@
 #
 ################################################################################
 
-AVRDUDE_VERSION = 6.4
+AVRDUDE_VERSION = 7.1
 AVRDUDE_SITE = $(call github,avrdudes,avrdude,v$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = COPYING
 
-# Sources coming from git, without generated configure and Makefile.in
-# files.
-AVRDUDE_AUTORECONF = YES
-AVRDUDE_CONF_OPTS = --enable-linuxgpio
+AVRDUDE_CONF_OPTS = -DHAVE_LINUXGPIO=ON
 AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 	host-flex host-bison
 
 ifeq ($(BR2_PACKAGE_AVRDUDE_SPI),y)
-AVRDUDE_CONF_OPTS += --enable-linuxspi
+AVRDUDE_CONF_OPTS += -DHAVE_LINUXSPI=ON
 else
-AVRDUDE_CONF_OPTS += --disable-linuxspi
+AVRDUDE_CONF_OPTS += -DHAVE_LINUXSPI=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
@@ -40,4 +37,4 @@ endef
 
 AVRDUDE_POST_INSTALL_TARGET_HOOKS += AVRDUDE_REMOVE_BACKUP_FILE
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
