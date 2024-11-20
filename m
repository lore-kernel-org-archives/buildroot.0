Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4048ED743D8
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 21:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03B3560E62;
	Wed, 20 Nov 2024 21:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWtPoUElyV6r; Wed, 20 Nov 2024 21:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9336C6110F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9336C6110F;
	Wed, 20 Nov 2024 21:03:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1347B970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 708D560646
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-oGhjqUmz9A for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 21:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A29FF606DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A29FF606DE
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:02:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E4AE864E5; Wed, 20 Nov 2024 21:02:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Nov 2024 21:55:12 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 026ad00c9961d77ff9cc277b19ee7f8f10933c40
X-Git-Newrev: 60973b0e52f0517ff9d5bc504b5f4360dc602f70
X-Patchwork-Hint: ignore
Message-Id: <20241120210257.9E4AE864E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/libmodbus: bump
 to version 3.1.11
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60973b0e52f0517ff9d5bc504b5f4360dc602f70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Release notes:
https://github.com/stephane/libmodbus/releases/tag/v3.1.11

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dc9c4e05761fa850403c8c2c21e1bfbe719aecc2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodbus/libmodbus.hash | 2 +-
 package/libmodbus/libmodbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index a7b7e583a8..5c081d9710 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  899be4e25ab7fe5799d43f9567510d6f063d2e8f56136dd726b6fd976f9b2253  libmodbus-3.1.10.tar.gz
+sha256  15b4b2e0f68122c2da9b195de5c330489a9c97d40b4a95d2822378dc14d780e7  libmodbus-3.1.11.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 2fffa1e0e9..4902d6257f 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.1.10
+LIBMODBUS_VERSION = 3.1.11
 LIBMODBUS_SITE = https://github.com/stephane/libmodbus/releases/download/v$(LIBMODBUS_VERSION)
 LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
