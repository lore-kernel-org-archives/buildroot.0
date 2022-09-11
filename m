Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B09C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 18:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2F1E6FC36;
	Sun, 11 Sep 2022 18:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2F1E6FC36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MzAnxTzkuoPq; Sun, 11 Sep 2022 18:25:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FF516FC2D;
	Sun, 11 Sep 2022 18:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FF516FC2D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 874721BF3EB
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E94D4251A
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E94D4251A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GuTAn5QbYAuG for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 18:25:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76F7D42515
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 18:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76F7D42515
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 64BAE836CF; Sun, 11 Sep 2022 18:25:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 20:24:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29948fec118c7ad99c8fe95cfcb3e05c49b923d2
X-Git-Newrev: 95c2493a8e52c32ce97f0a1348bfc71dcb2b28b9
X-Patchwork-Hint: ignore
Message-Id: <20220911182524.64BAE836CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rhash: bump to version 1.4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=95c2493a8e52c32ce97f0a1348bfc71dcb2b28b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/rhash/RHash/releases/tag/v1.4.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rhash/rhash.hash | 6 +++---
 package/rhash/rhash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rhash/rhash.hash b/package/rhash/rhash.hash
index e0555af3c2..355b5c275b 100644
--- a/package/rhash/rhash.hash
+++ b/package/rhash/rhash.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/rhash/files/rhash/1.4.2/
-sha1  fdb0b0c16f3ba3eba734b3adf9f2fc4c427ff987  rhash-1.4.2-src.tar.gz
+# From https://sourceforge.net/projects/rhash/files/rhash/1.4.3/
+sha1  6e698e6d5b13aeac55076d6a53dc4dab55f2114e  rhash-1.4.3-src.tar.gz
 # Locally calculated
-sha256  600d00f5f91ef04194d50903d3c79412099328c42f28ff43a0bdb777b00bec62  rhash-1.4.2-src.tar.gz
+sha256  1e40fa66966306920f043866cbe8612f4b939b033ba5e2708c3f41be257c8a3e  rhash-1.4.3-src.tar.gz
 sha256  953e55838353335148c90b5a38a4894292680b1d4c37228ffddddbf18ce54bf5  COPYING
diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 02af0aa57b..8c33de1862 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RHASH_VERSION = 1.4.2
+RHASH_VERSION = 1.4.3
 RHASH_SOURCE = rhash-$(RHASH_VERSION)-src.tar.gz
 RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
 RHASH_LICENSE = 0BSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
