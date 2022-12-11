Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B7EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72B85607E1;
	Sun, 11 Dec 2022 09:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72B85607E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id brL1lAh332p5; Sun, 11 Dec 2022 09:08:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACF9D605EC;
	Sun, 11 Dec 2022 09:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACF9D605EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6D701BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3FE7409A4
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3FE7409A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJa4ydpXo9SK for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69AEA40A02
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69AEA40A02
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58E5685FAA; Sun, 11 Dec 2022 08:55:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:30:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c330d67dae8ca6eefde2aa076151820d87beebe7
X-Git-Newrev: bc4bed533a6c0166b70aeb03ddde9b021ea4058f
X-Patchwork-Hint: ignore
Message-Id: <20221211085517.58E5685FAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zopfli: bump to version
 0.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc4bed533a6c0166b70aeb03ddde9b021ea4058f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-zopfli/python-zopfli.hash | 4 ++--
 package/python-zopfli/python-zopfli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zopfli/python-zopfli.hash b/package/python-zopfli/python-zopfli.hash
index 969ed97992..29bdfe5e5b 100644
--- a/package/python-zopfli/python-zopfli.hash
+++ b/package/python-zopfli/python-zopfli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zopfli/json
-md5  505ea595d86b8a7fec55620c839a4859  zopfli-0.2.1.zip
-sha256  e5263d2806e2c1ccb23f52b2972a235d31d42f22f3fa3032cc9aded51e9bf2c6  zopfli-0.2.1.zip
+md5  0c1e41e5403524e0180f3ed9aaa356ec  zopfli-0.2.2.zip
+sha256  2d49db7540d9991976af464ebc1b9ed12988c04d90691bcb51dc4a373a9e2afc  zopfli-0.2.2.zip
 # Locally computed sha256 checksums
 sha256  018b1cb87efdf7a04c2fcc13d57ed63f62149113fb207b27ea13430d64f13513  COPYING
diff --git a/package/python-zopfli/python-zopfli.mk b/package/python-zopfli/python-zopfli.mk
index 689634fefa..d6af6e4b5f 100644
--- a/package/python-zopfli/python-zopfli.mk
+++ b/package/python-zopfli/python-zopfli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPFLI_VERSION = 0.2.1
+PYTHON_ZOPFLI_VERSION = 0.2.2
 PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).zip
-PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/91/25/ba6f370e18359292f05ca4df93642eb7d1c424721ef61f61b8610a63d0c5
+PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/9a/ed/d004d5737f9546167eecf0ecd995ee1a796703e512deb2f2ea26cdbe4b3e
 PYTHON_ZOPFLI_SETUP_TYPE = setuptools
 PYTHON_ZOPFLI_LICENSE = Apache-2.0
 PYTHON_ZOPFLI_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
