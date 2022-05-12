Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E47C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4BC660B35;
	Thu, 12 May 2022 19:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWYscbnt3PgW; Thu, 12 May 2022 19:52:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB7DA60B2B;
	Thu, 12 May 2022 19:52:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 211221BF9CB
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 601A980EE8
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id quFQEJjT2EbC for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEBA480C97
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F217E85C8A; Thu, 12 May 2022 19:41:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:49:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b213b6b0cf3acb8459ebb7a1ee438e9c8a33afb
X-Git-Newrev: b52b3e2578c1bda7fc96e9ec1f3efa33d6d80644
X-Patchwork-Hint: ignore
Message-Id: <20220512194100.F217E85C8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_rstart: bump version to
 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=b52b3e2578c1bda7fc96e9ec1f3efa33d6d80644
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003145.html

Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_rstart/xapp_rstart.hash | 5 +++--
 package/x11r7/xapp_rstart/xapp_rstart.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_rstart/xapp_rstart.hash b/package/x11r7/xapp_rstart/xapp_rstart.hash
index e87424cb45..70b8ab5451 100644
--- a/package/x11r7/xapp_rstart/xapp_rstart.hash
+++ b/package/x11r7/xapp_rstart/xapp_rstart.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2013-February/002168.html
-sha256  29134e9fdffc8d6ac6904c293b392ba6a493ce571fbd2015485b19a8e4d0ffeb  rstart-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003145.html
+sha256  50273196a005615c9f242f029a92b3aabc01520145f6b2c61eabf9774972b20f  rstart-1.0.6.tar.xz
+sha512  8c0840f172c9efade4557e9a28de19e76e510bd17f1e964936a957dde5ada3d9ae8b2fa0502f61da15cdfc0c69d3308599253ee03571017086a45e4e83958e8f  rstart-1.0.6.tar.xz
 # Locally computed
 sha256  7561fa083e87cd511669d8725ebe89dde6cd4f72cdea35b817262dc6ad6fbe9a  COPYING
diff --git a/package/x11r7/xapp_rstart/xapp_rstart.mk b/package/x11r7/xapp_rstart/xapp_rstart.mk
index 2bcc2923ac..eb6b712a7e 100644
--- a/package/x11r7/xapp_rstart/xapp_rstart.mk
+++ b/package/x11r7/xapp_rstart/xapp_rstart.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_RSTART_VERSION = 1.0.5
-XAPP_RSTART_SOURCE = rstart-$(XAPP_RSTART_VERSION).tar.bz2
+XAPP_RSTART_VERSION = 1.0.6
+XAPP_RSTART_SOURCE = rstart-$(XAPP_RSTART_VERSION).tar.xz
 XAPP_RSTART_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_RSTART_LICENSE = MIT
 XAPP_RSTART_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
