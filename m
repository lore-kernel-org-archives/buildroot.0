Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4AFC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 09:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D977F60E1B;
	Sat,  1 Jan 2022 09:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ntk6zUCbPCJ; Sat,  1 Jan 2022 09:56:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C685B60DE5;
	Sat,  1 Jan 2022 09:56:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BABB01BF5A8
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CD4C60E02
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVFysS8k16lU for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 09:54:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6FE760E24
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 09:54:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A5335813B8; Sat,  1 Jan 2022 09:48:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 10:50:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9dbed1ca6aaaecf9de63f9f6b20ccaf41897d7b
X-Git-Newrev: d25064b907d2239aab7de4fe08991335f1e0955c
X-Patchwork-Hint: ignore
Message-Id: <20220101094828.A5335813B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aioconsole: bump to version
 0.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d25064b907d2239aab7de4fe08991335f1e0955c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index 45139a6606..26a3778756 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  b8cbcb6e00d8e535256526dfe4f27db3  aioconsole-0.3.2.tar.gz
-sha256  9355b36d41d5fbdd3dbb01510deb2b985b508b2ebcd5b8bd85af61a707e2f6c8  aioconsole-0.3.2.tar.gz
+md5  f8b67330e631cfc45a9b2560a6e0fa98  aioconsole-0.3.3.tar.gz
+sha256  47df42d9f8cc3995bbe032dd5f01d32cc5b06639e9078bb9b4e3c55b237f5e32  aioconsole-0.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  fe3eea6c599e23a00c08c5f5cb2320c30adc8f8687db5fcec9b79a662c53ff6b  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index 75ea3c2a2a..f06d91a550 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.3.2
+PYTHON_AIOCONSOLE_VERSION = 0.3.3
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/7a/b2/747ab3cb965596cd84c5159941613d901d8771acad3c51c4f5da362aa9f0
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/dd/f6/bbc451ba96c1e1da6aa253f254b181ceb03272b475b27b481b57865d7d7f
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
