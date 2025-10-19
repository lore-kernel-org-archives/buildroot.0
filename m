Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C799CCD1A2
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 19:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E583C4130B;
	Sun, 19 Oct 2025 19:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyohQM7ECORo; Sun, 19 Oct 2025 19:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E47D412DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E47D412DA;
	Sun, 19 Oct 2025 19:50:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBA9F972
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8004611DD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLr-PLrii9fr for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 19:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C08D5611D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C08D5611D7
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:50:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB0CD87674; Sun, 19 Oct 2025 19:50:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 21:46:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b2728f9ae84e099b06da57d37fb91a4f0cf8091
X-Git-Newrev: 7be0c012520988903ec27848f1d6b3ea82f0f62a
X-Patchwork-Hint: ignore
Message-Id: <20251019195015.BB0CD87674@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/less: bump to version 685
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

commit: https://git.buildroot.net/buildroot/commit/?id=7be0c012520988903ec27848f1d6b3ea82f0f62a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes since 661:
https://www.greenwoodsoftware.com/less/news.668.html
https://www.greenwoodsoftware.com/less/news.678.html
https://www.greenwoodsoftware.com/less/news.679.html
https://www.greenwoodsoftware.com/less/news.685.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/less/less.hash | 4 ++--
 package/less/less.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index b97d0fac41..881849a42b 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key F153A7C833235259
-# https://www.greenwoodsoftware.com/less/less-661.sig
-sha256  2b5f0167216e3ef0ffcb0c31c374e287eb035e4e223d5dae315c2783b6e738ed  less-661.tar.gz
+# https://www.greenwoodsoftware.com/less/less-685.sig
+sha256  2701041e767e697ee420ce0825641cedc8f20b51576abe99d92c1666d332e9dc  less-685.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index 25bbbd6d88..afb6987e73 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 661
+LESS_VERSION = 685
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
