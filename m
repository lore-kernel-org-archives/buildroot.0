Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083C7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 10:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7C81408CE;
	Mon, 27 Dec 2021 10:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3jwJdRDgmN0S; Mon, 27 Dec 2021 10:19:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D43B405D0;
	Mon, 27 Dec 2021 10:19:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFAB71BF9A4
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF1DE81393
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qUmZxgr6Cj8z for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 10:18:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5986B81392
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:18:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7B29C82AF3; Mon, 27 Dec 2021 10:13:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 11:18:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab9d3bb9900be3106928734274ce67e0a5cbf7b9
X-Git-Newrev: dbce57579b942e7fec28abbfacbaa2bfaf4f9c1e
X-Patchwork-Hint: ignore
Message-Id: <20211227101312.7B29C82AF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump to version 3.37.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbce57579b942e7fec28abbfacbaa2bfaf4f9c1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index bd736fa643..94f0127d19 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bd90c3eb96bee996206b83be7065c9ce19aef38c3f4fb53073ada0d0b69bbce3  sqlite-autoconf-3360000.tar.gz
+sha256  731a4651d4d4b36fc7d21db586b2de4dd00af31fd54fb5a9a4b7f492057479f7  sqlite-autoconf-3370000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 3f716b14b8..be060c3117 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.36.0
-SQLITE_TAR_VERSION = 3360000
+SQLITE_VERSION = 3.37.0
+SQLITE_TAR_VERSION = 3370000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2021
 SQLITE_LICENSE = Public domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
