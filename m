Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42312C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 19:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E973D4280F;
	Fri,  7 Feb 2025 19:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C468ubUZsOce; Fri,  7 Feb 2025 19:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AEC44297D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AEC44297D;
	Fri,  7 Feb 2025 19:58:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17F981B5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EC8A4280F
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WSEtopMKZy3 for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 19:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3FC54276B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3FC54276B
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:58:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE29F87128; Fri,  7 Feb 2025 19:58:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Feb 2025 20:48:43 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 9909e1798f19d25d336688896728938a3c5586f4
X-Git-Newrev: 2fdd00da65e2042b8f56c8e30131eafe2fad3297
X-Patchwork-Hint: ignore
Message-Id: <20250207195834.DE29F87128@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/webkitgtk:
 security bump to 2.44.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fdd00da65e2042b8f56c8e30131eafe2fad3297
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Bugfix release with many security fixes, including (but not limited to)
patches for CVE-2024-40776, CVE-2024-40779, CVE-2024-40780, CVE-2024-40782,
CVE-2024-40789, and CVE-2024-4558.

Release notes:

  https://webkitgtk.org/2024/08/13/webkitgtk2.44.3-released.html
  https://www.webkitgtk.org/release/webkitgtk-2.44.4.html

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2024-0004.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 674b190cc3cda26e487312e3507ff60adceb17b3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 7da0e97e5d..49f758d6a8 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.44.2.tar.xz.sums
-sha1  e62b2c545011a2f180a914529a68950c4d34a2ee  webkitgtk-2.44.2.tar.xz
-sha256  523f42c8ff24832add17631f6eaafe8f9303afe316ef1a7e1844b952a7f7521b  webkitgtk-2.44.2.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.44.4.tar.xz.sums
+sha1  3699ff9c9b84e755a0736e72dfd6e5a13151f7d6  webkitgtk-2.44.4.tar.xz
+sha256  2ce4ec1b78413035037aba8326b31ed72696626b7bea7bace5e46ac0d8cbe796  webkitgtk-2.44.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 2faa7cce80..e482a4b187 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.44.2
+WEBKITGTK_VERSION = 2.44.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
