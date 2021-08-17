Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873B0C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:17:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26BC361029
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26BC361029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E93FF4038C;
	Tue, 17 Aug 2021 21:17:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7qyq3Ea2MKBQ; Tue, 17 Aug 2021 21:17:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1080340485;
	Tue, 17 Aug 2021 21:17:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D11ED1BF9B5
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0B0F60B92
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qCNdCzNZxXUY for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 21:17:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4959960B93
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 21:17:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9C4FF836F6; Tue, 17 Aug 2021 21:16:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 23:12:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdbb113cd28e9ab17fe067da50484648b84408b8
X-Git-Newrev: 2fc6db12279d43d6c5a7f196c02c5303668d510c
X-Patchwork-Hint: ignore
Message-Id: <20210817211626.9C4FF836F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/at91bootstrap3: bump 3.x series to
 3.10.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fc6db12279d43d6c5a7f196c02c5303668d510c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/at91bootstrap3/Config.in           | 4 ++--
 boot/at91bootstrap3/at91bootstrap3.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index f44597bc00..edacc00675 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -22,7 +22,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	bool "4.0.0-rc2"
 
 config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
-	bool "3.10.2"
+	bool "3.10.3"
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	bool "Custom Git repository"
@@ -55,7 +55,7 @@ endif
 config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	string
 	default "v4.0.0-rc2" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
-	default "v3.10.2" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
+	default "v3.10.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
index 8b7453bbd4..71c579de28 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  33e4ba431af93a4fc2e81c1458cd31901b9f69c583ebe4c74ca78c0846479bfd  at91bootstrap3-v3.10.2.tar.gz
+sha256  b6ae5bcaacc5a949f400182e036ae053049638444a3ba8b1dd154ec5f7898d8e  at91bootstrap3-v3.10.3.tar.gz
 sha256  b5d5f042297cad0d091f7d8734e61eb9ec7b6020898e086503fb5f8bc71fb9fc  at91bootstrap3-v4.0.0-rc2.tar.gz
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
