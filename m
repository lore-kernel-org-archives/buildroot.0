Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB868C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 484E0401ED;
	Sun, 30 Oct 2022 11:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 484E0401ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KTM83SvuNNwp; Sun, 30 Oct 2022 11:08:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EED440045;
	Sun, 30 Oct 2022 11:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EED440045
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74F7B1BF4D8
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FE2E812EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FE2E812EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JpLurrZ7SztO for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:04:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB1A2812F2
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB1A2812F2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACB618746F; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:54:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20348d48592e49542d7f97f31697271ca5873ba7
X-Git-Newrev: 5cf6429e2b6f3e2ee292b6c7dc6c0a1c2171bb9c
X-Patchwork-Hint: ignore
Message-Id: <20221030110443.ACB618746F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmodbus: bump to version 3.1.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=5cf6429e2b6f3e2ee292b6c7dc6c0a1c2171bb9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch site to get latest release

https://github.com/stephane/libmodbus/releases/tag/v3.1.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmodbus/libmodbus.hash | 2 +-
 package/libmodbus/libmodbus.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index b676d261de..83b0c3a012 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7dfe958431d0570b271e1a5b329b76a658e89c614cf119eb5aadb725c87f8fbd  libmodbus-3.1.7.tar.gz
+sha256  b122f2bc29f749702a22c0a760a7ca2182d541f5fa26bf25e3431f907b606f3c  libmodbus-3.1.8.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 46eb860392..2f8c1735da 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.1.7
-LIBMODBUS_SITE = http://libmodbus.org/releases
+LIBMODBUS_VERSION = 3.1.8
+LIBMODBUS_SITE = https://github.com/stephane/libmodbus/releases/download/v$(LIBMODBUS_VERSION)
 LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
 LIBMODBUS_CPE_ID_VENDOR = libmodbus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
