Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE83D116EA
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 17:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CC5560750;
	Sat, 29 Nov 2025 17:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTkpIiYWMkyp; Sat, 29 Nov 2025 17:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99B5F60754
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99B5F60754;
	Sat, 29 Nov 2025 17:30:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC116273
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD04760754
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OA1QowErkiq7 for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 17:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 865AE60750
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 865AE60750
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:30:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 824AA81477; Sat, 29 Nov 2025 17:30:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Nov 2025 18:19:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 86b0fb67ea9a98d032e1e16ef49e6d280fe604e5
X-Git-Newrev: 6d397ffed96853fab2985dde4a8126a23af7e22c
X-Patchwork-Hint: ignore
Message-Id: <20251129173008.824AA81477@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/acsccid: bump to
 version 1.1.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d397ffed96853fab2985dde4a8126a23af7e22c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://sourceforge.net/p/acsccid/news/2025/11/acsccid-1113-released/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/acsccid/acsccid.hash | 8 ++++----
 package/acsccid/acsccid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/acsccid/acsccid.hash b/package/acsccid/acsccid.hash
index 25f894c577..eabce7d71e 100644
--- a/package/acsccid/acsccid.hash
+++ b/package/acsccid/acsccid.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.12/
-sha1  6d9aa64b195e1b4d72a9b032f8ee70ad0798802d  acsccid-1.1.12.tar.bz2
-md5  34bf40daedd3428c07f9937d4ec43129  acsccid-1.1.12.tar.bz2
+# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.13/
+md5  80a017891884863feccf2221a656d6b8  acsccid-1.1.13.tar.bz2
+sha1  35be7ee00b331fd7b4f9b718d39e4f43a1fca5c1  acsccid-1.1.13.tar.bz2
 # Locally computed
-sha256  28f6075a5494a568ce2fd8666c489f6f4a51599b44fbc9390e1ddb48d3ccc5bd  acsccid-1.1.12.tar.bz2
+sha256  8b19aba103ec03c448b9d1b562c8322f8d2ff37cf21d4cb8b0cf522c5f385c9f  acsccid-1.1.13.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
index 3be1379552..9c5e0b13dc 100644
--- a/package/acsccid/acsccid.mk
+++ b/package/acsccid/acsccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACSCCID_VERSION = 1.1.12
+ACSCCID_VERSION = 1.1.13
 ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
 ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
 ACSCCID_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
