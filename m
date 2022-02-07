Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7DEC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 07:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C376A40220;
	Mon,  7 Feb 2022 07:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81IBxf8ayrI4; Mon,  7 Feb 2022 07:36:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9762B401AF;
	Mon,  7 Feb 2022 07:36:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 976FC1BF309
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F95240207
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SvByONrbOCv for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 07:35:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DBD8400D8
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 07:35:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 78EBD82BB8; Mon,  7 Feb 2022 07:28:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Feb 2022 08:32:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91a0425d066fd073c8dd9907b902010162d5954b
X-Git-Newrev: 73d427137cc2867f1018261f61cf9c514f50a6fb
X-Patchwork-Hint: ignore
Message-Id: <20220207072828.78EBD82BB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tinyrpc: bump to version
 1.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=73d427137cc2867f1018261f61cf9c514f50a6fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/mbr/tinyrpc/compare/1.1.1...1.1.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-tinyrpc/python-tinyrpc.hash | 4 ++--
 package/python-tinyrpc/python-tinyrpc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tinyrpc/python-tinyrpc.hash b/package/python-tinyrpc/python-tinyrpc.hash
index c5bdad567e..d4bd348e61 100644
--- a/package/python-tinyrpc/python-tinyrpc.hash
+++ b/package/python-tinyrpc/python-tinyrpc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinyrpc/json
-md5  34d7b41ab48297b6b8fbf937e3d43a57  tinyrpc-1.1.1.tar.gz
-sha256  9e68d7b9688dac8deaa342a2507d04f0b2ece64a9d19382aa2ee13d692e87d7f  tinyrpc-1.1.1.tar.gz
+md5  cc7e62891eee806dfbbafb6e3875825e  tinyrpc-1.1.4.tar.gz
+sha256  c99f412e5d9849c2deb468ea37fee2faf12fbc95bdd3616ae5c276ea195ed6bd  tinyrpc-1.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  587f1ea174824613f4a7e0d7fb95fda000a7f58ca17df12416e014c9ee82e619  LICENSE
diff --git a/package/python-tinyrpc/python-tinyrpc.mk b/package/python-tinyrpc/python-tinyrpc.mk
index f3f7dcc52b..e976778fa2 100644
--- a/package/python-tinyrpc/python-tinyrpc.mk
+++ b/package/python-tinyrpc/python-tinyrpc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TINYRPC_VERSION = 1.1.1
+PYTHON_TINYRPC_VERSION = 1.1.4
 PYTHON_TINYRPC_SOURCE = tinyrpc-$(PYTHON_TINYRPC_VERSION).tar.gz
-PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/6a/63/0851365686da1ca9ab03d63b035eccf87a1d85b743ce07d079462350da33
+PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/d2/86/2741f0c74cc339416c9803b6393eaf230254ecf36ffd839614799e15a202
 PYTHON_TINYRPC_SETUP_TYPE = setuptools
 PYTHON_TINYRPC_LICENSE = MIT
 PYTHON_TINYRPC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
