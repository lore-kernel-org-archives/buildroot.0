Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD100C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 460E7419F3;
	Thu,  6 Oct 2022 19:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 460E7419F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mW7hbk6X0QxZ; Thu,  6 Oct 2022 19:05:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C977419B6;
	Thu,  6 Oct 2022 19:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C977419B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 506571BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2946A610C2
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2946A610C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RSqm1WMye6yK for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:04:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B2E76107A
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B2E76107A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33D48869ED; Thu,  6 Oct 2022 19:04:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 20:53:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 164bf2158ed97f09d932ae847ca3c7c25cf0f6d2
X-Git-Newrev: 08792a60df80a1147ee78bb108f8186996bf0c77
X-Patchwork-Hint: ignore
Message-Id: <20221006190452.33D48869ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysdig: bump to version 0.29.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=08792a60df80a1147ee78bb108f8186996bf0c77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysdig/sysdig.hash | 2 +-
 package/sysdig/sysdig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
index c953421f27..cda3de5e7c 100644
--- a/package/sysdig/sysdig.hash
+++ b/package/sysdig/sysdig.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  38ea602085f706af5d07630189216fa240064122650a81456cb092579313ae8e  sysdig-0.29.2.tar.gz
+sha256  6b96797859002ab69a2bed4fdba1c7fe8064ecf8661621ae7d8fbf8599ffa636  sysdig-0.29.3.tar.gz
 sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index e9968d9fde..bafe534a16 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.29.2
+SYSDIG_VERSION = 0.29.3
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = Apache-2.0
 SYSDIG_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
