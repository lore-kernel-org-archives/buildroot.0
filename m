Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E304DC54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 13:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A836541518;
	Sat, 23 Mar 2024 13:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuZ3RYo0mKYa; Sat, 23 Mar 2024 13:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7351E4151A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7351E4151A;
	Sat, 23 Mar 2024 13:49:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 556CE1BF84C
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43061606EB
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_5vu2D9soGD for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 13:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64655605CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64655605CD
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EB358285C; Sat, 23 Mar 2024 13:49:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 14:28:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c09830644466022de14a350d569e06041b394c53
X-Git-Newrev: f84b73bfa25ac388e3edd3df85ac642f063055c9
X-Patchwork-Hint: ignore
Message-Id: <20240323134947.4EB358285C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ttyd: bump version to 1.7.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=f84b73bfa25ac388e3edd3df85ac642f063055c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

change log - https://github.com/tsl0922/ttyd/releases/tag/1.7.4

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ttyd/ttyd.hash | 2 +-
 package/ttyd/ttyd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ttyd/ttyd.hash b/package/ttyd/ttyd.hash
index 85bd71ba2d..b11327c465 100644
--- a/package/ttyd/ttyd.hash
+++ b/package/ttyd/ttyd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c9cf5eece52d27c5d728000f11315d36cb400c6948d1964a34a7eae74b454099  ttyd-1.7.3.tar.gz
+sha256  300d8cef4b0b32b0ec30d7bf4d3721a5d180e22607f9467a95ab7b6d9652ca9b  ttyd-1.7.4.tar.gz
 sha256  8b7e100f8311cb428c57609164d93099bada2599f948359045d1ac876a7a625b  LICENSE
diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
index d17e21d60b..d0e144b252 100644
--- a/package/ttyd/ttyd.mk
+++ b/package/ttyd/ttyd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TTYD_VERSION = 1.7.3
+TTYD_VERSION = 1.7.4
 TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
 TTYD_LICENSE = MIT
 TTYD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
