Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595E6CCF9F8
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 21:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB81740584;
	Sun,  9 Nov 2025 21:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECJ6XvySTgpi; Sun,  9 Nov 2025 21:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 342E74059C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 342E74059C;
	Sun,  9 Nov 2025 21:44:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD5FD2CD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF0B86087F
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uk2V4GUqNcPX for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 21:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBFEB6087C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBFEB6087C
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:44:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB301816AF; Sun,  9 Nov 2025 21:44:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Nov 2025 21:55:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fdbc4faea912ac4dab829d0611ac089817fa14a
X-Git-Newrev: 0ba7a1363f7dd6f9a277e199e096b02b8118a886
X-Patchwork-Hint: ignore
Message-Id: <20251109214426.CB301816AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cppzmq: bump to version 4.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ba7a1363f7dd6f9a277e199e096b02b8118a886
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/zeromq/cppzmq/releases/tag/v4.11.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cppzmq/cppzmq.hash | 2 +-
 package/cppzmq/cppzmq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cppzmq/cppzmq.hash b/package/cppzmq/cppzmq.hash
index dd6e06494a..a2410daa73 100644
--- a/package/cppzmq/cppzmq.hash
+++ b/package/cppzmq/cppzmq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c81c81bba8a7644c84932225f018b5088743a22999c6d82a2b5f5cd1e6942b74  cppzmq-4.10.0.tar.gz
+sha256  0fff4ff311a7c88fdb76fceefba0e180232d56984f577db371d505e4d4c91afd  cppzmq-4.11.0.tar.gz
 sha256  7e6db90e2e805c72b3daa77849d1cb5f1f92da0e69750c8a4aa1d86d70704748  LICENSE
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index 90213ec0f6..0f52296dbd 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = 4.10.0
+CPPZMQ_VERSION = 4.11.0
 CPPZMQ_SITE = $(call github,zeromq,cppzmq,v$(CPPZMQ_VERSION))
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = host-pkgconf zeromq
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
