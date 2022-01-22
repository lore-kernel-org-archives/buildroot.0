Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77640C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 18:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3802860B75;
	Sat, 22 Jan 2022 18:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rYa-v-Tz-gvL; Sat, 22 Jan 2022 18:02:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89C5460B9C;
	Sat, 22 Jan 2022 18:02:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD6F91BF5DB
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60FFF60B6C
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U0B7VM2keJyn for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 18:00:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF7FD60B75
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 18:00:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 86F4A82A06; Sat, 22 Jan 2022 17:53:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 18:45:58 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f4c8d4a1598054c6c7e6d8e2922476baa0d9ab2e
X-Git-Newrev: 68d5ac331850439f2b17f586c12c156a47277138
X-Patchwork-Hint: ignore
Message-Id: <20220122175343.86F4A82A06@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/x11r7/xapp_xinput-calibrator: switch _SITE to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=68d5ac331850439f2b17f586c12c156a47277138
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 83b587a642075e605a4796a4ef924f90131bddae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
index 974b83df2c..be86608b85 100644
--- a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
+++ b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
@@ -6,7 +6,7 @@
 
 XAPP_XINPUT_CALIBRATOR_VERSION = 0.7.5
 XAPP_XINPUT_CALIBRATOR_SOURCE = xinput_calibrator-$(XAPP_XINPUT_CALIBRATOR_VERSION).tar.gz
-XAPP_XINPUT_CALIBRATOR_SITE = http://github.com/downloads/tias/xinput_calibrator
+XAPP_XINPUT_CALIBRATOR_SITE = https://github.com/downloads/tias/xinput_calibrator
 XAPP_XINPUT_CALIBRATOR_LICENSE = MIT
 XAPP_XINPUT_CALIBRATOR_LICENSE_FILES = COPYING
 XAPP_XINPUT_CALIBRATOR_DEPENDENCIES = xlib_libX11 xlib_libXi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
