Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32351CFB43F
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 20:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01828605CF;
	Sun,  6 Oct 2024 20:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzV2J5plfy4N; Sun,  6 Oct 2024 20:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CC86606F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CC86606F6;
	Sun,  6 Oct 2024 20:48:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 875811BF279
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 20:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7430380F7A
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 20:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gshQJERE-Oug for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 20:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA19980F5A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA19980F5A
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 20:48:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A579D85278; Sun,  6 Oct 2024 20:48:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Oct 2024 22:46:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0820bf84810901c968bad6234942b752e7d30a66
X-Git-Newrev: ae7fa9c0052c66f618f304e1101b29de843151c2
X-Patchwork-Hint: ignore
Message-Id: <20241006204809.A579D85278@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/links: bump to version 2.30
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ae7fa9c0052c66f618f304e1101b29de843151c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
http://links.twibright.com/download/ChangeLog

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/links/links.hash | 2 +-
 package/links/links.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index 36a4b90592..30b006b4a8 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  22aa96c0b38e1a6f8f7ed9d7a4167a47fc37246097759ef6059ecf8f9ead7998  links-2.29.tar.bz2
+sha256  c4631c6b5a11527cdc3cb7872fc23b7f2b25c2b021d596be410dadb40315f166  links-2.30.tar.bz2
 sha256  92deeb70791366630095d4e0714fe37d6e2bd5db0e6ef498ebb8de328f45b253  COPYING
diff --git a/package/links/links.mk b/package/links/links.mk
index 30a26b2740..7ebe3af474 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKS_VERSION = 2.29
+LINKS_VERSION = 2.30
 LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
