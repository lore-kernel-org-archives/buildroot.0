Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434CEC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED914408C3;
	Tue,  2 Jan 2024 08:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED914408C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6F6YvEyfqsQ; Tue,  2 Jan 2024 08:52:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 273D74086C;
	Tue,  2 Jan 2024 08:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 273D74086C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 942F21BF977
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78F2640360
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78F2640360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R2eV9rscdfmt for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:52:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C7734020B
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C7734020B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 564B983BD4; Tue,  2 Jan 2024 08:52:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 09:48:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44af6938fb7f3e19492cdf722534e5e8a9fff0d0
X-Git-Newrev: 1d5d9279ca47e123ac91a0b7f04cbc231ef4b8a7
X-Patchwork-Hint: ignore
Message-Id: <20240102085206.564B983BD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/domoticz: bump to version 2024.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d5d9279ca47e123ac91a0b7f04cbc231ef4b8a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openzwave is not a dependency since
https://github.com/domoticz/domoticz/commit/62c95f24305f18734cf5ebb3f6517b225fddc36f

https://github.com/domoticz/domoticz/blob/2024.1/History.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/domoticz/domoticz.hash |  2 +-
 package/domoticz/domoticz.mk   | 12 +-----------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index b54d0229fc..546177332e 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  32bcf49df8c80c470352e63004a82d9601b90ccf406096099656250a4515ac28  domoticz-2023.2.tar.gz
+sha256  9effa792f856d8d9036c53b9ae500ee3bffa1488addf9d6f1fe4bf960f73f740  domoticz-2024.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 3fbff5f4d8..d0856b71af 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 2023.2
+DOMOTICZ_VERSION = 2024.1
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
@@ -53,16 +53,6 @@ else
 DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENZWAVE),y)
-DOMOTICZ_DEPENDENCIES += openzwave
-
-# Due to the dependency on mosquitto, domoticz depends on
-# !BR2_STATIC_LIBS so set USE_STATIC_OPENZWAVE to OFF otherwise
-# domoticz will not find the openzwave library as it searches by
-# default a static library.
-DOMOTICZ_CONF_OPTS += -DUSE_STATIC_OPENZWAVE=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 DOMOTICZ_DEPENDENCIES += python3
 DOMOTICZ_CONF_OPTS += -DUSE_PYTHON=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
