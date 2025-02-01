Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF345C0218A
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 11:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A900C4EEC3;
	Sat,  1 Feb 2025 11:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0JfHFeVcM0n; Sat,  1 Feb 2025 11:31:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 685AB4EEEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 685AB4EEEF;
	Sat,  1 Feb 2025 11:31:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E414016E
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 11:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2D8E4EEC3
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 11:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qaw3slMoOke for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 11:31:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BC2E4B058
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BC2E4B058
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 11:31:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF9CD86751; Sat,  1 Feb 2025 11:31:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 1 Feb 2025 12:08:48 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 14a38001a38828215e238f5653838c0c0694d3f4
X-Git-Newrev: 5382f887a0fe1a1ac120e8fed3a5724cd3d89bfd
X-Patchwork-Hint: ignore
Message-Id: <20250201113105.EF9CD86751@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/apache: bump
 version to 2.4.63
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

commit: https://git.buildroot.net/buildroot/commit/?id=5382f887a0fe1a1ac120e8fed3a5724cd3d89bfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.63

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: update hash source URL in hash file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d5b3795e92727c6565901cddf0c0f17c7854df56)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index b281b4beab..da0b1f1f17 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.62.tar.bz2.{sha256,sha512}
-sha256  674188e7bf44ced82da8db522da946849e22080d73d16c93f7f4df89e25729ec  httpd-2.4.62.tar.bz2
-sha512  7db1876805d5c0f60f49bcb51f75cdf567120f2ff6349e68f084e9a86ae38265d9f1c67e7fca0082c9db136f3c408a88501ee11f26b1b68724ba240867171d77  httpd-2.4.62.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.63.tar.bz2.{sha256,sha512}
+sha256  88fc236ab99b2864b248de7d49a008ec2afd7551e64dce8b95f58f32f94c46ab  httpd-2.4.63.tar.bz2
+sha512  a804ca564dfee5907fe4ce4f36884815bace0621bc7b8c9aa7c99472a954aa19cb13733f90678ff3d58ab3c76cc0e33a27e1035dc1d8cb597a9622154c59ef48  httpd-2.4.63.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 0a0a0b3de4..14676a5aee 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.62
+APACHE_VERSION = 2.4.63
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://dlcdn.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
