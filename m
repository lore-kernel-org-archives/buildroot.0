Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBFEC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 19:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6403A81EDF;
	Tue, 22 Apr 2025 19:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LOKxl1zOH6W; Tue, 22 Apr 2025 19:04:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8727881EE0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8727881EE0;
	Tue, 22 Apr 2025 19:04:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E072819F
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1D6681EE2
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4dQnnx_k4ec for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 19:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 241A08111E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 241A08111E
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:04:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14D6D860F7; Tue, 22 Apr 2025 19:04:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 21:01:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12cd212b51f59a4d5f92e08ec94a3dd92aa0d99a
X-Git-Newrev: a6b702a3f6268cbdacfe6a86872d43d1ce375d27
X-Patchwork-Hint: ignore
Message-Id: <20250422190409.14D6D860F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ustreamer: bump version to 6.36
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6b702a3f6268cbdacfe6a86872d43d1ce375d27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog - https://github.com/pikvm/ustreamer/compare/v6.29...v6.36

Add host-pkgconf to dependencies.
https://github.com/pikvm/ustreamer/commit/4e3f873f0d8795eadbc70ff59933103b17fffbfd

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index 02b317bc33..98d2d4b60a 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  34572c241f65866caf458fa1526eaf9510656412f34d41a54bcd7aae0ba55630  ustreamer-6.29.tar.gz
+sha256  71aaba1427e8bb690500f1ae940aa64c3b3f7253750448c1331fad3b31500f3e  ustreamer-6.36.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index 107f647f47..dd1369c121 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.29
+USTREAMER_VERSION = 6.36
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
-USTREAMER_DEPENDENCIES = jpeg libevent libbsd
+USTREAMER_DEPENDENCIES = jpeg libevent libbsd host-pkgconf
 
 USTREAMER_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
