Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DF1C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 457C260A89;
	Mon, 16 Sep 2024 10:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGRGr1MzZYUd; Mon, 16 Sep 2024 10:02:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4BE760A95
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4BE760A95;
	Mon, 16 Sep 2024 10:02:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4631E1BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BC0380B97
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKfcWhGXglKr for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C3BE80B9A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C3BE80B9A
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28F0081898; Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 11:54:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 860e746fc7aa90e798d29c0ebc11cc0f9b0b36a5
X-Git-Newrev: f9c7e7c343a332ada777f22960899669e5a6e949
X-Patchwork-Hint: ignore
Message-Id: <20240916100147.28F0081898@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mimeparse: bump to version
 2.0.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f9c7e7c343a332ada777f22960899669e5a6e949
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-mimeparse/python-mimeparse.hash | 4 ++--
 package/python-mimeparse/python-mimeparse.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-mimeparse/python-mimeparse.hash b/package/python-mimeparse/python-mimeparse.hash
index 00985841dc..d8c9070fa7 100644
--- a/package/python-mimeparse/python-mimeparse.hash
+++ b/package/python-mimeparse/python-mimeparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-mimeparse/json
-md5  a32ae1df93be1ddb581d1c0fa124bab4  python-mimeparse-1.6.0.tar.gz
-sha256  76e4b03d700a641fd7761d3cd4fdbbdcd787eade1ebfac43f877016328334f78  python-mimeparse-1.6.0.tar.gz
+md5  e3d6505e9af0629a15b4d56d7f34b2ef  python_mimeparse-2.0.0.tar.gz
+sha256  5b9a9dcf7aa82465e31bd667f5cb7000604811dce83554f1c8a43693a32cb303  python_mimeparse-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-mimeparse/python-mimeparse.mk b/package/python-mimeparse/python-mimeparse.mk
index 00bb1cf8f4..a67d02f818 100644
--- a/package/python-mimeparse/python-mimeparse.mk
+++ b/package/python-mimeparse/python-mimeparse.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MIMEPARSE_VERSION = 1.6.0
-PYTHON_MIMEPARSE_SITE = https://files.pythonhosted.org/packages/0f/40/ac5f9e44a55b678c3cd881b4c3376e5b002677dbeab6fb3a50bac5d50d29
+PYTHON_MIMEPARSE_VERSION = 2.0.0
+PYTHON_MIMEPARSE_SOURCE = python_mimeparse-$(PYTHON_MIMEPARSE_VERSION).tar.gz
+PYTHON_MIMEPARSE_SITE = https://files.pythonhosted.org/packages/cd/85/c40f2e0b2128905f6c34894be01803c114f2b2efab0e8b4c3dca5e56b999
 PYTHON_MIMEPARSE_SETUP_TYPE = setuptools
 PYTHON_MIMEPARSE_LICENSE = MIT
 PYTHON_MIMEPARSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
