Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06BECF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFF2F81461;
	Sun, 22 Sep 2024 10:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_h48KzUIETO; Sun, 22 Sep 2024 10:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BD518149B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BD518149B;
	Sun, 22 Sep 2024 10:35:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1675B1BF8A8
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A7E0400CF
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3sOLZ9fYeFs for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB6FF400AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB6FF400AC
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D69FA81446; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:37:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9054ed94d4b6740ad9076cb2cfeb8f4142d45759
X-Git-Newrev: 3db06403bf494d3e900490408af0836b581f255d
X-Patchwork-Hint: ignore
Message-Id: <20240922103440.D69FA81446@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tcolorpy: bump to version
 0.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=3db06403bf494d3e900490408af0836b581f255d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-tcolorpy/python-tcolorpy.hash | 4 ++--
 package/python-tcolorpy/python-tcolorpy.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-tcolorpy/python-tcolorpy.hash b/package/python-tcolorpy/python-tcolorpy.hash
index cf5ca0e5f3..0bba6e47fe 100644
--- a/package/python-tcolorpy/python-tcolorpy.hash
+++ b/package/python-tcolorpy/python-tcolorpy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tcolorpy/json
-md5  ca571cccff812ecdc0c73968c9d24ebf  tcolorpy-0.1.4.tar.gz
-sha256  f0dceb1cb95e554cee63024b3cd2fd8d4628c568773de2d1e6b4f0478461901c  tcolorpy-0.1.4.tar.gz
+md5  a4a8404d2b6ecfae4eeca8c71e4634c6  tcolorpy-0.1.6.tar.gz
+sha256  8cea0bf5f8cf03f77528a9acfbf312df935573892ba5ea3b2516e61fa54de9a5  tcolorpy-0.1.6.tar.gz
 # Locally computed sha256 checksums
 sha256  f41a0456d5f2bba25fd4d7e50b51a95de304770ff1db5a79515d03397a914d8d  LICENSE
diff --git a/package/python-tcolorpy/python-tcolorpy.mk b/package/python-tcolorpy/python-tcolorpy.mk
index 5c42320c17..bdc66f61bc 100644
--- a/package/python-tcolorpy/python-tcolorpy.mk
+++ b/package/python-tcolorpy/python-tcolorpy.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_TCOLORPY_VERSION = 0.1.4
+PYTHON_TCOLORPY_VERSION = 0.1.6
 PYTHON_TCOLORPY_SOURCE = tcolorpy-$(PYTHON_TCOLORPY_VERSION).tar.gz
-PYTHON_TCOLORPY_SITE = https://files.pythonhosted.org/packages/ba/e0/20b99847e76bb89784b68634399261d770b01054bca16cd19a06ac9c2e67
+PYTHON_TCOLORPY_SITE = https://files.pythonhosted.org/packages/af/f6/b17885354c5addfb93c14f3ed7172c33494f989dd5f83c0340d2c8fa3b69
 PYTHON_TCOLORPY_SETUP_TYPE = setuptools
 PYTHON_TCOLORPY_LICENSE = MIT
 PYTHON_TCOLORPY_LICENSE_FILES = LICENSE
+PYTHON_TCOLORPY_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
