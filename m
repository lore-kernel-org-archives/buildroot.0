Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05523C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 22:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D38E813CC;
	Mon, 12 Dec 2022 22:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D38E813CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RhDRYWNw7-w6; Mon, 12 Dec 2022 22:05:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5F0A813EF;
	Mon, 12 Dec 2022 22:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5F0A813EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CBDC01BF362
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 22:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A786C60C05
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 22:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A786C60C05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_ktAPySueqI for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 22:05:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 608E360E2A
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 608E360E2A
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 22:05:09 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout02.t-online.de (Postfix) with SMTP id 5CC691F4F7
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 23:05:06 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd76.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4qv0-2AWUPR0; Mon, 12 Dec 2022 23:05:02 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:57310)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4qv0-0006IB-1i
 for buildroot@buildroot.org; Mon, 12 Dec 2022 23:05:02 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 23:05:02 +0100
Message-Id: <20221212220502.2940022-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670882702-EDFF0A26-2A0FF754/0/0 CLEAN NORMAL
X-TOI-MSGID: e90a25f6-6704-4b8f-8b2a-4d4a0381228a
Subject: [Buildroot] [PATCH 1/1] package/libglfw: bump version to 3.3.8
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

Changelog: https://www.glfw.org/changelog.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libglfw/libglfw.hash | 2 +-
 package/libglfw/libglfw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libglfw/libglfw.hash b/package/libglfw/libglfw.hash
index 5bffc55d26..9d38946f3c 100644
--- a/package/libglfw/libglfw.hash
+++ b/package/libglfw/libglfw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ed07b90e334dcd39903e6288d90fa1ae0cf2d2119fec516cf743a0a404527c02  libglfw-3.3.6.tar.gz
+sha256  f30f42e05f11e5fc62483e513b0488d5bceeab7d9c5da0ffe2252ad81816c713  libglfw-3.3.8.tar.gz
 sha256  149704059b5d0bf551637e50042dd4de9c2cae921021f6636298911e3a5f9462  LICENSE.md
diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
index 0a3986f662..eee8e7b298 100644
--- a/package/libglfw/libglfw.mk
+++ b/package/libglfw/libglfw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGLFW_VERSION = 3.3.6
+LIBGLFW_VERSION = 3.3.8
 LIBGLFW_SITE = $(call github,glfw,glfw,$(LIBGLFW_VERSION))
 LIBGLFW_INSTALL_STAGING = YES
 LIBGLFW_LICENSE = Zlib
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
