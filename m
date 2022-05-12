Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C68C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F0D280BEE;
	Thu, 12 May 2022 18:56:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTqbIE47ds5d; Thu, 12 May 2022 18:56:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E95D82F9B;
	Thu, 12 May 2022 18:56:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 142171BF578
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44D8A81BA9
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6-OEovP_O91 for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:54:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67BD481902
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:54:01 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout05.t-online.de (Postfix) with SMTP id 7F1961976E
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:53:56 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDwi-0Fvjfv0; Thu, 12 May 2022 20:53:56 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48510)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDwh-0004aZ-PV
 for buildroot@buildroot.org; Thu, 12 May 2022 20:53:55 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:53:35 +0200
Message-Id: <20220512185355.873825-5-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220512185355.873825-1-bernd.kuhls@t-online.de>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652381636-0000F5B3-1F3C5D24/0/0 CLEAN NORMAL
X-TOI-MSGID: e9f4eae3-2e03-4338-a0dd-c77338574553
Subject: [Buildroot] [PATCH 05/25] package/x11r7/xapp_editres: bump version
 to 1.0.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003139.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_editres/xapp_editres.hash | 10 ++++------
 package/x11r7/xapp_editres/xapp_editres.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_editres/xapp_editres.hash b/package/x11r7/xapp_editres/xapp_editres.hash
index 1536795515..a1a8ab9005 100644
--- a/package/x11r7/xapp_editres/xapp_editres.hash
+++ b/package/x11r7/xapp_editres/xapp_editres.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002846.html
-md5 526cf79edc0c5e379aefb21539243f96  editres-1.0.7.tar.bz2
-sha1 389e953ebb5080564a6780cb34b72bafae7f5540  editres-1.0.7.tar.bz2
-sha256 089ad34628e55a779b97e369f55fb12caefc96d684b508d9022eb9e12b775c11  editres-1.0.7.tar.bz2
-sha512 b9c928b556116bf50cf4b6ea779bdc9fedf29f5db3e6a8cc75c122578c92e1cc530a81b226ec24aad183b8ebc2de570f200314b0d9ce7883b6e3306007365b32  editres-1.0.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003139.html
+sha256  83cf5dffb1883635fd9c6a8dc48ff9e560f6c6d8ce1a0e929d5f409cba18b6f9  editres-1.0.8.tar.xz
+sha512  9a007ed7a02abf61af8b65a163a7289a1e960db390db401bdfad162aa642e0eb887ecf85be14093efd8567c68f5e01450bb8321403a203a00065fa21985c7922  editres-1.0.8.tar.xz
 # Locally computed
-sha256 b1049cf96db2c00428b8313541ab333ec4e06f102955f3edd44f88ec43b0acd6  COPYING
+sha256  b1049cf96db2c00428b8313541ab333ec4e06f102955f3edd44f88ec43b0acd6  COPYING
diff --git a/package/x11r7/xapp_editres/xapp_editres.mk b/package/x11r7/xapp_editres/xapp_editres.mk
index 108a0ec351..bd1bce732c 100644
--- a/package/x11r7/xapp_editres/xapp_editres.mk
+++ b/package/x11r7/xapp_editres/xapp_editres.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_EDITRES_VERSION = 1.0.7
-XAPP_EDITRES_SOURCE = editres-$(XAPP_EDITRES_VERSION).tar.bz2
+XAPP_EDITRES_VERSION = 1.0.8
+XAPP_EDITRES_SOURCE = editres-$(XAPP_EDITRES_VERSION).tar.xz
 XAPP_EDITRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_EDITRES_LICENSE = MIT
 XAPP_EDITRES_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
