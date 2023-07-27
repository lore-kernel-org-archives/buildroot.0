Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24218C001E0
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD54841895;
	Thu, 27 Jul 2023 10:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD54841895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UOzKyVemdywv; Thu, 27 Jul 2023 10:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1465418F3;
	Thu, 27 Jul 2023 10:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1465418F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6797B1BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F37960E7C
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F37960E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LmMHc5dcIjXf for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:49:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81DFA60E73
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81DFA60E73
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7200483713; Thu, 27 Jul 2023 10:49:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 12:48:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 318f08715c3db7fbe76635384cbd4c615e1fe6b4
X-Git-Newrev: 242777898aeb057b1d40026bee5c555c2ab75785
X-Patchwork-Hint: ignore
Message-Id: <20230727104924.7200483713@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sofia-sip: bump version to 1.13.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=242777898aeb057b1d40026bee5c555c2ab75785
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sofia-sip/sofia-sip.hash | 2 +-
 package/sofia-sip/sofia-sip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index f7293bd262..6799a941be 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  846b3d5eef57702e8d18967070b538030252116af1500f4baa78ad068c5fdd64  sofia-sip-1.13.15.tar.gz
+sha256  125a9653bea1fc1cb275e4aec3445aa2deadf1fe3f1adffae9559d2349bfab36  sofia-sip-1.13.16.tar.gz
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
 sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 9734da5020..c829625cb0 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.15
+SOFIA_SIP_VERSION = 1.13.16
 SOFIA_SIP_SITE = $(call github,freeswitch,sofia-sip,v$(SOFIA_SIP_VERSION))
 SOFIA_SIP_INSTALL_STAGING = YES
 # Fetched from github, no pre-generated configure script provided
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
