Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3912BC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0AAE436FC;
	Wed, 20 Dec 2023 20:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0AAE436FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kvHDlIBX9eq; Wed, 20 Dec 2023 20:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5826436E6;
	Wed, 20 Dec 2023 20:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5826436E6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1FA21BF977
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC0D880BEC
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC0D880BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mV-COPrV3ZiC for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:58:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD99A80BD3
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD99A80BD3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5B7C87C95; Wed, 20 Dec 2023 20:58:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 21:55:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa5ee701b11ddafb5565dc0d57a2e045cd68dc19
X-Git-Newrev: 36db831321f43746afa336869057d588ce470b84
X-Patchwork-Hint: ignore
Message-Id: <20231220205825.B5B7C87C95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-meson-python: new host
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=36db831321f43746afa336869057d588ce470b84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-meson-python/python-meson-python.hash |  5 +++++
 package/python-meson-python/python-meson-python.mk   | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/python-meson-python/python-meson-python.hash b/package/python-meson-python/python-meson-python.hash
new file mode 100644
index 0000000000..537353bad2
--- /dev/null
+++ b/package/python-meson-python/python-meson-python.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/meson-python/json
+md5  e91eb9946d7bb8be06e434c5a2dadd05  meson_python-0.15.0.tar.gz
+sha256  fddb73eecd49e89c1c41c87937cd89c2d0b65a1c63ba28238681d4bd9484d26f  meson_python-0.15.0.tar.gz
+# Locally computed sha256 checksums
+sha256  8f82ea9ef9a55b47f4170536d02e48b5bc33fc5135e5b4a1b5f8d6404833ec9b  LICENSE
diff --git a/package/python-meson-python/python-meson-python.mk b/package/python-meson-python/python-meson-python.mk
new file mode 100644
index 0000000000..64d5de4ba9
--- /dev/null
+++ b/package/python-meson-python/python-meson-python.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-meson-python
+#
+################################################################################
+
+PYTHON_MESON_PYTHON_VERSION = 0.15.0
+PYTHON_MESON_PYTHON_SOURCE = meson_python-$(PYTHON_MESON_PYTHON_VERSION).tar.gz
+PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/a2/3b/276b596824a0820987fdcc7721618453b4f9a8305fe20b611a00ac3f948e
+PYTHON_MESON_PYTHON_SETUP_TYPE = pep517
+PYTHON_MESON_PYTHON_LICENSE = MIT
+PYTHON_MESON_PYTHON_LICENSE_FILES = LICENSE
+HOST_PYTHON_MESON_PYTHON_DEPENDENCIES = \
+	host-meson \
+	host-patchelf \
+	host-python-pyproject-metadata
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
