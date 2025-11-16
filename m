Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB19CCEBF92
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 16:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 474CA40BBD;
	Sun, 16 Nov 2025 16:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgvskSFud2ut; Sun, 16 Nov 2025 16:48:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AE4340B68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AE4340B68;
	Sun, 16 Nov 2025 16:48:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5E98158
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 16:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C61AB60683
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 16:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Go86d-9EToAn for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 16:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF9B560648
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF9B560648
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 16:48:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDFC5846FE; Sun, 16 Nov 2025 16:48:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Nov 2025 11:38:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d6662e5fd19351642d225e86bf4aecbc4a7b2e6
X-Git-Newrev: c49e140bfba4ee6738af7c15ee7f4d4bfc103db8
X-Patchwork-Hint: ignore
Message-Id: <20251116164822.DDFC5846FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libyang: bump to version 3.13.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=c49e140bfba4ee6738af7c15ee7f4d4bfc103db8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see:
https://github.com/CESNET/libyang/releases/tag/v3.13.6

License file changed due to copyright year change:

-Copyright (c) 2015-2024, CESNET
-Copyright (c) 2015 - 2025, CESNET

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libyang/libyang.hash | 4 ++--
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index 169dbb5485..c6bf66169d 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a2ae94ce43d8b4b084f67c05902f97cbc0ec882d38ef5ddf1d601659f64d5c66  libyang-3.12.2.tar.gz
-sha256  f4fbaa09c8b2faa6a873a38181ff860e2ff90808320f71deb369f03ddfb920da  LICENSE
+sha256  5cd5018f39c830f97d70616c003990287ce5e820ae2792763a49e2a1f63af8d6  libyang-3.13.6.tar.gz
+sha256  9fe5fa94b97504d1bc32b4221cc3d32a2bd10b2086583b980ce36a3207a88eab  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 94f9ba3b8a..6f82397eb0 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 3.12.2
+LIBYANG_VERSION = 3.13.6
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
