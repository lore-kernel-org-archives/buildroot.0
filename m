Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15D8C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C13A40949;
	Mon, 22 Jul 2024 12:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Km_ocJzumUiF; Mon, 22 Jul 2024 12:09:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A084C408F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A084C408F1;
	Mon, 22 Jul 2024 12:09:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 024FB1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E23554024A
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PmaL6TCjDOTS for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:09:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D02984029C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D02984029C
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:09:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3D8586FFB; Mon, 22 Jul 2024 12:09:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 14:06:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f34e68217264fb62c48ce28c48bf759b30fef0e
X-Git-Newrev: b2c1a8d2e258a07e69666dab4ef8f1267711a0ae
X-Patchwork-Hint: ignore
Message-Id: <20240722120923.C3D8586FFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uvicorn: bump to 0.30.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2c1a8d2e258a07e69666dab4ef8f1267711a0ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

* https://github.com/encode/uvicorn/releases/tag/0.30.3
* https://github.com/encode/uvicorn/releases/tag/0.30.2

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index 318fc65e21..7032319999 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  a000939f41470e55bad5cec475489b4c  uvicorn-0.30.1.tar.gz
-sha256  d46cd8e0fd80240baffbcd9ec1012a712938754afcf81bce56c024c1656aece8  uvicorn-0.30.1.tar.gz
+md5  433c22f6ac3bbc2e7011a5623b772e25  uvicorn-0.30.3.tar.gz
+sha256  0d114d0831ff1adbf231d358cbf42f17333413042552a624ea6a9b4c33dcfd81  uvicorn-0.30.3.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 092c640abd..00c3b953a3 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.30.1
+PYTHON_UVICORN_VERSION = 0.30.3
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/37/16/9f5ccaa1a76e5bfbaa0c67640e2db8a5214ca08d92a1b427fa1677b3da88
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/77/40/b650be95700dc83d14c5f2b9eac9deb23cbca757a12ee20e473b5ef1ac48
 PYTHON_UVICORN_SETUP_TYPE = pep517
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
