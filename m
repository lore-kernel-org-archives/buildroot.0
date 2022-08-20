Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91F3C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 17:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02D92410B7;
	Sat, 20 Aug 2022 17:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02D92410B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lPuvOTzWH3ft; Sat, 20 Aug 2022 17:33:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4510410D5;
	Sat, 20 Aug 2022 17:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4510410D5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4127C1BF2B7
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 17:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13D95409EA
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 17:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13D95409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yH0QamIcQ37Q for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 17:33:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E7CF409C1
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 17:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E7CF409C1
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 62A67875EA; Sat, 20 Aug 2022 17:18:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Aug 2022 19:32:16 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fd760d86b6b988363f7617689d148cccc5f2fed6
X-Git-Newrev: cfa17c44d0b63815fc3149e50a514915c638ebf3
X-Patchwork-Hint: ignore
Message-Id: <20220820171834.62A67875EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/stunnel: bump to
 version 5.65
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfa17c44d0b63815fc3149e50a514915c638ebf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update COPYING hash; copyright year update:

-_Copyright (C) 1998-2021 Michal Trojnara_
+_Copyright (C) 1998-2022 Michal Trojnara_

See full changelog https://www.stunnel.org/NEWS.html

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/stunnel/stunnel.hash | 6 +++---
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index b8cc62be13..19633b3c18 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/downloads/stunnel-5.60.tar.gz.sha256
-sha256  c45d765b1521861fea9b03b425b9dd7d48b3055128c0aec673bba5ef9b8f787d  stunnel-5.60.tar.gz
+# From https://www.stunnel.org/downloads/stunnel-5.65.tar.gz.sha256
+sha256  60c500063bd1feff2877f5726e38278c086f96c178f03f09d264a2012d6bf7fc  stunnel-5.65.tar.gz
 # Locally calculated
-sha256  28b55d0157efd5ceb63640faeebb50fda13b1f49aec0b9c1240b9a3ea9f0eb4c  COPYING.md
+sha256  f10bcd7ee7b722dce40c9c674761ddb37e7e29a76a6e413e961cd52e361c5d7a  COPYING.md
 sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index cc56eb39a8..95a1530eb8 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).60
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).65
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
