Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD2BC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 22:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB28A84F60;
	Sun, 11 Feb 2024 22:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sW0HGb5pizlx; Sun, 11 Feb 2024 22:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC51884F61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC51884F61;
	Sun, 11 Feb 2024 22:10:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9757F1BF44A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84BBA6109C
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kRuwvzgL5qVt for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 22:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53D6C61099
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53D6C61099
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 22:10:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B6F48780D; Sun, 11 Feb 2024 22:10:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 23:08:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7593aea519dee34cb25715296c1b03f471123ee2
X-Git-Newrev: d4abcf5872cd14cd2b1633142ffed3794b838ac1
X-Patchwork-Hint: ignore
Message-Id: <20240211221044.3B6F48780D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uvicorn: bump to
 0.27.0.post1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4abcf5872cd14cd2b1633142ffed3794b838ac1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

https://github.com/encode/uvicorn/blob/master/CHANGELOG.md#0270post1---2024-01-29

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index cfa999e210..c7feaf3bfe 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  a1af843e7e305d551030abfa09dd3b15  uvicorn-0.24.0.post1.tar.gz
-sha256  09c8e5a79dc466bdf28dead50093957db184de356fcdc48697bad3bde4c2588e  uvicorn-0.24.0.post1.tar.gz
+md5  a98f96c2578d9e6d454e271d0eae3ba3  uvicorn-0.27.0.post1.tar.gz
+sha256  54898fcd80c13ff1cd28bf77b04ec9dbd8ff60c5259b499b4b12bb0917f22907  uvicorn-0.27.0.post1.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 04e6dd66a7..502cc06ad8 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.24.0.post1
+PYTHON_UVICORN_VERSION = 0.27.0.post1
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/e5/84/d43ce8fe6b31a316ef0ed04ea0d58cab981bdf7f17f8423491fa8b4f50b6
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/38/56/7bc5cf1d693d0c8e5d9dd66c29808691c17260b31346e4ddfbee26ba9bc2
 PYTHON_UVICORN_SETUP_TYPE = pep517
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
