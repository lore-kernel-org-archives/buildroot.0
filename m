Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1C7D116F3
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 19:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 208B840AFB;
	Mon,  1 Dec 2025 19:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jABpJNcOUACD; Mon,  1 Dec 2025 19:49:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51F1440F52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51F1440F52;
	Mon,  1 Dec 2025 19:49:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CD2ED3
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 19:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EAE28084B
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 19:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-GeO-ACzFsT for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 19:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 908698083D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 908698083D
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 19:49:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C74686330; Mon,  1 Dec 2025 19:49:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Dec 2025 19:22:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2c26c646e98740ce1559996cde01c420cc8dddcc
X-Git-Newrev: 7599c95be65e17c9bad813e7643d7a8eb3e4b601
X-Patchwork-Hint: ignore
Message-Id: <20251201194931.7C74686330@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ccache: bump version
 to 4.12.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7599c95be65e17c9bad813e7643d7a8eb3e4b601
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://ccache.dev/releasenotes.html#_ccache_4_12_2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ccache/ccache.hash | 2 +-
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 88377109db..cd8a95f7a2 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  42e6c4b260cffd92dfa755e26390f45f5842e8c1a5f64f2b2e68adfbe82d1542  ccache-4.12.1.tar.xz
+sha256  96ad53c76ecdb9c7a78e28a9bfdf2c95d7eece28546510fde7e16e5a13e2f7f8  ccache-4.12.2.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  fc33d985529cdb5ea484ee46d6df4de6a6bca25ebdd3f3211c9d15f1c59dc75a  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 75ef404d27..4f6a6bdece 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.12.1
+CCACHE_VERSION = 4.12.2
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
