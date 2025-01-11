Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F008C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E4244F3BE;
	Fri, 28 Feb 2025 16:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGpM2KszT85I; Fri, 28 Feb 2025 16:54:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC0E64433C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC0E64433C;
	Fri, 28 Feb 2025 16:54:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 135F668
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6327B42547
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45kDINT3x6m9 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 883AD42D2D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 883AD42D2D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 809B087C52; Fri, 28 Feb 2025 16:30:04 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 18:03:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 40a561d90a2c9a5cd122de6239cbbbfb7b2b365c
X-Git-Newrev: 9166c0fc903fd52c160308d1bd0273c0c7b11b73
X-Patchwork-Hint: ignore
Message-Id: <20250228163004.809B087C52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-path: bump to
 version 17.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9166c0fc903fd52c160308d1bd0273c0c7b11b73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-path/python-path.hash | 4 ++--
 package/python-path/python-path.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-path/python-path.hash b/package/python-path/python-path.hash
index 9a0d1a3681..117d225e75 100644
--- a/package/python-path/python-path.hash
+++ b/package/python-path/python-path.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/path/json
-md5  b970d0bcde985133cae6926a02e496b9  path-17.0.0.tar.gz
-sha256  e1540261d22df1416fb1b498b3b1ed5353a371a48fe197d66611bb01e7fab2d5  path-17.0.0.tar.gz
+md5  3f03cdccfa0fdd9dee34c445701d4a31  path-17.1.0.tar.gz
+sha256  d41e05ed4fa1d4f6d702df3c1e0a1a255d7b544287432456455dc7c51e5f98e9  path-17.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-path/python-path.mk b/package/python-path/python-path.mk
index 6e094aaad5..1ebaccd099 100644
--- a/package/python-path/python-path.mk
+++ b/package/python-path/python-path.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATH_VERSION = 17.0.0
+PYTHON_PATH_VERSION = 17.1.0
 PYTHON_PATH_SOURCE = path-$(PYTHON_PATH_VERSION).tar.gz
-PYTHON_PATH_SITE = https://files.pythonhosted.org/packages/ff/a3/5dac44ce60ad6543578736a5729c5c2130cdac1c3117c61aad0583c2e3c6
+PYTHON_PATH_SITE = https://files.pythonhosted.org/packages/ed/51/127cd9fa2baae5715e24839d6fb73c6fa6eca7b84a52fc7ce8195d830802
 PYTHON_PATH_SETUP_TYPE = setuptools
 PYTHON_PATH_LICENSE = MIT
 PYTHON_PATH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
