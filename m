Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8206CCD199
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 16:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA9381AAC;
	Fri, 17 Oct 2025 16:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2DvG2DtFYOCR; Fri, 17 Oct 2025 16:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21E5E81A95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21E5E81A95;
	Fri, 17 Oct 2025 16:33:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F85CD8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B01140BA9
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQgKQ4_fcZcT for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 16:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DCCF40B80
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DCCF40B80
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:33:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6AE6F873E2; Fri, 17 Oct 2025 16:33:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Oct 2025 18:28:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 828a63c5fc69a3acca8053ddcac12b9d12a2b0d1
X-Git-Newrev: 80ccde6308b13d248b0a31ad4037882b98b20394
X-Patchwork-Hint: ignore
Message-Id: <20251017163329.6AE6F873E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-glslang: bump version to
 16.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=80ccde6308b13d248b0a31ad4037882b98b20394
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/KhronosGroup/glslang/releases/tag/15.4.0
https://github.com/KhronosGroup/glslang/releases/tag/16.0.0

Updated license hash due to upstream commit:
https://github.com/KhronosGroup/glslang/commit/e70645c4571fb5136f2fb3f27f25daff2b83cfa6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-glslang/python-glslang.hash | 4 ++--
 package/python-glslang/python-glslang.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-glslang/python-glslang.hash b/package/python-glslang/python-glslang.hash
index 04ec5313a0..16b399e542 100644
--- a/package/python-glslang/python-glslang.hash
+++ b/package/python-glslang/python-glslang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c6c21fe1873c37e639a6a9ac72d857ab63a5be6893a589f34e09a6c757174201  python-glslang-15.3.0.tar.gz
-sha256  adb783e734e906d1f46db5df29991dbde84bdb0ceab502ac2febb44fe3c2b5f4  LICENSE.txt
+sha256  172385478520335147d3b03a1587424af0935398184095f24beab128a254ecc7  python-glslang-16.0.0.tar.gz
+sha256  17e70c676e1521ff3e4686f04a2053d93a7e28a33be8de7ec37ab0ff72feb677  LICENSE.txt
diff --git a/package/python-glslang/python-glslang.mk b/package/python-glslang/python-glslang.mk
index cda95eb8a2..48e5531600 100644
--- a/package/python-glslang/python-glslang.mk
+++ b/package/python-glslang/python-glslang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_GLSLANG_VERSION = 15.3.0
+PYTHON_GLSLANG_VERSION = 16.0.0
 PYTHON_GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(PYTHON_GLSLANG_VERSION))
 PYTHON_GLSLANG_LICENSE = BSD-3-Clause
 PYTHON_GLSLANG_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
