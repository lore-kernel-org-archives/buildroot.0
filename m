Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C08C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 22:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C18660BD8;
	Fri,  3 Nov 2023 22:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C18660BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xd2c8nKobsal; Fri,  3 Nov 2023 22:19:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DB2760BF9;
	Fri,  3 Nov 2023 22:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DB2760BF9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2AE41BF5F8
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7820404EC
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7820404EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iaUQ1aFQgROe for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 22:19:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5ADF404B2
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 22:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5ADF404B2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A155986622; Fri,  3 Nov 2023 22:19:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 3 Nov 2023 23:17:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: acb49a3aff0913187b1da6603f0b615cbc29e418
X-Git-Newrev: e6724f3a7294ddaba8a648ea162ca1f84b13307a
X-Patchwork-Hint: ignore
Message-Id: <20231103221918.A155986622@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/valgrind: bump to version 3.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6724f3a7294ddaba8a648ea162ca1f84b13307a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://valgrind.org/docs/manual/dist.news.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/valgrind/valgrind.hash | 4 ++--
 package/valgrind/valgrind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index d406babe35..d236c7b4a0 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-sha1  817d769743d278b5d07526e85115082054e9bf9c  valgrind-3.21.0.tar.bz2
+sha1  60894cbf59d480c1794674da24a8406518a8df59  valgrind-3.22.0.tar.bz2
 # locally computed
-sha256  10ce1618bb3e33fad16eb79552b0a3e1211762448a0d7fce11c8a6243b9ac971  valgrind-3.21.0.tar.bz2
+sha256  c811db5add2c5f729944caf47c4e7a65dcaabb9461e472b578765dd7bf6d2d4c  valgrind-3.22.0.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 4c4c3ce543..97a955bd3b 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.21.0
+VALGRIND_VERSION = 3.22.0
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
