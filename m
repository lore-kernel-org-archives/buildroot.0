Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AB1CAC588
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B0106069F;
	Mon,  8 Sep 2025 14:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-3LzA9RCbg3; Mon,  8 Sep 2025 14:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E3F6606F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E3F6606F7;
	Mon,  8 Sep 2025 14:18:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DED4ACA
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30EB64021C
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmB3MoBBwTZU for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 882FE40211
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 882FE40211
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77EDA818B3; Mon,  8 Sep 2025 14:16:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Aug 2025 23:51:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 369518b372c0c1748aa4456dee2f8b8bc8a3052b
X-Git-Newrev: 97e52b323c8940d6022e39451cc4e7c9500a8081
X-Patchwork-Hint: ignore
Message-Id: <20250908141626.77EDA818B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfcgi: update to 2.4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=97e52b323c8940d6022e39451cc4e7c9500a8081
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Announcement:
- https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.6

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libfcgi/libfcgi.hash | 2 +-
 package/libfcgi/libfcgi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
index 371dba8939..348b0b6867 100644
--- a/package/libfcgi/libfcgi.hash
+++ b/package/libfcgi/libfcgi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  92b0111a98d8636e06c128444a3d4d7a720bdd54e6ee4dd0c7b67775b1b0abff  libfcgi-2.4.5.tar.gz
+sha256  39af4fb21a6d695a5f0b1c4fa95776d2725f6bc6c77680943a2ab314acd505c1  libfcgi-2.4.6.tar.gz
 sha256  f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81  LICENSE
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index 2348af843b..e0ef6da55c 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFCGI_VERSION = 2.4.5
+LIBFCGI_VERSION = 2.4.6
 LIBFCGI_SITE = $(call github,FastCGI-Archives,fcgi2,$(LIBFCGI_VERSION))
 LIBFCGI_LICENSE = OML
 LIBFCGI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
