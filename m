Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB58CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 340A2614F0;
	Wed,  1 Oct 2025 20:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXOTSsqFB62A; Wed,  1 Oct 2025 20:02:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2C37614ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2C37614ED;
	Wed,  1 Oct 2025 20:02:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1DA972
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1293411FE
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhB9_NrLc-mC for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2D7F40682
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2D7F40682
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0C3F86441; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:03:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0062ff55c5282bfc359b25d1e9eba8de636e3752
X-Git-Newrev: 6e2b0dd9235456ea32fb9987017154b51374428a
X-Patchwork-Hint: ignore
Message-Id: <20251001200129.A0C3F86441@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cutekeyboard: fix
 CUTEKEYBOARD_VERSION
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6e2b0dd9235456ea32fb9987017154b51374428a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Make CUTEKEYBOARD_VERSION compliant with release-monitoring.org

Fixes: b28ec6f4313cc805dfb152e06408f1e7137c2ea6

(alternative to commit 14885464292df19e664d95ade46a0d13cf0d25c5)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/cutekeyboard/cutekeyboard.hash | 2 +-
 package/cutekeyboard/cutekeyboard.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
index 53b438cc1f..649fb0f8b3 100644
--- a/package/cutekeyboard/cutekeyboard.hash
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0f0af01ec99ad07607d2e58c2feee1fba37c9cb7118e8af309fa021f599aec86  cutekeyboard-v1.3.0.tar.gz
+sha256  0f0af01ec99ad07607d2e58c2feee1fba37c9cb7118e8af309fa021f599aec86  cutekeyboard-1.3.0.tar.gz
 sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 775bed0fe9..681107014f 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CUTEKEYBOARD_VERSION = v1.3.0
-CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,$(CUTEKEYBOARD_VERSION))
+CUTEKEYBOARD_VERSION = 1.3.0
+CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
 CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
 CUTEKEYBOARD_INSTALL_STAGING = YES
 CUTEKEYBOARD_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
