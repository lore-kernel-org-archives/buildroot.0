Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22FFCCD183
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 10:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E4478234E;
	Sun, 19 Oct 2025 10:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZfC7hOuaO_ju; Sun, 19 Oct 2025 10:49:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C301E8235A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C301E8235A;
	Sun, 19 Oct 2025 10:49:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BCB71CC
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 10:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11FED8234E
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 10:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SclGS90ROf7f for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 10:49:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42ADB82341
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42ADB82341
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 10:49:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C6CD874ED; Sun, 19 Oct 2025 10:49:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 11:05:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05f010717dc23542f9cc111892b14dca52b94283
X-Git-Newrev: 187becc56107da519c81a2f84f8d15bcf7025baa
X-Patchwork-Hint: ignore
Message-Id: <20251019104937.3C6CD874ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libunibreak: bump version to 6.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=187becc56107da519c81a2f84f8d15bcf7025baa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/adah1972/libunibreak/releases/tag/libunibreak_6_1
https://github.com/adah1972/libunibreak/releases/tag/libunibreak_6_0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libunibreak/libunibreak.hash | 2 +-
 package/libunibreak/libunibreak.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libunibreak/libunibreak.hash b/package/libunibreak/libunibreak.hash
index bb85f21cdc..8f1e7d292a 100644
--- a/package/libunibreak/libunibreak.hash
+++ b/package/libunibreak/libunibreak.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dd1a92d4c5646aa0e457ff41d89812ec5243863be6c20bbcb5ee380f3dd78377  libunibreak-5.1.tar.gz
+sha256  cc4de0099cf7ff05005ceabff4afed4c582a736abc38033e70fdac86335ce93f  libunibreak-6.1.tar.gz
 sha256  0c57e2ec42ece17791a75d2f9b2f8e0663181be008667a507f765b3ef22522db  LICENCE
diff --git a/package/libunibreak/libunibreak.mk b/package/libunibreak/libunibreak.mk
index fa52116c1f..de3ea0fefc 100644
--- a/package/libunibreak/libunibreak.mk
+++ b/package/libunibreak/libunibreak.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNIBREAK_VERSION = 5.1
+LIBUNIBREAK_VERSION = 6.1
 LIBUNIBREAK_SITE = https://github.com/adah1972/libunibreak/releases/download/libunibreak_$(subst .,_,$(LIBUNIBREAK_VERSION))
 LIBUNIBREAK_INSTALL_STAGING = YES
 LIBUNIBREAK_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
