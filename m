Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664C8C4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 14:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2203960F51;
	Sat,  9 Dec 2023 14:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2203960F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lTnItc5L1Kcm; Sat,  9 Dec 2023 14:54:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6758860F47;
	Sat,  9 Dec 2023 14:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6758860F47
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A2A51BF2AB
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 14:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E43E483211
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 14:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E43E483211
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cQXz6pzojcN5 for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 14:54:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2461482F40
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 14:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2461482F40
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 122538749C; Sat,  9 Dec 2023 14:54:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Dec 2023 15:51:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1de7de15712eea44b4962240fbe10de5d8e44827
X-Git-Newrev: 3b6399225faa753f187425834787800cf91724b5
X-Patchwork-Hint: ignore
Message-Id: <20231209145414.122538749C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmaxminddb: bump to version 1.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b6399225faa753f187425834787800cf91724b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/maxmind/libmaxminddb/blob/1.8.0/Changes.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmaxminddb/libmaxminddb.hash | 2 +-
 package/libmaxminddb/libmaxminddb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmaxminddb/libmaxminddb.hash b/package/libmaxminddb/libmaxminddb.hash
index 7e56351c0f..23830a6afe 100644
--- a/package/libmaxminddb/libmaxminddb.hash
+++ b/package/libmaxminddb/libmaxminddb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e8414f0dedcecbc1f6c31cb65cd81650952ab0677a4d8c49cab603b3b8fb083e  libmaxminddb-1.7.1.tar.gz
+sha256  1107799f77be6aa3b9796ad0eed8ffcc334bf45f8bd18e6a984d8adf3e719c6d  libmaxminddb-1.8.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index 993b4aec9d..c741f429ed 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMAXMINDDB_VERSION = 1.7.1
+LIBMAXMINDDB_VERSION = 1.8.0
 LIBMAXMINDDB_SITE = \
 	https://github.com/maxmind/libmaxminddb/releases/download/$(LIBMAXMINDDB_VERSION)
 LIBMAXMINDDB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
