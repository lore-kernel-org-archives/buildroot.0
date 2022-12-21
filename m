Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239FDC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 17:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC69D81F45;
	Wed, 21 Dec 2022 17:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC69D81F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JBZm4rYXgPed; Wed, 21 Dec 2022 17:42:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1920E81E71;
	Wed, 21 Dec 2022 17:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1920E81E71
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 64DF41BF844
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 17:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 417E4400A6
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 17:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 417E4400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qmLPl07IuS3y for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 17:41:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8542B40516
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 17:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8542B40516
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73ABE86C2F; Wed, 21 Dec 2022 17:41:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 18:41:15 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 10b5882e30b845ca4e9dfbf65c58454b98244e2d
X-Git-Newrev: 2dcbce7be1605ba8301661c6fe950755e5ad1517
X-Patchwork-Hint: ignore
Message-Id: <20221221174143.73ABE86C2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 package/x11r7/xserver_xorg-server: security bump version to 21.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=2dcbce7be1605ba8301661c6fe950755e5ad1517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Release notes:
https://lists.x.org/archives/xorg-announce/2022-December/003303.html

Security advisory:
https://lists.x.org/archives/xorg-announce/2022-December/003302.html

Fixes CVE-2022-46340, CVE-2022-46341, CVE-2022-46342, CVE-2022-46343,
CVE-2022-46344 and CVE-2022-4283.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b8881d4d7e4822337c222fadf4630a49eec1e9ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 7 +++----
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 4b2090fa99..654552c8b6 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003193.html
-sha256  5cc4be8ee47edb58d4a90e603a59d56b40291ad38371b0bd2471fc3cbee1c587  xorg-server-21.1.4.tar.xz
-sha512  eb5b8520d02908f72719e6ecfbf7a9bf139acb65ccae04d1db4223a8a2384cd3a94bd5afef10cce327b751b800cc2b79bfaa5ae35c95c3a217f775168082e68f  xorg-server-21.1.4.tar.xz
-
+# From https://lists.x.org/archives/xorg-announce/2022-December/003303.html
+sha256  05b0c8301cee7c5a78083df421ba3a071891553541a417b3d85adf5cf20f8720  xorg-server-21.1.5.tar.xz
+sha512  a39c6ba36f94241d330b679a9a6fe2c5fda73fc3f5a9308a7a9cfd0d58503e407291759c9e553455c07cf5a3862952ae3904334eeca29c97ff5af7cffd2e6953  xorg-server-21.1.5.tar.xz
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 8dba9f1ed0..16b7438ee6 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.4
+XSERVER_XORG_SERVER_VERSION = 21.1.5
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
