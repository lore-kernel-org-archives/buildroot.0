Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353B8CF8542
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF05F40190;
	Wed,  2 Oct 2024 21:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYrbxTFnskOr; Wed,  2 Oct 2024 21:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75E9A413F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75E9A413F6;
	Wed,  2 Oct 2024 21:40:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5671BF31B
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E6B761181
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0A1zWZLU5K8 for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:40:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FA436117F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FA436117F
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:40:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BD4E84C26; Wed,  2 Oct 2024 21:40:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 23:40:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1af4eae9036b96b78c4e123559fe3efae23f4672
X-Git-Newrev: 08b0dc61ec8b7ffc27c84e1b8b2fc85235ea415f
X-Patchwork-Hint: ignore
Message-Id: <20241002214049.7BD4E84C26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strace: bump version to 6.11
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=08b0dc61ec8b7ffc27c84e1b8b2fc85235ea415f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog - https://github.com/strace/strace/releases/tag/v6.11

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index dcaf1ad5d4..e167f9d20a 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.10/strace-6.10.tar.xz.asc
-sha256  765ec71aa1de2fe37363c1e40c7b7669fc1d40c44bb5d38ba8e8cd82c4edcf07  strace-6.10.tar.xz
+# https://strace.io/files/6.11/strace-6.11.tar.xz.asc
+sha256  83262583a3529f02c3501aa8b8ac772b4cbc03dc934e98bab6e4883626e283a5  strace-6.11.tar.xz
 sha256  1988d0e1aa101d68855e8c4f940aacf2531051b82f6b608eb026c5fad1f33df1  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 34a154357f..367a44da6e 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.10
+STRACE_VERSION = 6.11
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
