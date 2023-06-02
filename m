Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67016C7EE2C
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 22:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8F1E428C1;
	Fri,  2 Jun 2023 22:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8F1E428C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HIx4wlbeNSHL; Fri,  2 Jun 2023 22:32:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0582428BA;
	Fri,  2 Jun 2023 22:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0582428BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5B31BF5DD
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 22:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67B7B428BA
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 22:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67B7B428BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jX8hC0DJw5pV for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 22:32:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6019D408F0
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 22:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6019D408F0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BF3386BFE; Fri,  2 Jun 2023 22:32:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jun 2023 00:31:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 502dcf46af1be88a4ac5973efc9f8eb95c461bf6
X-Git-Newrev: e7d40576fad6784164b668776d81547edd8fafdd
X-Patchwork-Hint: ignore
Message-Id: <20230602223200.4BF3386BFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: bump version to 8.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7d40576fad6784164b668776d81547edd8fafdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://curl.se/changes.html#8_1_2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 12d356118b..18b2dbfd86 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.1.1.tar.xz.asc
+# https://curl.se/download/curl-8.1.2.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  08a948e061929645597c1ef7194e07b308b22084ff03fa7400b465e6c05149e5  curl-8.1.1.tar.xz
+sha256  31b1118eb8bfd43cd95d9a3f146f814ff874f6ed3999b29d94f4d1e7dbac5ef6  curl-8.1.2.tar.xz
 sha256  b1d7feb949ea5023552029fbe0bf5db4f23c2f85e9b8e51e18536f0ecbf9c524  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 93e839798b..2be3415cb8 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.1.1
+LIBCURL_VERSION = 8.1.2
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
