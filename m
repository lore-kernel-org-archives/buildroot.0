Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FBAE6FE47
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 19:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A274841A1;
	Fri,  6 Sep 2024 19:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FO7M1MmoVel4; Fri,  6 Sep 2024 19:59:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5246841CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5246841CD;
	Fri,  6 Sep 2024 19:59:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C1311BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E6E460790
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqLE29r9rX71 for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4009060727
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4009060727
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34A8086EE5; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 21:24:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74cb378aff231c4f4605d7f479b9ae1a7a4e1fb6
X-Git-Newrev: 8c8b3d0391bf4e74bf3c8c698c9210e4addbd0ca
X-Patchwork-Hint: ignore
Message-Id: <20240906195853.34A8086EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: bump to 1.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c8b3d0391bf4e74bf3c8c698c9210e4addbd0ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/rauc/rauc/releases/tag/v1.12

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 391d89a8f6..f3ab0a0be9 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  ef82ee452939c03a24fd40649afa96497f3cec965994e6c9c0d94239b640bc10  rauc-1.11.3.tar.xz
+sha256  96681e119af8b6b9bb30e856a831e5a5b3292e9a5959d26ffa274b5135bc5031  rauc-1.12.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 7239d84cc7..475aee5d89 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.11.3
+RAUC_VERSION = 1.12
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
