Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2EBC4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54D9440969;
	Tue,  6 Feb 2024 10:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54D9440969
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tGWlQ9_2nAQ3; Tue,  6 Feb 2024 10:15:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A29274087E;
	Tue,  6 Feb 2024 10:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A29274087E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F19F71BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC60D81E6E
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nfp79KRZZSgn for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AB6A81E62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AB6A81E62
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:15:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04F6686F0A; Tue,  6 Feb 2024 10:15:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 11:14:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02734c0c22b5567194f187b5650470f90c6db681
X-Git-Newrev: bf2b8d890ec1b9e001e7671f79d7144780f1c815
X-Patchwork-Hint: ignore
Message-Id: <20240206101543.04F6686F0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp-debugtoolbar: bump
 to version 0.6.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bf2b8d890ec1b9e001e7671f79d7144780f1c815
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to new line removal:
https://github.com/aio-libs/aiohttp-debugtoolbar/commit/449550e9c70f17be7b679b90cc3dda2cc90c61e1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash    | 6 +++---
 package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
index 3cd9462d72..441574bbe2 100644
--- a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
+++ b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp_debugtoolbar/json
-md5  496734057cb413d7a49a52a817802dbb  aiohttp-debugtoolbar-0.6.0.tar.gz
-sha256  ec231661133b40136608d39dfb688e7ea0c3d47b6ae6dee52d5bf24ceb9e4d45  aiohttp-debugtoolbar-0.6.0.tar.gz
+md5  3be0e457798dbd301f4cfe8da43166d4  aiohttp-debugtoolbar-0.6.1.tar.gz
+sha256  cd7ae54c600db7ae7d9dc3404b81f95209a6367df1d59e13ea20f9926e36e001  aiohttp-debugtoolbar-0.6.1.tar.gz
 # Locally computed sha256 checksums
-sha256  94d638be2cb4f186cc62bb567455837757547c15f1b350863aaf05a38843b542  LICENSE
+sha256  dd064918c2da830f543f6b34b699efd423c2ad82fdbda15c25214410fcd3f84b  LICENSE
diff --git a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk
index 319d20ffc5..8eb38e86cc 100644
--- a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk
+++ b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_DEBUGTOOLBAR_VERSION = 0.6.0
+PYTHON_AIOHTTP_DEBUGTOOLBAR_VERSION = 0.6.1
 PYTHON_AIOHTTP_DEBUGTOOLBAR_SOURCE = aiohttp-debugtoolbar-$(PYTHON_AIOHTTP_DEBUGTOOLBAR_VERSION).tar.gz
-PYTHON_AIOHTTP_DEBUGTOOLBAR_SITE = https://files.pythonhosted.org/packages/3f/dd/5121417dfbeb4661673afa5c8708f1539889d0e54b1509a6fdf66705efc5
+PYTHON_AIOHTTP_DEBUGTOOLBAR_SITE = https://files.pythonhosted.org/packages/bd/72/cd80c0d1d425d5ef50e5b23553040e8d9fa5de5714208d3d18ae8806b6de
 PYTHON_AIOHTTP_DEBUGTOOLBAR_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_DEBUGTOOLBAR_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_DEBUGTOOLBAR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
