Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F043C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 08:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCABB60F21;
	Wed,  8 Dec 2021 08:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5c0vjeZalhL; Wed,  8 Dec 2021 08:41:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BA4960F18;
	Wed,  8 Dec 2021 08:41:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 192F61BF9C2
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 096B160F04
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvE-hbSuOM6W for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 08:39:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D5AA60F1B
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 08:39:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3FC2A81D55; Wed,  8 Dec 2021 08:34:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Dec 2021 09:35:45 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 7271242a5e4eb83efa7fef242d48d787816448a3
X-Git-Newrev: eadd5e3c688fae052244dd7e8c838c539d7c01c5
X-Patchwork-Hint: ignore
Message-Id: <20211208083455.3FC2A81D55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/websocketpp:
 replace BSD-3c by BSD-3-Clause
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

commit: https://git.buildroot.net/buildroot/commit/?id=eadd5e3c688fae052244dd7e8c838c539d7c01c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d361239e7b6bc043b3bce74853f5d271871f9100)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
