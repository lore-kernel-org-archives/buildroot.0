Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2CBC4706F
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD870435EE;
	Fri, 29 Dec 2023 21:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD870435EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQUgnogRgZie; Fri, 29 Dec 2023 21:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA5C0436A7;
	Fri, 29 Dec 2023 21:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA5C0436A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2614C1BF997
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3379436A7
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3379436A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jGwXn7wLPnH1 for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07F404369C
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07F404369C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D346283915; Fri, 29 Dec 2023 21:17:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 21:56:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b628e867722a0bdfac3224e3624cc4d1b916d5b6
X-Git-Newrev: 70e3b5a800f86e08dce14cb4ac14a3d4d7679904
X-Patchwork-Hint: ignore
Message-Id: <20231229211748.D346283915@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburing: bump to version 2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=70e3b5a800f86e08dce14cb4ac14a3d4d7679904
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/axboe/liburing/blob/liburing-2.5/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/liburing/liburing.hash | 2 +-
 package/liburing/liburing.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
index eaee8fcfa1..30458c6b9f 100644
--- a/package/liburing/liburing.hash
+++ b/package/liburing/liburing.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ca260e7a5820c2d0e737ec1e9b999f10776dbe84a169a02a0eff10c8eeaf3394  liburing-2.4.tar.bz2
+sha256  319ff9096a5655362a9741c5145b45494db810e38679a1de82e2f440c17181a6  liburing-2.5.tar.bz2
 
 # Hash for license files
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index c35fb39390..2c448d6a87 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURING_VERSION = 2.4
+LIBURING_VERSION = 2.5
 LIBURING_SOURCE = liburing-$(LIBURING_VERSION).tar.bz2
 LIBURING_SITE = https://git.kernel.dk/cgit/liburing/snapshot
 LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
