Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E582FCA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4BF66167B;
	Fri, 29 Aug 2025 15:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7NVZ4YpfFGW; Fri, 29 Aug 2025 15:45:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF0E561675
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF0E561675;
	Fri, 29 Aug 2025 15:45:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 191A86C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A83F61676
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ZgVOsSD75sb for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BBB261675
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BBB261675
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:45:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 418FC87DD0; Fri, 29 Aug 2025 15:45:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 17:44:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 035f496978eafd822115a176f4aeb7e281c91717
X-Git-Newrev: 2680209ad58e3e170215ddd1f57d1509b4255604
X-Patchwork-Hint: ignore
Message-Id: <20250829154530.418FC87DD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/xterm: bump version to
 401
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

commit: https://git.buildroot.net/buildroot/commit/?id=2680209ad58e3e170215ddd1f57d1509b4255604
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See the Changes here:
https://invisible-island.net/xterm/xterm.log.html

COPYING was changed, the year was bumped and some extra
license information was removed.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xterm/xterm.hash | 4 ++--
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index e0fdcfe66e..e86db1c06e 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  1cd5763d94d9370fed10d804e831a089b2ace0e7a74b6f56ef5a16a766bde7be  xterm-389.tgz
+sha256  3da2b5e64cb49b03aa13057d85e62e1f2e64f7c744719c00d338d11cd3e6ca1a  xterm-401.tgz
 # Locally calculated
-sha256  e38de4a0780954b5a7e69b5fa6c571daa8a1bfbacb4f2c5b2f07099e1a1d7c93  COPYING
+sha256  99f70364bb769635eb9de18cc286e16cb78026f3b6478276344ee8619098dff6  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index c2c97dd318..fb6de107e9 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 389
+XTERM_VERSION = 401
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
