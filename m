Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8ACAD116F1
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 12:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88BDF80E76;
	Sat, 29 Nov 2025 12:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWroknh0dV0p; Sat, 29 Nov 2025 12:15:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A5D980DDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A5D980DDD;
	Sat, 29 Nov 2025 12:15:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B12E273
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 12:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5752380D8F
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 12:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hc4oLP4YcdHa for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 12:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96DBF80D27
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96DBF80D27
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 12:15:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86C0F8612E; Sat, 29 Nov 2025 12:15:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Nov 2025 13:03:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baaad289ab94e5317df900cc4a369650735e9f06
X-Git-Newrev: cb1f3579a2ad9d6e317b7a2527b1fabb4229af5d
X-Patchwork-Hint: ignore
Message-Id: <20251129121503.86C0F8612E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: bump version to 0.4.8.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb1f3579a2ad9d6e317b7a2527b1fabb4229af5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://forum.torproject.org/t/stable-release-0-4-8-21/20817

https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
"This release is a continuation of the previous one and addresses
 additional Conflux-related issues identified through further testing
 and feedback from relay operators.
 We strongly recommend upgrading as soon as possible."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index bf88d14578..ea15ddefe6 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.20.tar.gz.sha256sum
-sha256  1bb22328cdd1ee948647bfced571efa78c12fc5064187b41d5254085b5282fa7  tor-0.4.8.20.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.21.tar.gz.sha256sum
+sha256  eaf6f5b73091b95576945eade98816ddff7cd005befe4d94718a6f766b840903  tor-0.4.8.21.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 513cac9f0f..746eacd581 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.20
+TOR_VERSION = 0.4.8.21
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
