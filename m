Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C24C02194
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 13:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0667981200;
	Mon,  3 Feb 2025 13:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kG3bEzdkayR7; Mon,  3 Feb 2025 13:38:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01D8981219
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01D8981219;
	Mon,  3 Feb 2025 13:38:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14A23185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 036C260703
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWA7MfN2jfSz for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 13:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C5DD6066B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C5DD6066B
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:38:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2682986935; Mon,  3 Feb 2025 13:38:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 14:35:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a9a06832baa27875647deeadfb4d234608ddb79
X-Git-Newrev: b2ae9d0acd4f3f9dae1baf31c1d1cd00fe3daf11
X-Patchwork-Hint: ignore
Message-Id: <20250203133832.2682986935@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jitterentropy-library: bump
 version to 3.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2ae9d0acd4f3f9dae1baf31c1d1cd00fe3daf11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- License hash changed due to year update.
- Updated site to new location.

Release notes:
https://github.com/smuellerDD/jitterentropy-library/releases/tag/v3.6.1
https://github.com/smuellerDD/jitterentropy-library/releases/tag/v3.6.0
https://github.com/smuellerDD/jitterentropy-library/releases/tag/v3.5.0

Changelog file:
https://github.com/smuellerDD/jitterentropy-library/blob/v3.6.1/CHANGES.md

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jitterentropy-library/jitterentropy-library.hash | 4 ++--
 package/jitterentropy-library/jitterentropy-library.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/jitterentropy-library/jitterentropy-library.hash b/package/jitterentropy-library/jitterentropy-library.hash
index c7833f1428..feb15f0fca 100644
--- a/package/jitterentropy-library/jitterentropy-library.hash
+++ b/package/jitterentropy-library/jitterentropy-library.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  802f025f766c38abf663fd5a21482b8313b6d6e2c68c36a4ffd6bc105fe975ab  jitterentropy-library-3.4.1.tar.xz
-sha256  7a89069066f6c0b8767d3256e5ec5d765b2c7f3354a5a06fc8d5bd7b8103d8a3  LICENSE
+sha256  ddd23429cb6bdabbfeafd2b6aaabfbf1959dd7288887334dfec5ff099a2e9f3e  jitterentropy-library-3.6.1.tar.xz
+sha256  adbfea86223ce2c1f410353054fbbe8d7936dd900ff0d373301c959300c2214c  LICENSE
 sha256  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  LICENSE.bsd
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  LICENSE.gplv2
diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index f405082d08..28a0f7da61 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-JITTERENTROPY_LIBRARY_VERSION = 3.4.1
+JITTERENTROPY_LIBRARY_VERSION = 3.6.1
 JITTERENTROPY_LIBRARY_SOURCE = \
 	jitterentropy-library-$(JITTERENTROPY_LIBRARY_VERSION).tar.xz
-JITTERENTROPY_LIBRARY_SITE = http://www.chronox.de/jent
+JITTERENTROPY_LIBRARY_SITE = http://www.chronox.de/jent/releases/$(JITTERENTROPY_LIBRARY_VERSION)
 JITTERENTROPY_LIBRARY_LICENSE = GPL-2.0 or BSD-3-Clause
 JITTERENTROPY_LIBRARY_LICENSE_FILES = LICENSE LICENSE.bsd LICENSE.gplv2
 JITTERENTROPY_LIBRARY_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
