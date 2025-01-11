Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE4DC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C6036FBCC;
	Fri, 28 Feb 2025 16:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUskVy9tEK8y; Fri, 28 Feb 2025 16:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D3676FE36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D3676FE36;
	Fri, 28 Feb 2025 16:52:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 118C868
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BBE142F79
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGLmPizrNHeY for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70D2842D08
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70D2842D08
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A5F584C4E; Fri, 28 Feb 2025 16:30:01 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:41:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5af07b8c9b2bbf23069dca9d55b0f0b05129647a
X-Git-Newrev: e8bedf18671a21bdc000a0cebf23c5cb83fe9b18
X-Patchwork-Hint: ignore
Message-Id: <20250228163001.6A5F584C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libgsasl: bump version
 to 2.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8bedf18671a21bdc000a0cebf23c5cb83fe9b18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes, since 1.10.0:
2.0.0: https://lists.gnu.org/archive/html/help-gsasl/2022-06/msg00005.html
2.0.1: https://lists.gnu.org/archive/html/help-gsasl/2022-07/msg00000.html
2.2.0: https://lists.gnu.org/archive/html/help-gsasl/2022-09/msg00001.html
2.2.1: https://lists.gnu.org/archive/html/help-gsasl/2024-01/msg00003.html

Updates:
- COPYING.LIB renamed to COPYING.LESSER.
  https://gitlab.com/gsasl/gsasl/-/commit/2492403b4e6d65a3c2d6dd7eee9ddedbc733275b
- Upstream tarball no longer includes the lib prefix.
- COPYING hash changed due to copyright URL update.
  https://gitlab.com/gsasl/gsasl/-/commit/89c4c35d7b0204dc3d6ecbccadab47d76640f0be
- README hash changed due to multiple revisions.
  https://gitlab.com/gsasl/gsasl/-/commits/master/README.md?ref_type=heads
- Tarball's sha256sum mentioned in the release notes was base64-encoded. It was decoded with the following command:
  echo "1FtWLhO9E7n8ILNy9LUyaXQM9iefg28JzhG50yvO4HU=" | base64 -d | xxd -c 32 -p

Also, this libgsasl-2.2.1 fixes a msmtp-1.8.27 build failure. When
using a Buildroot config with:

    BR2_PACKAGE_MSMTP=y
    BR2_PACKAGE_LIBGSASL=y
    BR2_PACKAGE_OPENSSL=y

mtmsp is failing to build with error.

    smtp.c: In function 'smtp_auth':
    smtp.c:1392:19: error: 'GSASL_CB_TLS_EXPORTER' undeclared (first use in this function); did you mean 'GSASL_CB_TLS_UNIQUE'?
     1392 |                 ? GSASL_CB_TLS_EXPORTER : GSASL_CB_TLS_UNIQUE,
          |                   ^~~~~~~~~~~~~~~~~~~~~

This GSASL_CB_TLS_EXPORTER was introduced in gsasl v2.1.0. This bump
fixes this build failure.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/commit/e9007bc74ed571234bb938c1fdc4cc99d6571bfc
https://autobuild.buildroot.org/results/835fec8275d4ff6eed298b892807dd295436d99d

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
[Julien:
  - add other release notes since previous version
  - add comment about msmtp build failure fix
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgsasl/libgsasl.hash | 14 +++++++-------
 package/libgsasl/libgsasl.mk   |  5 +++--
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/libgsasl/libgsasl.hash b/package/libgsasl/libgsasl.hash
index 75e5a317fa..81907f8875 100644
--- a/package/libgsasl/libgsasl.hash
+++ b/package/libgsasl/libgsasl.hash
@@ -1,11 +1,11 @@
-# From https://lists.gnu.org/archive/html/help-gsasl/2021-01/msg00007.html
-sha1  a16ff428bbf28fcfa681c7edd2cd2bb087bcc4e7  libgsasl-1.10.0.tar.gz
-sha224  20b37757fccb6a0f8b4c6fcb28f51a3b4b8a4b1fdb4736da07707a0b  libgsasl-1.10.0.tar.gz
+# From https://lists.gnu.org/archive/html/help-gsasl/2024-01/msg00003.html
+sha1  c238b3af05af3804808cbf734f049a06840d787c  gsasl-2.2.1.tar.gz
+sha256  d45b562e13bd13b9fc20b372f4b53269740cf6279f836f09ce11b9d32bcee075  gsasl-2.2.1.tar.gz
 
 # Locally calculated after checking pgp signature
-sha256  f1b553384dedbd87478449775546a358d6f5140c15cccc8fb574136fdc77329f  libgsasl-1.10.0.tar.gz
+sha256  d45b562e13bd13b9fc20b372f4b53269740cf6279f836f09ce11b9d32bcee075  gsasl-2.2.1.tar.gz
 
 # Hash for license files:
-sha256  26e99818ca6ce79d8b2c461fabc72dc6e03483e6b0fd9692dcb07ab1b09bbac7  README
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  8908e3d66e17102a3b921e1f7f80be5dc9c905ad15561579d46a7074387e311b  README
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index b1981dea3b..b8570058a4 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-LIBGSASL_VERSION = 1.10.0
+LIBGSASL_VERSION = 2.2.1
+LIBGSASL_SOURCE = gsasl-$(LIBGSASL_VERSION).tar.gz
 LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
 LIBGSASL_LICENSE = LGPL-2.1+ (library), GPL-3.0+ (programs)
-LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
+LIBGSASL_LICENSE_FILES = README COPYING.LESSER COPYING
 LIBGSASL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
