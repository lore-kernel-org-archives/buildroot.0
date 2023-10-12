Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E5DCDB47E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 14:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D042F417BE;
	Thu, 12 Oct 2023 14:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D042F417BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhI6W5v1oJ6T; Thu, 12 Oct 2023 14:40:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD94240A74;
	Thu, 12 Oct 2023 14:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD94240A74
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7411BF990
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 14:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 789AA60ACE
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 14:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 789AA60ACE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6apG0KeSKV27 for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 14:39:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86A4860B4E
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 14:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A4860B4E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7194F845F7; Thu, 12 Oct 2023 14:39:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 16:34:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29b6e170b7337c47444a8ef34529eabc2c59567f
X-Git-Newrev: 0e15854fbcb12c22bda59affb658aecc002177ed
X-Patchwork-Hint: ignore
Message-Id: <20231012143924.7194F845F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squid: bump version to 6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e15854fbcb12c22bda59affb658aecc002177ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index ec60a0e9d1..a6d4c5d056 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v6/squid-6.2.tar.xz.asc
-md5  ad01b7d82b6a00ffd8cd39b97113d05a  squid-6.2.tar.xz
-sha1  29ddb4c522a36f1270e7cfa66f0dec8805fd2b57  squid-6.2.tar.xz
+# From http://www.squid-cache.org/Versions/v6/squid-6.3.tar.xz.asc
+md5  2512b5d27856e6f91a97719784506893  squid-6.3.tar.xz
+sha1  7bd74034015c6a4d345a4d277a431908bed2ec4a  squid-6.3.tar.xz
 # Locally calculated
-sha256  dd759e151e997d31786d91743d327b1b4b532f1caea66bf81100ec8ba04ec4c1  squid-6.2.tar.xz
+sha256  74a0f5586a7a5d89573d502708d5e1d66ddf0430cf4802cc7261b765653248fa  squid-6.3.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 167e9f67d8..019a202952 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 6.2
+SQUID_VERSION = 6.3
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v6
 SQUID_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
