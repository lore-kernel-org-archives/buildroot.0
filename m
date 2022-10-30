Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6183C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CB8C40399;
	Sun, 30 Oct 2022 14:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CB8C40399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJTOhDYwhiVa; Sun, 30 Oct 2022 14:08:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F28040566;
	Sun, 30 Oct 2022 14:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F28040566
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 839731BF487
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E45060592
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E45060592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tk5hLPysi_yE for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AA4460ABA
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AA4460ABA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59A5C8750F; Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 15:03:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb780a19d05e14188eba0a4fa1e867fb09dd6c92
X-Git-Newrev: 987c27510f7949807e93ceb573b4d2ee00abb35c
X-Patchwork-Hint: ignore
Message-Id: <20221030140545.59A5C8750F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiofiles: bump to version
 22.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=987c27510f7949807e93ceb573b4d2ee00abb35c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiofiles/python-aiofiles.hash | 4 ++--
 package/python-aiofiles/python-aiofiles.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiofiles/python-aiofiles.hash b/package/python-aiofiles/python-aiofiles.hash
index 268136a406..d1594c3989 100644
--- a/package/python-aiofiles/python-aiofiles.hash
+++ b/package/python-aiofiles/python-aiofiles.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiofiles/json
-md5  697deeb4fdcb620c45f114f173ed7c0d  aiofiles-0.8.0.tar.gz
-sha256  8334f23235248a3b2e83b2c3a78a22674f39969b96397126cc93664d9a901e59  aiofiles-0.8.0.tar.gz
+md5  b22db90039c881f6aa64431c6b23f30f  aiofiles-22.1.0.tar.gz
+sha256  9107f1ca0b2a5553987a94a3c9959fe5b491fdf731389aa5b7b1bd0733e32de6  aiofiles-22.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
index 996e5eb6c0..b65d2cfa82 100644
--- a/package/python-aiofiles/python-aiofiles.mk
+++ b/package/python-aiofiles/python-aiofiles.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOFILES_VERSION = 0.8.0
+PYTHON_AIOFILES_VERSION = 22.1.0
 PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
-PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/10/ca/c416cfacf6a47e1400dad56eab85aa86c92c6fbe58447d12035e434f0d5c
+PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/86/26/6e5060a159a6131c430e8a01ec8327405a19a449a506224b394e36f2ebc9
 PYTHON_AIOFILES_SETUP_TYPE = setuptools
 PYTHON_AIOFILES_LICENSE = Apache-2.0
 PYTHON_AIOFILES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
