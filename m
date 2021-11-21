Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0342C433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97CD94046A;
	Sun, 21 Nov 2021 20:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jclZPohmugUf; Sun, 21 Nov 2021 20:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 189C140473;
	Sun, 21 Nov 2021 20:46:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 429CD1BF3EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 402AF80F39
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:46:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOXvkxVQBCnZ for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:46:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9518B80F36
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:46:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6E1118DC57; Sun, 21 Nov 2021 20:41:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 21:45:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f41dfe7877ce3d19cc848e5f4852f1acc2c0798
X-Git-Newrev: d361239e7b6bc043b3bce74853f5d271871f9100
X-Patchwork-Hint: ignore
Message-Id: <20211121204144.6E1118DC57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/websocketpp: replace BSD-3c by
 BSD-3-Clause
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

commit: https://git.buildroot.net/buildroot/commit/?id=d361239e7b6bc043b3bce74853f5d271871f9100
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/websocketpp/websocketpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/websocketpp/websocketpp.mk b/package/websocketpp/websocketpp.mk
index 59b365aa54..dd31e644a4 100644
--- a/package/websocketpp/websocketpp.mk
+++ b/package/websocketpp/websocketpp.mk
@@ -6,7 +6,7 @@
 
 WEBSOCKETPP_VERSION = 0.8.2
 WEBSOCKETPP_SITE = $(call github,zaphoyd,websocketpp,$(WEBSOCKETPP_VERSION))
-WEBSOCKETPP_LICENSE = BSD-3c, MIT, Zlib
+WEBSOCKETPP_LICENSE = BSD-3-Clause, MIT, Zlib
 WEBSOCKETPP_LICENSE_FILES = COPYING
 WEBSOCKETPP_CPE_ID_VENDOR = zaphoyd
 WEBSOCKETPP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
