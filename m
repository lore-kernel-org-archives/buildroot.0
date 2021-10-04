Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529A3C433FE
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 13:38:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE7A360F58
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 13:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE7A360F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5F7040613;
	Mon,  4 Oct 2021 13:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cDRBbI9-e_nb; Mon,  4 Oct 2021 13:38:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9169404B9;
	Mon,  4 Oct 2021 13:38:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD4801BF2FE
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 13:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA3FF84BE7
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 13:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id swYZJ4zPyTaC for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 13:38:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0830984BD9
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 13:38:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A3D778DCBB; Mon,  4 Oct 2021 13:36:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 15:18:16 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 3847449598f6c649ead796d59fb30cff4a0c3cd8
X-Git-Newrev: 51f8ea3c085673e31c52159e910ce32ed544cabe
X-Patchwork-Hint: ignore
Message-Id: <20211004133607.A3D778DCBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/tinycbor: bump to
 version 0.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=51f8ea3c085673e31c52159e910ce32ed544cabe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

https://github.com/intel/tinycbor/releases/tag/v0.5.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 94da7ebeda2f7f3d661b05f1c8402b9369f904ad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-Enable-build-for-different-c-libraries.patch | 39 ----------------------
 package/tinycbor/tinycbor.hash                     |  4 +--
 package/tinycbor/tinycbor.mk                       |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/package/tinycbor/0001-Enable-build-for-different-c-libraries.patch b/package/tinycbor/0001-Enable-build-for-different-c-libraries.patch
deleted file mode 100644
index 40f9288604..0000000000
--- a/package/tinycbor/0001-Enable-build-for-different-c-libraries.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 085ca40781f7c39febe6d14fb7e5cba342e1804b Mon Sep 17 00:00:00 2001
-From: Ricardo Crudo <ricardo.crudo@gmail.com>
-Date: Sat, 30 May 2020 22:03:01 +0200
-Subject: [PATCH] Enable build for different c libraries
-
-The open_memstream.c was using GLIBC macro definition to test if the
-library is building on a Linux box. This makes impossible to build
-tinycbor against other C libraries, as musl for example.
-
-Signed-off-by: Ricardo Crudo <ricardo.crudo@gmail.com>
-[Retrieved from:
-https://github.com/intel/tinycbor/commit/085ca40781f7c39febe6d14fb7e5cba342e1804b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/open_memstream.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/open_memstream.c b/src/open_memstream.c
-index 18f3de8..3365378 100644
---- a/src/open_memstream.c
-+++ b/src/open_memstream.c
-@@ -38,7 +38,7 @@
- #ifdef __APPLE__
- typedef int RetType;
- typedef int LenType;
--#elif __GLIBC__
-+#elif __linux__
- typedef ssize_t RetType;
- typedef size_t LenType;
- #else
-@@ -101,7 +101,7 @@ FILE *open_memstream(char **bufptr, size_t *lenptr)
- 
- #ifdef __APPLE__
-     return funopen(b, NULL, write_to_buffer, NULL, close_buffer);
--#elif __GLIBC__
-+#elif __linux__
-     static const cookie_io_functions_t vtable = {
-         NULL,
-         write_to_buffer,
diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index 8ff706bb67..29f0cfabf0 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	956eb4b670ea4969eaee67395b5bb6437b153960385b77357d6692e979d1b12d	tinycbor-0.5.3.tar.gz
-sha256	3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e	LICENSE
+sha256  e63668a71fd6d7abf1727dc31682ec7f107599a3c024a445c3e5da6af9328983  tinycbor-0.5.4.tar.gz
+sha256  3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e  LICENSE
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index ef095ea67d..476da67363 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYCBOR_VERSION = 0.5.3
+TINYCBOR_VERSION = 0.5.4
 TINYCBOR_SITE = $(call github,intel,tinycbor,v$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
