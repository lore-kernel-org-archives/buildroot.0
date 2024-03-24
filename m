Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADAFC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A075406AF;
	Sun, 24 Mar 2024 15:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDnxWDVgCdXM; Sun, 24 Mar 2024 15:11:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0918D4064E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0918D4064E;
	Sun, 24 Mar 2024 15:11:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DD211BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85E2F60709
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mtus0oB6UUP9 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88D14606EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88D14606EA
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74EAD83B61; Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:59:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49384a0a01ad8b73ea1dc10043c3605d035933f8
X-Git-Newrev: c1c096f91da5bfc45f1842b6dd12f1f0e016dbc4
X-Patchwork-Hint: ignore
Message-Id: <20240324151125.74EAD83B61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/msmtp: bump version to 1.8.25
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c1c096f91da5bfc45f1842b6dd12f1f0e016dbc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes - https://marlam.de/msmtp/news/msmtp-1-8-25/

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/msmtp/msmtp.hash | 4 ++--
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index c5fe9d9176..ba4ef02746 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.24.tar.xz.sig
+# https://marlam.de/msmtp/releases/msmtp-1.8.25.tar.xz.sig
 # with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
-sha256  bd6644b1aaab17d61b86647993e3efad860b23c54283b00ddc579c1f5110aa59  msmtp-1.8.24.tar.xz
+sha256  2dfe1dbbb397d26fe0b0b6b2e9cd2efdf9d72dd42d18e70d7f363ada2652d738  msmtp-1.8.25.tar.xz
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 93c923a123..b964970bfa 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.24
+MSMTP_VERSION = 1.8.25
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
