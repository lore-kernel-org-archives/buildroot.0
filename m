Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA0BC36002
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 22:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2FC1412E2;
	Thu, 20 Mar 2025 22:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VN8J7oAAD2qC; Thu, 20 Mar 2025 22:16:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F91541269
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F91541269;
	Thu, 20 Mar 2025 22:16:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13D6F1A4
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F27F640568
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJCUbNCAws2J for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 22:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F6740538
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6F6740538
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:16:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABDD488239; Thu, 20 Mar 2025 22:16:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 Mar 2025 22:58:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f64eeb88540afddaad45996f53a3c3d3ff23d78c
X-Git-Newrev: 4e08ab7acd8fcfc68c6a1313eefed87972b37171
X-Patchwork-Hint: ignore
Message-Id: <20250320221637.ABDD488239@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp-cors: bump to
 version 0.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e08ab7acd8fcfc68c6a1313eefed87972b37171
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to formatting changes:
https://github.com/aio-libs/aiohttp-cors/commit/c4a4ead0df64eaa266ba36660a8a841370bf07cd

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiohttp-cors/python-aiohttp-cors.hash | 6 +++---
 package/python-aiohttp-cors/python-aiohttp-cors.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-aiohttp-cors/python-aiohttp-cors.hash b/package/python-aiohttp-cors/python-aiohttp-cors.hash
index 29ae2d7909..5bcd8bdb05 100644
--- a/package/python-aiohttp-cors/python-aiohttp-cors.hash
+++ b/package/python-aiohttp-cors/python-aiohttp-cors.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp_cors/json
-md5  de3940a901b269be82c8bd9f28d53ff0  aiohttp-cors-0.7.0.tar.gz
-sha256  4d39c6d7100fd9764ed1caf8cebf0eb01bf5e3f24e2e073fda6234bc48b19f5d  aiohttp-cors-0.7.0.tar.gz
+md5  c993585a46c40cc4292c5722c7dfbaf0  aiohttp_cors-0.8.0.tar.gz
+sha256  ec70f38432c938e39d240ff38a7d789a5aa0a18087882c12d6cc141eef1144f6  aiohttp_cors-0.8.0.tar.gz
 # Locally computed sha256 checksums
-sha256  86cb2262ff825ce1c8b8fb9ea9f5174318badc3912639b9275fc25d0e305c556  LICENSE
+sha256  c20f93f9891ddab8de9a4db5415d39c1d7d782174fe218b4c38ad78a771706e2  LICENSE
diff --git a/package/python-aiohttp-cors/python-aiohttp-cors.mk b/package/python-aiohttp-cors/python-aiohttp-cors.mk
index 27443540d0..26fa43bfa2 100644
--- a/package/python-aiohttp-cors/python-aiohttp-cors.mk
+++ b/package/python-aiohttp-cors/python-aiohttp-cors.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_CORS_VERSION = 0.7.0
-PYTHON_AIOHTTP_CORS_SOURCE = aiohttp-cors-$(PYTHON_AIOHTTP_CORS_VERSION).tar.gz
-PYTHON_AIOHTTP_CORS_SITE = https://files.pythonhosted.org/packages/44/9e/6cdce7c3f346d8fd487adf68761728ad8cd5fbc296a7b07b92518350d31f
+PYTHON_AIOHTTP_CORS_VERSION = 0.8.0
+PYTHON_AIOHTTP_CORS_SOURCE = aiohttp_cors-$(PYTHON_AIOHTTP_CORS_VERSION).tar.gz
+PYTHON_AIOHTTP_CORS_SITE = https://files.pythonhosted.org/packages/1d/a8/3edbba1d565f7888c52e04ac6188e19b812a9fc39d81dea413f3abf81bfa
 PYTHON_AIOHTTP_CORS_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_CORS_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_CORS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
