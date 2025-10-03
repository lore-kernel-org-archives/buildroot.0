Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78C7CAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F3CB614EA;
	Fri,  3 Oct 2025 20:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8W8HURjfOBE; Fri,  3 Oct 2025 20:04:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96D2A614D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96D2A614D6;
	Fri,  3 Oct 2025 20:04:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5356C118
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50D8C40E92
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghAbhdL33_pN for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:04:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9902440E91
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9902440E91
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:04:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DB5086814; Fri,  3 Oct 2025 20:04:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Oct 2025 21:59:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 989fd5ca73e87befa536995aba7cc5ea112c2805
X-Git-Newrev: efe381e5931c9e8e58624b51c87f5993e2e9bc66
X-Patchwork-Hint: ignore
Message-Id: <20251003200406.6DB5086814@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/faketime: bump to version 0.9.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=efe381e5931c9e8e58624b51c87f5993e2e9bc66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/wolfcw/libfaketime/releases/tag/v0.9.11
https://github.com/wolfcw/libfaketime/releases/tag/v0.9.12

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/faketime/faketime.hash | 2 +-
 package/faketime/faketime.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/faketime/faketime.hash b/package/faketime/faketime.hash
index a7d8d62dba..3888c71cea 100644
--- a/package/faketime/faketime.hash
+++ b/package/faketime/faketime.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  729ad33b9c750a50d9c68e97b90499680a74afd1568d859c574c0fe56fe7947f  faketime-0.9.10.tar.gz
+sha256  4fc32218697c052adcdc5ee395581f2554ca56d086ac817ced2be0d6f1f8a9fa  faketime-0.9.12.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/faketime/faketime.mk b/package/faketime/faketime.mk
index 6fc684f852..ec1a072935 100644
--- a/package/faketime/faketime.mk
+++ b/package/faketime/faketime.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAKETIME_VERSION = 0.9.10
+FAKETIME_VERSION = 0.9.12
 FAKETIME_SITE = $(call github,wolfcw,libfaketime,v$(FAKETIME_VERSION))
 FAKETIME_LICENSE = GPL-2.0
 FAKETIME_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
