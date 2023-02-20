Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C16C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA68161143;
	Tue, 21 Feb 2023 01:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA68161143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YVa4enZ5pVhV; Tue, 21 Feb 2023 01:06:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B2DE61288;
	Tue, 21 Feb 2023 01:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B2DE61288
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7538B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67A394158F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67A394158F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CKUkiWSVVbdM for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 310924010E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 310924010E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 216337FF06; Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 18:05:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 924ca9414fa962ce767c39b277489a0bdcbfad79
X-Git-Newrev: 14ca6b5fdb6a5e0fa99b04461240772d93076b2e
X-Patchwork-Hint: ignore
Message-Id: <20230220205303.216337FF06@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcurl: bump version
 to 7.88.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=14ca6b5fdb6a5e0fa99b04461240772d93076b2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog: https://curl.se/changes.html#7_88_0

Updated license hash due to copyright year bump:
https://github.com/curl/curl/commit/2bc1d775f510196154283374284f98d3eae03544#diff-400d38e5cfee181230373a8b02d38f50271a5bf62c62410382efddb8e8b19e22

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 6 +++---
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 230ec8d704..714b02acb0 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-7.87.0.tar.xz.asc
+# https://curl.se/download/curl-7.88.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  ee5f1a1955b0ed413435ef79db28b834ea5f0fb7c8cfb1ce47175cc3bee08fff  curl-7.87.0.tar.xz
-sha256  321b1a09ebc30410f2e837c072e5521cf7095b757193af4a7dae1086e36ed31a  COPYING
+sha256  fd17432cf28714a4cf39d89e26b8ace0d8901199fe5d01d75eb0ae3bbfcc731f  curl-7.88.0.tar.xz
+sha256  b1d7feb949ea5023552029fbe0bf5db4f23c2f85e9b8e51e18536f0ecbf9c524  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 994b685d34..eb481e4782 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.87.0
+LIBCURL_VERSION = 7.88.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
