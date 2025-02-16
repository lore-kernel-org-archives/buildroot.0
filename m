Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FE1C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 12:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97A1760B21;
	Sun, 16 Feb 2025 12:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cn5456-bLGrT; Sun, 16 Feb 2025 12:44:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF83F60B65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF83F60B65;
	Sun, 16 Feb 2025 12:44:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04CC3C8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E909E80D0A
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ReYEdaD_7FNv for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 12:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21D3A80C92
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21D3A80C92
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:44:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BE9A87648; Sun, 16 Feb 2025 12:44:30 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 13:31:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7f4a9a1e75fc7f97110c5d1c8a7c22c1d543537
X-Git-Newrev: 7ba7da8f7d64ffb614d0c61c0e083159f06e4f6f
X-Patchwork-Hint: ignore
Message-Id: <20250216124430.0BE9A87648@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: bump to version 1.18.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ba7da8f7d64ffb614d0c61c0e083159f06e4f6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://github.com/containers/skopeo/releases/tag/v1.18.0

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index 684232b350..e663ac1f61 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e548c044c7b644ba455f482df387ec90aceea432b9c61a0bab0ec8534970eb69  skopeo-1.17.0-go2.tar.gz
+sha256  8a711db2bba3a357bebbbaf607ec731df6ea24c2d3cd9e0fef5e8fe9cefb154b  skopeo-1.18.0-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 1a83c84dbc..8e3a302e8d 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.17.0
+SKOPEO_VERSION = 1.18.0
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
