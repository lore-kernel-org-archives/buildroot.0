Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E888C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:57:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDE016108E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDE016108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2144E404A8;
	Mon, 18 Oct 2021 19:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pp2RUit5m3V4; Mon, 18 Oct 2021 19:57:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0970840482;
	Mon, 18 Oct 2021 19:57:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F15771BF97A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE34F606C9
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luBx7E_3dgZV for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:57:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4928960654
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:57:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F31C2878CE; Mon, 18 Oct 2021 19:54:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:57:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce45136df09657998e8069844e91190504fddebe
X-Git-Newrev: 2ff59a5f8efac71e383157dfc416ab803299834c
X-Patchwork-Hint: ignore
Message-Id: <20211018195414.F31C2878CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libphidget: bump to version
 2.1.9.20190409
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ff59a5f8efac71e383157dfc416ab803299834c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libphidget/libphidget.hash | 2 +-
 package/libphidget/libphidget.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libphidget/libphidget.hash b/package/libphidget/libphidget.hash
index 120d6373e1..9789f78646 100644
--- a/package/libphidget/libphidget.hash
+++ b/package/libphidget/libphidget.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  f6da13dc0db057c1a87e0a831e3f5507cd26a32f3ced40f2c0ad783fc244bcd5  libphidget_2.1.8.20170607.tar.gz
+sha256  0e789912700228808519cf5c41e19f9b761da635c6bb676b147897936b23851f  libphidget_2.1.9.20190409.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libphidget/libphidget.mk b/package/libphidget/libphidget.mk
index d84a8b911d..f7d471f99a 100644
--- a/package/libphidget/libphidget.mk
+++ b/package/libphidget/libphidget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPHIDGET_VERSION = 2.1.8.20170607
+LIBPHIDGET_VERSION = 2.1.9.20190409
 LIBPHIDGET_SOURCE = libphidget_$(LIBPHIDGET_VERSION).tar.gz
 LIBPHIDGET_SITE = https://www.phidgets.com/downloads/phidget21/libraries/linux/libphidget
 LIBPHIDGET_DEPENDENCIES = libusb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
