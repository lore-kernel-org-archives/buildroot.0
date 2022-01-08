Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742A7C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17D5760A9D;
	Sat,  8 Jan 2022 18:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MoeV1hMQCZ_9; Sat,  8 Jan 2022 18:59:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C46260A89;
	Sat,  8 Jan 2022 18:59:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A5211BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2763940266
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tb0iHw_jvtzu for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:59:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C1C140255
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:59:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 91BC281D36; Sat,  8 Jan 2022 18:52:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 19:58:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f88a08aeedfb1d0ad57ee6b7f8ff306252308d6d
X-Git-Newrev: efc07b7a1818787229ddb335ca26ff2cf03820ae
X-Patchwork-Hint: ignore
Message-Id: <20220108185255.91BC281D36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squid: bump to version 5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=efc07b7a1818787229ddb335ca26ff2cf03820ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

5.x is the latest stable version, 4.x is provided for archival purpose
only and is not intended for general use in new installations.

http://www.squid-cache.org/Versions/v5/squid-5.3-RELEASENOTES.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index b1a8feb78e..e18ed8961e 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v4/squid-4.17.tar.xz.asc
-md5  47b94b2d27516f1764c9d5dc1b9645e5  squid-4.17.tar.xz
-sha1  f6bd15fabbd67b53a831fe9f67de3279868036c1  squid-4.17.tar.xz
+# From http://www.squid-cache.org/Versions/v5/squid-5.3.tar.xz.asc
+md5  9249f30169ab6600e53b4f9b8129b3b0  squid-5.3.tar.xz
+sha1  d3a8310c725616fa7565d60f3bf8fdf5fa20b15a  squid-5.3.tar.xz
 # Locally calculated
-sha256  cb928ac08c7c86b151b1c8f827abe1a84d83181a2a86e0d512286163e1e31418  squid-4.17.tar.xz
+sha256  45178588df1311ded41ebadd632840c4d93a8d7f5f60e38e74acf2f1ae2f1715  squid-5.3.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index a30a87e20d..3847fb49dc 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQUID_VERSION = 4.17
+SQUID_VERSION = 5.3
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
-SQUID_SITE = http://www.squid-cache.org/Versions/v4
+SQUID_SITE = http://www.squid-cache.org/Versions/v5
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 SQUID_CPE_ID_VENDOR = squid-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
