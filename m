Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD22FCF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D4F060739;
	Sat, 21 Sep 2024 21:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMsfx6p5XJ4t; Sat, 21 Sep 2024 21:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 173AF607AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 173AF607AF;
	Sat, 21 Sep 2024 21:07:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05DAA1BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9F85404D4
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIL92OsO9lRZ for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8C87403C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8C87403C8
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF05F841A8; Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:52:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb8843f5604542945322845843c8228eafb12871
X-Git-Newrev: ed5d5b7d54c3b9dae60464166e9e926b7c961920
X-Patchwork-Hint: ignore
Message-Id: <20240921210741.CF05F841A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pip: bump to version 24.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed5d5b7d54c3b9dae60464166e9e926b7c961920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index d2cc649b01..d29765def7 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  38dd5f7ab301167df063405c7fc16c84  pip-23.3.2.tar.gz
-sha256  7fd9972f96db22c8077a1ee2691b172c8089b17a5652a44494a9ecb0d78f9149  pip-23.3.2.tar.gz
+md5  a00c83f8b89decad22d4ad9cd32f1da1  pip-24.2.tar.gz
+sha256  5b5e490b5e9cb275c879595064adce9ebd31b854e3e803740b72f9ccf34a45b8  pip-24.2.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 552b47eb7d..9af3ba22b0 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 23.3.2
+PYTHON_PIP_VERSION = 24.2
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/b7/06/6b1ad0ae8f97d7a0d6f6ad640db10780578999e647a9593512ceb6f06469
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/4d/87/fb90046e096a03aeab235e139436b3fe804cdd447ed2093b0d70eba3f7f8
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
