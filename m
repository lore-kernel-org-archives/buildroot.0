Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26CDC54E67
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 20:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF24C605AD;
	Sat, 23 Mar 2024 20:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNg6w_kYCjRx; Sat, 23 Mar 2024 20:35:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B40046073E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B40046073E;
	Sat, 23 Mar 2024 20:35:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCFEA1BF37E
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9F6840544
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UFa8HlRfdrzj for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 20:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AA2D40109
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AA2D40109
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:35:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E41C48399D; Sat, 23 Mar 2024 20:35:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 21:33:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f95069814bd68cfc10ccf2dbc41efa6f1e127495
X-Git-Newrev: 59674e5f8de5cb0a13344d04083287eb7fd3cf22
X-Patchwork-Hint: ignore
Message-Id: <20240323203539.E41C48399D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cctz: bump to version 2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=59674e5f8de5cb0a13344d04083287eb7fd3cf22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/google/cctz/releases/tag/v2.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/cctz/cctz.hash | 2 +-
 package/cctz/cctz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cctz/cctz.hash b/package/cctz/cctz.hash
index b3a8320790..ac78cd611b 100644
--- a/package/cctz/cctz.hash
+++ b/package/cctz/cctz.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  8615b20d4e33e02a271c3b93a3b208e3d7d5d66880f5f6208b03426e448f32db  cctz-2.3.tar.gz
+sha256  e1a00957d472044808a24a26f1ba020f36dc26949a69c214562d96b74093adb3  cctz-2.4.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE.txt
diff --git a/package/cctz/cctz.mk b/package/cctz/cctz.mk
index bcc80bad47..7f5d960a42 100644
--- a/package/cctz/cctz.mk
+++ b/package/cctz/cctz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCTZ_VERSION = 2.3
+CCTZ_VERSION = 2.4
 CCTZ_SITE = $(call github,google,cctz,v$(CCTZ_VERSION))
 CCTZ_LICENSE = Apache-2.0
 CCTZ_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
