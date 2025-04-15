Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EBEC369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB7F0607AD;
	Tue, 15 Apr 2025 20:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7phsp_Frb3P; Tue, 15 Apr 2025 20:24:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB5F160E82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB5F160E82;
	Tue, 15 Apr 2025 20:24:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C10D200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2207560BC8
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XirOLo0LSL0B for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 20:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45F916115B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45F916115B
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:24:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3437284A1B; Tue, 15 Apr 2025 20:24:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 22:22:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 638fe82e8b1c4f6204b161fec325f99cf51c1572
X-Git-Newrev: 8fdbbefa08308921fe096f38fa71e63dafc5d6ac
X-Patchwork-Hint: ignore
Message-Id: <20250415202444.3437284A1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipset: bump to version 7.23
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fdbbefa08308921fe096f38fa71e63dafc5d6ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://ipset.netfilter.org/changelog.html

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ipset/ipset.hash | 4 ++--
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index fb9b8c40d2..7be4b368c2 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,4 +1,4 @@
-# From https://ipset.netfilter.org/ipset-7.16.tar.bz2.sha512sum.txt
-sha512  e69ddee956f0922c8e08e7e5d358d6b5b24178a9f08151b20957cc3465baaba9ecd6aa938ae157f2cd286ccd7f0b7a279cfd89cec2393a00b43e4d945c275307  ipset-7.16.tar.bz2
+# From https://ipset.netfilter.org/ipset-7.23.tar.bz2.sha512sum.txt
+sha512  5a43c790abf157a55db5a9a22cb5f28a225f5c7969beda81566a2259aa82c9d852979eb805b11b4347f47c6a0c2cc4de6f14e4733bee5b562844422a45fb9dab  ipset-7.23.tar.bz2
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 9832d8fd30..ba53c1f8bd 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 7.16
+IPSET_VERSION = 7.23
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
