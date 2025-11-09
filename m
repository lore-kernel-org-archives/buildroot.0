Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D03CD1297
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 21:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA9BC8092E;
	Sun,  9 Nov 2025 21:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9T7V7r2Ruvv8; Sun,  9 Nov 2025 21:44:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF7848068C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF7848068C;
	Sun,  9 Nov 2025 21:44:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 295352CD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 103BE40400
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YoDInefldy-P for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 21:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E30F2403F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E30F2403F8
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:44:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D28B48426F; Sun,  9 Nov 2025 21:44:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Nov 2025 21:56:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ba7a1363f7dd6f9a277e199e096b02b8118a886
X-Git-Newrev: 81048015e8b4cb575712a868e32ee09e67f78ea5
X-Patchwork-Hint: ignore
Message-Id: <20251109214426.D28B48426F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cracklib: bump to version 2.10.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=81048015e8b4cb575712a868e32ee09e67f78ea5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/cracklib/cracklib/blob/v2.10.3/src/NEWS

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cracklib/cracklib.hash | 4 ++--
 package/cracklib/cracklib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cracklib/cracklib.hash b/package/cracklib/cracklib.hash
index a97818cbdd..b74fc5e935 100644
--- a/package/cracklib/cracklib.hash
+++ b/package/cracklib/cracklib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2c83a91dd21d035eab98bded764eb4579b73fd837b683e1a447b11ef604ee130  cracklib-2.9.11.tar.xz
-sha256  b3d1e0e0ae9bc7ffed65c0042d7c68bdb903368aa6b918f94572453c6ea874dc  cracklib-words-2.9.11.xz
+sha256  1d1b83676b5673051b9373e1ca0db81c1fa88faf9a195a3c1af984fd9c250d66  cracklib-2.10.3.tar.xz
+sha256  b3d1e0e0ae9bc7ffed65c0042d7c68bdb903368aa6b918f94572453c6ea874dc  cracklib-words-2.10.3.xz
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index 9f5f32c87a..2894908253 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRACKLIB_VERSION = 2.9.11
+CRACKLIB_VERSION = 2.10.3
 CRACKLIB_SOURCE = cracklib-$(CRACKLIB_VERSION).tar.xz
 CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/v$(CRACKLIB_VERSION)
 CRACKLIB_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
