Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72505C83F1B
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 13:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AE6F60A9E;
	Mon, 14 Jul 2025 13:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7jr4bGu1-sP; Mon, 14 Jul 2025 13:44:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43CB960A74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43CB960A74;
	Mon, 14 Jul 2025 13:44:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 41628AF7
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5328412C9
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwTZooDD4HLY for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 13:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E66940A96
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E66940A96
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C9B67FCBA; Mon, 14 Jul 2025 13:44:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Jul 2025 15:29:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c80b71c8c661ce62cfa800ed558dba31baa5dbb
X-Git-Newrev: b67ca753c9dc1634c9633202209b21d105931ec0
X-Patchwork-Hint: ignore
Message-Id: <20250714134403.2C9B67FCBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flit-core: bump to 3.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b67ca753c9dc1634c9633202209b21d105931ec0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://flit.pypa.io/en/stable/history.html#version-3-12

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-flit-core/python-flit-core.hash | 6 +++---
 package/python-flit-core/python-flit-core.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
index 80f8d915fe..580a99edf0 100644
--- a/package/python-flit-core/python-flit-core.hash
+++ b/package/python-flit-core/python-flit-core.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/flit_core/json
-md5  6d677b1acef1769c4c7156c7508e0dbd  flit_core-3.11.0.tar.gz
-sha256  6ceeee3219e9d2ea282041f3e027c441597b450b33007cb81168e887b6113a8f  flit_core-3.11.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/flit-core/json
+md5  c538415c1f27bd69cbbbf3cdd5135d39  flit_core-3.12.0.tar.gz
+sha256  18f63100d6f94385c6ed57a72073443e1a71a4acb4339491615d0f16d6ff01b2  flit_core-3.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  35b4f1dec512e617077fd6980dbb43ef8c2887adc5d0185edb4c04da175dd816  LICENSE
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index e46453443c..ee958cece5 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLIT_CORE_VERSION = 3.11.0
+PYTHON_FLIT_CORE_VERSION = 3.12.0
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
-PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/bc/18/b9b81cab2b8f63e6e7f72e1ba2766a0454fcd563e7a77b8299cb917ba805
+PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/69/59/b6fc2188dfc7ea4f936cd12b49d707f66a1cb7a1d2c16172963534db741b
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
 PYTHON_FLIT_CORE_LICENSE_FILES = LICENSE
 PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
