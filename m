Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DE7CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 21:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A907580AE4;
	Mon, 17 Nov 2025 21:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbvTqJV4cpqz; Mon, 17 Nov 2025 21:19:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D04D8813F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D04D8813F5;
	Mon, 17 Nov 2025 21:19:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3402B158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2ACBA60E79
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjeCagg74k_d for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 21:18:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52D2660AD2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52D2660AD2
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:18:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D8DD84BC9; Mon, 17 Nov 2025 21:18:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 22:17:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a45133a5f4bac0dfcb02cc649ea8c7066645fc1
X-Git-Newrev: ea9d7398caf1dc1e6ee102d1b9af5d396f2432df
X-Patchwork-Hint: ignore
Message-Id: <20251117211859.4D8DD84BC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pocketpy: bump to version 2.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea9d7398caf1dc1e6ee102d1b9af5d396f2432df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/pocketpy/pocketpy/releases/tag/v2.1.4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pocketpy/pocketpy.hash | 2 +-
 package/pocketpy/pocketpy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
index 0c96bf2a55..51d7f9c0b8 100644
--- a/package/pocketpy/pocketpy.hash
+++ b/package/pocketpy/pocketpy.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  7e2afd6eafcf72c5797492107558e4b1d6407dccd66e7da4a62b1054eddd2ce3  pocketpy-2.1.3.tar.gz
+sha256  3edf11645867fd41cf2e3cff24e3131a9ed9f6ccf8ada806dc2429f817e01f71  pocketpy-2.1.4.tar.gz
 sha256  9dab6fe9086f93847540387be578edc94b6b280004db5ed7c850ccf8f086fd66  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index d20e1e0e20..c4a9aea8d2 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCKETPY_VERSION = 2.1.3
+POCKETPY_VERSION = 2.1.4
 POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
 POCKETPY_LICENSE = MIT
 POCKETPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
