Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B894BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7424260EDB;
	Sun, 12 Dec 2021 22:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 898RpfSQQytb; Sun, 12 Dec 2021 22:24:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9BB960ECB;
	Sun, 12 Dec 2021 22:24:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 649481BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 961BF85A53
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fp3xkxBzlIi9 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:23:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E213983EC4
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:23:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3E66F836B8; Sun, 12 Dec 2021 22:18:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:05:50 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 64dcd86ccf818b11e39866dd81efaf561e575251
X-Git-Newrev: 36509594f4f884aaa0b6b76f26981b38cc77dbc8
X-Patchwork-Hint: ignore
Message-Id: <20211212221808.3E66F836B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/janus-gateway:
 bump to version 0.10.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=36509594f4f884aaa0b6b76f26981b38cc77dbc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

https://github.com/meetecho/janus-gateway/blob/v0.10.10/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ed6e6ebdf382cdb542012c72ad7e6bd00721dfe1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/janus-gateway/janus-gateway.hash | 2 +-
 package/janus-gateway/janus-gateway.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index ee71979b88..83afc72c98 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f8c58e5c5ed94821ce877169da90c00e4adf81920ed383a2e0ec241960d121b  janus-gateway-0.10.3.tar.gz
+sha256  21e2fc7dee4b20ed8d749a69577eccd961b0bfe5b863d42f39ddfcd2af903718  janus-gateway-0.10.10.tar.gz
 sha256  91d04c97fa1da3fcd28205873276358aafc071c5b00a9ea8c49dd06d487a9dc6  COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 98a2184d7d..40652d802a 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = 0.10.3
+JANUS_GATEWAY_VERSION = 0.10.10
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
