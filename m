Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A32C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 19:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9272581AAD;
	Sat, 12 Mar 2022 19:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KDo6fHcrE5bj; Sat, 12 Mar 2022 19:44:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C097C81975;
	Sat, 12 Mar 2022 19:44:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF9A1BF3E8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39E8581A50
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zw_Tk0_pgNew for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 19:44:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DA5A8194A
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 19:44:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A17DA83A6B; Sat, 12 Mar 2022 19:35:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 20:44:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39d6deb60b32b86d819346ebd8fc94c7e170908e
X-Git-Newrev: e5d5089789eb2a2c7881ac9b38ae547d901df997
X-Patchwork-Hint: ignore
Message-Id: <20220312193555.A17DA83A6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/duktape: bump to version 2.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5d5089789eb2a2c7881ac9b38ae547d901df997
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of license file (update in year:
https://github.com/svaarala/duktape/commit/03d4d728f8365021de6955c649e6dcd05dcca99f)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/duktape/duktape.hash | 4 ++--
 package/duktape/duktape.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/duktape/duktape.hash b/package/duktape/duktape.hash
index 4c55e39888..ef6f55aa9d 100644
--- a/package/duktape/duktape.hash
+++ b/package/duktape/duktape.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  96f4a05a6c84590e53b18c59bb776aaba80a205afbbd92b82be609ba7fe75fa7  duktape-2.6.0.tar.xz
-sha256  5b42d02dbd084fd6d7e61d93f52e02b596f25400e54e0f86d5780045e5b754c8  LICENSE.txt
+sha256  90f8d2fa8b5567c6899830ddef2c03f3c27960b11aca222fa17aa7ac613c2890  duktape-2.7.0.tar.xz
+sha256  c6b6659630ca6cb837afe982ecc79511bfca878b56296d628b02eb6f18789c29  LICENSE.txt
diff --git a/package/duktape/duktape.mk b/package/duktape/duktape.mk
index 89a6e451f5..674c5e9323 100644
--- a/package/duktape/duktape.mk
+++ b/package/duktape/duktape.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUKTAPE_VERSION = 2.6.0
+DUKTAPE_VERSION = 2.7.0
 DUKTAPE_SOURCE = duktape-$(DUKTAPE_VERSION).tar.xz
 DUKTAPE_SITE = \
 	https://github.com/svaarala/duktape/releases/download/v$(DUKTAPE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
