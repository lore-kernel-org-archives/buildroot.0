Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA856C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 19:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ECF66F4A1;
	Fri, 27 May 2022 19:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_94rpjutmmX; Fri, 27 May 2022 19:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 650A36168D;
	Fri, 27 May 2022 19:12:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11F301BF296
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32C8B40179
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JA2hg9cdwLIR for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D64A409C8
 for <buildroot@buildroot.org>; Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 94D9786682; Fri, 27 May 2022 19:00:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 21:07:20 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3923a5b2ec04ed451917ec9ac2cb0a4abed7014a
X-Git-Newrev: e98b067dfa5d06675f18ffd15c734eea2b31ef47
X-Patchwork-Hint: ignore
Message-Id: <20220527190009.94D9786682@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libmnl: bump to
 version 1.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=e98b067dfa5d06675f18ffd15c734eea2b31ef47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Also add sha256 hash and update hash file formatting.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 660b2379db1eec500191102dc94beda39ff0ebbe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmnl/libmnl.hash | 11 ++++++-----
 package/libmnl/libmnl.mk   |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/libmnl/libmnl.hash b/package/libmnl/libmnl.hash
index e5bb2fa603..4b592333cb 100644
--- a/package/libmnl/libmnl.hash
+++ b/package/libmnl/libmnl.hash
@@ -1,6 +1,7 @@
-# From ftp://ftp.netfilter.org/pub/libmnl/libmnl-1.0.4.tar.bz2.{md5sum,sha1sum}
-md5	be9b4b5328c6da1bda565ac5dffadb2d	libmnl-1.0.4.tar.bz2
-sha1	2db40dea612e88c62fd321906be40ab5f8f1685a	libmnl-1.0.4.tar.bz2
+# From ftp://ftp.netfilter.org/pub/libmnl/libmnl-1.0.5.tar.bz2.{md5sum,sha1sum}
+md5  0bbb70573119ec5d49435114583e7a49  libmnl-1.0.5.tar.bz2
+sha1  63c6456b77f7978a7b37e62c1b38346b2ef2d91c  libmnl-1.0.5.tar.bz2
 
-# Hash for license file:
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
+# Locally calculated
+sha256  274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525  libmnl-1.0.5.tar.bz2
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index d3b33db2e0..3361d05248 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMNL_VERSION = 1.0.4
+LIBMNL_VERSION = 1.0.5
 LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
 LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
 LIBMNL_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
