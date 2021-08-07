Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB20CC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:29:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CBD061052
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CBD061052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58C5A60657;
	Sat,  7 Aug 2021 17:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 48n8-dQFaawC; Sat,  7 Aug 2021 17:29:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5CBE6064A;
	Sat,  7 Aug 2021 17:29:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3171BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B52660651
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:28:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQUM9LIpeKn3 for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:28:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B52FF6064A
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:28:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F3B8A8CA43; Sat,  7 Aug 2021 17:28:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 19:27:36 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 59a02a27065f815620d938d6a160251b77cdef90
X-Git-Newrev: 5a6b4564f6a808f76b0134d83119b7e41cb9315a
X-Patchwork-Hint: ignore
Message-Id: <20210807172824.F3B8A8CA43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x]
 package/x11r7/xapp_fonttosfnt: bump version to 1.2.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=5a6b4564f6a808f76b0134d83119b7e41cb9315a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Release notes:
https://lists.x.org/archives/xorg-announce/2021-June/003093.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 447292ee00a57430a8b4869bbfc8c78f481422d9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash | 6 +++---
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
index 7faa797fde..72077bee60 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2020-October/003062.html
-sha256  07c835f1f98d7b462be8f1493d072b62418282421be18197e50579c70b0c259b  fonttosfnt-1.2.1.tar.bz2
-sha512  3d4ece61e31d4a5ed56923ecc1883e80a9308d2062d37345cb5be081bc2b004aadebf99a989601749a63e03eb641e0522d07773a57bca0b4710ed453e4f20742  fonttosfnt-1.2.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-June/003093.html
+sha256  1a1bb4ef25856dea7de3d491ae7231493225b400bee0f6a1f949017ffd203a64  fonttosfnt-1.2.2.tar.bz2
+sha512  ceac6ccb064043d46f9f16f31fb89c6cbf7f026d049f7b5325d6af97e809b4cd068e6149413bb328c0af601a98b5070e21d469888a6853f6cabecd5b46f60240  fonttosfnt-1.2.2.tar.bz2
 # Locally computed
 sha256  f83378580cb7909a98b52bf5cd6a29f4894d76318c5c5312dd3f17a3e92beef1  COPYING
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index bafc524901..9fdccbb843 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_FONTTOSFNT_VERSION = 1.2.1
+XAPP_FONTTOSFNT_VERSION = 1.2.2
 XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.bz2
 XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FONTTOSFNT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
