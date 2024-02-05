Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDCFC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B788C402A7;
	Mon,  5 Feb 2024 11:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B788C402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4VIyDDvkGjgG; Mon,  5 Feb 2024 11:17:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9991E40B7E;
	Mon,  5 Feb 2024 11:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9991E40B7E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E1501BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26B53418B6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26B53418B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EgzcUKNUBnSX for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:17:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4426F418BA
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4426F418BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FC7786BB9; Mon,  5 Feb 2024 11:17:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:17:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9eb7860257442d7ab98ec7a417a7fb8d99fe797a
X-Git-Newrev: 85c5071bfea948fabbac6c3e81103c7979fa6646
X-Patchwork-Hint: ignore
Message-Id: <20240205111738.2FC7786BB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-socketio: bump to version
 5.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=85c5071bfea948fabbac6c3e81103c7979fa6646
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-socketio/python-socketio.hash | 4 ++--
 package/python-socketio/python-socketio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index abdcc3a5b7..a7756eb39d 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5  e63369252a9d383cbfc503337b864733  python-socketio-5.7.2.tar.gz
-sha256  92395062d9db3c13d30e7cdedaa0e1330bba78505645db695415f9a3c628d097  python-socketio-5.7.2.tar.gz
+md5  207c7452bf6f1f444d8b70cac8801647  python-socketio-5.11.0.tar.gz
+sha256  b03186e04b942088781f6286c13604a853e5e35ed59158c51ff7af22fa032e6f  python-socketio-5.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index aecff55ef4..dc0c24fef5 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 5.7.2
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/ee/56/294629986bf6cea96e0edb3933a7f2fac7a079d12909e893903a2effc670
+PYTHON_SOCKETIO_VERSION = 5.11.0
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/7a/e1/2817819a5635a099fda9fc758c51dc2f07996d6928d744639afcf5c5ddbb
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
