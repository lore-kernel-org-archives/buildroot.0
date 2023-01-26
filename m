Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E7FC54E94
	for <buildroot@archiver.kernel.org>; Thu, 26 Jan 2023 16:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8D2460E28;
	Thu, 26 Jan 2023 16:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8D2460E28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oZJIK5TnhDqq; Thu, 26 Jan 2023 16:12:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BF9260E08;
	Thu, 26 Jan 2023 16:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BF9260E08
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E68D1BF96B
 for <buildroot@lists.busybox.net>; Thu, 26 Jan 2023 16:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1587441570
 for <buildroot@lists.busybox.net>; Thu, 26 Jan 2023 16:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1587441570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nD-tiZrAw0LX for <buildroot@lists.busybox.net>;
 Thu, 26 Jan 2023 16:11:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3A1F41926
 for <buildroot@buildroot.org>; Thu, 26 Jan 2023 16:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3A1F41926
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D086087E18; Thu, 26 Jan 2023 16:11:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 Jan 2023 17:10:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb6ad853d67d3c3a83093924ae305f35213793bc
X-Git-Newrev: 58cc22a6d095b9b589e5b001e005032589749084
X-Patchwork-Hint: ignore
Message-Id: <20230126161115.D086087E18@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/c-icap-modules: bump to version
 0.5.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=58cc22a6d095b9b589e5b001e005032589749084
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sourceforge.net/p/c-icap/news/2021/03/the-c-icap-modules-055-is-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-icap-modules/c-icap-modules.hash | 6 +++---
 package/c-icap-modules/c-icap-modules.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/c-icap-modules/c-icap-modules.hash b/package/c-icap-modules/c-icap-modules.hash
index cc7949a092..110ffd4de3 100644
--- a/package/c-icap-modules/c-icap-modules.hash
+++ b/package/c-icap-modules/c-icap-modules.hash
@@ -1,7 +1,7 @@
 # From http://sourceforge.net/projects/c-icap/files/c-icap-modules/0.5.x/
-md5  2f8c174f7a5414616f5a0a976ac4a221  c_icap_modules-0.5.4.tar.gz
-sha1  ec7bb138d7775895cd8b2e12adc41dbf48eba1b7  c_icap_modules-0.5.4.tar.gz
+md5  ca6d5d124a4668d63affcaa5ab083e57  c_icap_modules-0.5.5.tar.gz
+sha1  67be484a93fe662a7735ee06e1d34d82b54469a8  c_icap_modules-0.5.5.tar.gz
 
 # Locally calculated
-sha256  87409920c66027204e9cca5f20e137b63cd12daf6dfcd85c1fa62ab2bd1c57cc  c_icap_modules-0.5.4.tar.gz
+sha256  6a42f1fdd8c35ad38d29f7d3c10f925471977f217086352e146cf95e45f2b5b5  c_icap_modules-0.5.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/c-icap-modules/c-icap-modules.mk b/package/c-icap-modules/c-icap-modules.mk
index 2eaa141afe..e9bbbdb284 100644
--- a/package/c-icap-modules/c-icap-modules.mk
+++ b/package/c-icap-modules/c-icap-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_MODULES_VERSION = 0.5.4
+C_ICAP_MODULES_VERSION = 0.5.5
 C_ICAP_MODULES_SOURCE = c_icap_modules-$(C_ICAP_MODULES_VERSION).tar.gz
 C_ICAP_MODULES_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_MODULES_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
