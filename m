Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A643BC61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 20:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F16D80F2A;
	Sun, 15 Jun 2025 20:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSAzgULs5Qxc; Sun, 15 Jun 2025 20:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A500A80EF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A500A80EF1;
	Sun, 15 Jun 2025 20:30:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8857C1A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AC30401E9
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtxaOSYfUQXn for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 20:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EEFE401EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EEFE401EA
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:30:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DFCD83A8E; Sun, 15 Jun 2025 20:30:11 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jun 2025 22:26:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2bd1593d0f144164e678d666276e0fc290c829f
X-Git-Newrev: e2c65b455aa24e3bd0d5e84edb8cc1d9f6514b17
X-Patchwork-Hint: ignore
Message-Id: <20250615203011.3DFCD83A8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openlayers: bump to version 10.5.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e2c65b455aa24e3bd0d5e84edb8cc1d9f6514b17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 10.2.1, see:
https://github.com/openlayers/openlayers/blob/v10.5.0/changelog/

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openlayers/openlayers.hash | 2 +-
 package/openlayers/openlayers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index 44c1160019..50f4dbe849 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  30510a365596372cc622f68452610a2150577e8b4416934e396683ad5de013c8  v10.2.1-package.zip
+sha256  ff847580458b10c85dcb38699733368d67037f855fcb6a5fce46e6412737cf67  v10.5.0-package.zip
 sha256  6c4347b83a8c9feef18d57b18e3b6c44cf901b3c344a4a1fbd837e421555ab8e  LICENSE.md
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 1abed9c6b5..e62ea35fd4 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 10.2.1
+OPENLAYERS_VERSION = 10.5.0
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-package.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
