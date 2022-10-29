Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43974C433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 16:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB98740884;
	Sat, 29 Oct 2022 16:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB98740884
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQJ27fmennMy; Sat, 29 Oct 2022 16:10:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE06A404EB;
	Sat, 29 Oct 2022 16:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE06A404EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11AF71BF5DC
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5386408A2
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5386408A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yqw_Mon3ZY2e for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 16:09:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AA05408AA
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 16:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AA05408AA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84DA28704C; Sat, 29 Oct 2022 16:09:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 18:08:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cbfed0dbf43c5e04e3cc543b642e3c996bfed97
X-Git-Newrev: 6905bbc143346aab01f747586af1ce83bc9fd2f1
X-Patchwork-Hint: ignore
Message-Id: <20221029160920.84DA28704C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dahdi-tools: bump to version 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6905bbc143346aab01f747586af1ce83bc9fd2f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/asterisk/dahdi-tools/compare/v3.1.0...v3.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dahdi-tools/dahdi-tools.hash | 6 ++----
 package/dahdi-tools/dahdi-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/dahdi-tools/dahdi-tools.hash b/package/dahdi-tools/dahdi-tools.hash
index 72fa995c84..c119ff4ee1 100644
--- a/package/dahdi-tools/dahdi-tools.hash
+++ b/package/dahdi-tools/dahdi-tools.hash
@@ -1,7 +1,5 @@
-# sha1 from http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases
-# sha256 locally computed
-sha1  fff6c8fdc72a66f81768e4f50bf55156f7cebbc4  dahdi-tools-3.1.0.tar.gz
-sha256  ea852ebd274ee1cc90ff5e4ac84261b0b787b1a74e8b76ad659bc9ec4f77e67e  dahdi-tools-3.1.0.tar.gz
+# From http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases/dahdi-tools-3.2.0.sha256
+sha256  2bc269887fcd42d2486572611934d713e603734cc658b3b517fc9f3bdea7262f  dahdi-tools-3.2.0.tar.gz
 
 # License files, locally computed
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  LICENSE
diff --git a/package/dahdi-tools/dahdi-tools.mk b/package/dahdi-tools/dahdi-tools.mk
index fc0c591ca8..7d4de645a2 100644
--- a/package/dahdi-tools/dahdi-tools.mk
+++ b/package/dahdi-tools/dahdi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAHDI_TOOLS_VERSION = 3.1.0
+DAHDI_TOOLS_VERSION = 3.2.0
 DAHDI_TOOLS_SITE = http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases
 
 DAHDI_TOOLS_LICENSE = GPLv2, LGPLv2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
