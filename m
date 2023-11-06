Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE08C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D944E40971;
	Mon,  6 Nov 2023 22:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D944E40971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DJ_GLcYjhC5; Mon,  6 Nov 2023 22:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02901416E5;
	Mon,  6 Nov 2023 22:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02901416E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 710BE1BF954
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 220CB612C2
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 220CB612C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E4PSHjD-_1F4 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F06D6612C9
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F06D6612C9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1A7686B7C; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:15:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b32eef540e4a76780033a7c2ae1e6e948a637de2
X-Git-Newrev: 5847b7b73550d0a481feff9cf33066af94d84f8f
X-Patchwork-Hint: ignore
Message-Id: <20231106222017.E1A7686B7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httplib2: bump to version
 0.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5847b7b73550d0a481feff9cf33066af94d84f8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-httplib2/python-httplib2.hash | 4 ++--
 package/python-httplib2/python-httplib2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
index 4da8f26e43..cfbf55a4b0 100644
--- a/package/python-httplib2/python-httplib2.hash
+++ b/package/python-httplib2/python-httplib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httplib2/json
-md5  b42f508585d988e77eac3980db1fd967  httplib2-0.21.0.tar.gz
-sha256  fc144f091c7286b82bec71bdbd9b27323ba709cc612568d3000893bfd9cb4b34  httplib2-0.21.0.tar.gz
+md5  7ca0a2bfd95ba4ab4b6e28804cdb94ed  httplib2-0.22.0.tar.gz
+sha256  d7a10bc5ef5ab08322488bde8c726eeee5c8618723fdb399597ec58f3d82df81  httplib2-0.22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  589eec38f72df2be203711d3b8cbece9b908c5e7ff00bc3cab7f63bae9e366b4  LICENSE
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index 2f4eb98356..9d7061cfac 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPLIB2_VERSION = 0.21.0
+PYTHON_HTTPLIB2_VERSION = 0.22.0
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
-PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/c2/37/a093aaa902f6b2301f0f2cff5285548dbc4ab9b9a29215eb440381cbb32b
+PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/3d/ad/2371116b22d616c194aa25ec410c9c6c37f23599dcd590502b74db197584
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
 PYTHON_HTTPLIB2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
