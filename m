Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A996C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF67782093;
	Tue,  2 Jul 2024 07:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cp1qpd_x1MwW; Tue,  2 Jul 2024 07:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AA0982084
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AA0982084;
	Tue,  2 Jul 2024 07:48:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA29F1BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0069F608BB
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zq6qvFPnrzDZ for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CE5F6078C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CE5F6078C
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:48:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0949E83A85; Tue,  2 Jul 2024 07:48:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 09:08:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38812e50436d9c6b54da8711f9bdfca14ff0d8d1
X-Git-Newrev: c61bc7fe7cb328efa01584faef419349d0ff2848
X-Patchwork-Hint: ignore
Message-Id: <20240702074810.0949E83A85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-itsdangerous: bump to
 version 2.2.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c61bc7fe7cb328efa01584faef419349d0ff2848
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to include format change:
https://github.com/pallets/itsdangerous/commit/9a25d989cd65c4991c2c8ac46ef55e0e8dfe49ab

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-itsdangerous/python-itsdangerous.hash | 8 ++++----
 package/python-itsdangerous/python-itsdangerous.mk   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-itsdangerous/python-itsdangerous.hash b/package/python-itsdangerous/python-itsdangerous.hash
index 071544e5bd..1cac9a5607 100644
--- a/package/python-itsdangerous/python-itsdangerous.hash
+++ b/package/python-itsdangerous/python-itsdangerous.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/itsdangerous/json
-md5  c1bc730ddf53b8374eaa823f24eb6438  itsdangerous-2.1.2.tar.gz
-sha256  5dbbc68b317e5e42f327f9021763545dc3fc3bfe22e6deb96aaf1fc38874156a  itsdangerous-2.1.2.tar.gz
+md5  a901babde35694c3577f7655010cd380  itsdangerous-2.2.0.tar.gz
+sha256  e0050c0b7da1eea53ffaf149c0cfbb5c6e2e2b69c4bef22c81fa6eb73e5f6173  itsdangerous-2.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  63af09891b6be8ad1a4252ed43af0f4efba7fc948e228367bed7f3c5ae0b09d7  LICENSE.rst
-sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
+sha256  63af09891b6be8ad1a4252ed43af0f4efba7fc948e228367bed7f3c5ae0b09d7  LICENSE.txt
+sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
diff --git a/package/python-itsdangerous/python-itsdangerous.mk b/package/python-itsdangerous/python-itsdangerous.mk
index d7a1344e0a..5fb2919c97 100644
--- a/package/python-itsdangerous/python-itsdangerous.mk
+++ b/package/python-itsdangerous/python-itsdangerous.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ITSDANGEROUS_VERSION = 2.1.2
+PYTHON_ITSDANGEROUS_VERSION = 2.2.0
 PYTHON_ITSDANGEROUS_SOURCE = itsdangerous-$(PYTHON_ITSDANGEROUS_VERSION).tar.gz
-PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/7f/a1/d3fb83e7a61fa0c0d3d08ad0a94ddbeff3731c05212617dff3a94e097f08
-PYTHON_ITSDANGEROUS_SETUP_TYPE = setuptools
+PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/9c/cb/8ac0172223afbccb63986cc25049b154ecfb5e85932587206f42317be31d
+PYTHON_ITSDANGEROUS_SETUP_TYPE = flit
 PYTHON_ITSDANGEROUS_LICENSE = BSD-3-Clause
-PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE.rst docs/license.rst
+PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE.txt docs/license.rst
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
