Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E0DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:37:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7592E60F9C
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7592E60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 356AD415DB;
	Sat, 18 Sep 2021 20:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIE0mjlMTrLr; Sat, 18 Sep 2021 20:37:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85860415D3;
	Sat, 18 Sep 2021 20:37:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 054421BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E923A60622
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:37:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fyGdlXCju3Oh for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43AA3605A5
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:37:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4D67E8B6ED; Sat, 18 Sep 2021 20:35:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 22:37:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d174b00c50fa7f94d7fa466c6af2f3d1c6d3e776
X-Git-Newrev: c88183cd794a683934bde687381a29406cfdebf2
X-Patchwork-Hint: ignore
Message-Id: <20210918203528.4D67E8B6ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxkbcommon: change
 homepage/download url to https
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c88183cd794a683934bde687381a29406cfdebf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change homepage url to https (and remove trailing slash)
- change download url to https

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libxkbcommon/Config.in       | 2 +-
 package/libxkbcommon/libxkbcommon.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxkbcommon/Config.in b/package/libxkbcommon/Config.in
index 4da12897f2..4e73a24abb 100644
--- a/package/libxkbcommon/Config.in
+++ b/package/libxkbcommon/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LIBXKBCOMMON
 	  processes a reduced subset of keymaps as defined by the XKB
 	  specification.
 
-	  http://xkbcommon.org/
+	  https://xkbcommon.org
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 790083614f..ee2bc1ee99 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXKBCOMMON_VERSION = 1.3.1
-LIBXKBCOMMON_SITE = http://xkbcommon.org/download
+LIBXKBCOMMON_SITE = https://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
 LIBXKBCOMMON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
