Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9739C28B2F
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 15:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74C0B83FB1;
	Sat, 15 Mar 2025 15:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zr0t18cy1smQ; Sat, 15 Mar 2025 15:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8157183FB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8157183FB5;
	Sat, 15 Mar 2025 15:43:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0459CC8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 15:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFF29400C6
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 15:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTPDh5F0-EH6 for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 15:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3BD74010D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3BD74010D
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 15:42:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E221D87F3C; Sat, 15 Mar 2025 15:42:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 15:07:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a3412adb2aacb39db1a27d9d498b34647c8cfbdf
X-Git-Newrev: ba8a8359e988c472e16fee8db2710520f3f277fc
X-Patchwork-Hint: ignore
Message-Id: <20250315154253.E221D87F3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fmc: bump version to
 lf-6.6.52-2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba8a8359e988c472e16fee8db2710520f3f277fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- The license file was renamed from COPYING to LICENSE.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Reviewed-by: Brandon Maier <brandon.maier@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fmc/fmc.hash | 4 ++--
 package/fmc/fmc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index 961ce18ac7..8f59c94e6a 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a58514816108a16d07307f924ebceb67c7d61709e4449978763fc44ed6e1fc44  fmc-LSDK-21.08.tar.gz
-sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  COPYING
+sha256  13a5e327ef1d727946187fbd021513194981e42681c73e56933109af8a5889e7  fmc-lf-6.6.52-2.2.0.tar.gz
+sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  LICENSE
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index 4f25545ffd..c6d36f14a0 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-FMC_VERSION = LSDK-21.08
+FMC_VERSION = lf-6.6.52-2.2.0
 FMC_SITE = $(call github,nxp-qoriq,fmc,$(FMC_VERSION))
 FMC_LICENSE = MIT
-FMC_LICENSE_FILES = COPYING
+FMC_LICENSE_FILES = LICENSE
 FMC_DEPENDENCIES = libxml2 tclap fmlib
 
 FMC_MAKE_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
