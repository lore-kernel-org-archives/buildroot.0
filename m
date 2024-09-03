Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39EDCD3440
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DE5C60674;
	Tue,  3 Sep 2024 21:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2zY6178IZXM; Tue,  3 Sep 2024 21:32:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AC7A607A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AC7A607A7;
	Tue,  3 Sep 2024 21:32:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8993D1BF421
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74F9E40182
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6VXLyhGqJeQ for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 619E44010C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 619E44010C
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:32:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E6F386D47; Tue,  3 Sep 2024 21:32:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 23:31:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3cf1a6f80d3bb6a97b22111534dfeaa129b73d21
X-Git-Newrev: ac51d214659139ad8260b21b1e94cb631994fc62
X-Patchwork-Hint: ignore
Message-Id: <20240903213229.4E6F386D47@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/p910nd: update download URL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ac51d214659139ad8260b21b1e94cb631994fc62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Project moved to Github. Update download URL and hash.
License file got renamed, but it is still GPLv2.

Fixes:

 http://autobuild.buildroot.org/results/6e0/6e0e34c342fe712d5314de80488a2d034a2f5983/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/p910nd/p910nd.hash | 4 ++--
 package/p910nd/p910nd.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/p910nd/p910nd.hash b/package/p910nd/p910nd.hash
index 93b1389909..0f69e402d5 100644
--- a/package/p910nd/p910nd.hash
+++ b/package/p910nd/p910nd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4ac980a3ae24babae6f70f0a692625ece03a4a92c357fbb10d2e368386c3c26f  p910nd-0.97.tar.bz2
-sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
+sha256  a1bcc2dd75bad4e00a9de5098dbd970e8380f978fc09292bcfa15852af6a6964  p910nd-0.97.tar.gz
+sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  LICENSE.md
diff --git a/package/p910nd/p910nd.mk b/package/p910nd/p910nd.mk
index 163ab1bcf2..fea8aafd50 100644
--- a/package/p910nd/p910nd.mk
+++ b/package/p910nd/p910nd.mk
@@ -5,10 +5,9 @@
 ################################################################################
 
 P910ND_VERSION = 0.97
-P910ND_SITE = http://downloads.sourceforge.net/project/p910nd/p910nd/$(P910ND_VERSION)
-P910ND_SOURCE = p910nd-$(P910ND_VERSION).tar.bz2
+P910ND_SITE = $(call github,kenyapcomau,p910nd,$(P910ND_VERSION))
 P910ND_LICENSE = GPL-2.0
-P910ND_LICENSE_FILES = COPYING
+P910ND_LICENSE_FILES = LICENSE.md
 
 define P910ND_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
