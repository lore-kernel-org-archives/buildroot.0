Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B059CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 20:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5008400EF;
	Sat, 21 Sep 2024 20:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zP_filffR0yU; Sat, 21 Sep 2024 20:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9148402E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9148402E1;
	Sat, 21 Sep 2024 20:17:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D9141BF48B
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 20:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C83540172
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 20:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id goBTS0EcsWcz for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 20:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51ADC40109
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51ADC40109
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 20:17:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F15184154; Sat, 21 Sep 2024 20:17:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:12:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39176edc7b09cbcfb96ec11b2badb91a248857c4
X-Git-Newrev: d8f336c7ad263af82fc5359d120569c4a50d4fe9
X-Patchwork-Hint: ignore
Message-Id: <20240921201722.3F15184154@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-lark: bump to version 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8f336c7ad263af82fc5359d120569c4a50d4fe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Verified license remains MIT after hash changed.

License hash changed due to line endings changing from windows style
to unix style.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-lark/python-lark.hash | 6 +++---
 package/python-lark/python-lark.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-lark/python-lark.hash b/package/python-lark/python-lark.hash
index 9ea778c8da..35ee842a4a 100644
--- a/package/python-lark/python-lark.hash
+++ b/package/python-lark/python-lark.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lark/json
-md5  124c36ea3b68783f06cea5fe6ee8a6f2  lark-1.1.8.tar.gz
-sha256  7ef424db57f59c1ffd6f0d4c2b705119927f566b68c0fe1942dddcc0e44391a5  lark-1.1.8.tar.gz
+md5  99760ed81904c56b2db2b7ab7723063e  lark-1.2.2.tar.gz
+sha256  ca807d0162cd16cef15a8feecb862d7319e7a09bdb13aef927968e45040fed80  lark-1.2.2.tar.gz
 # Locally computed sha256 checksums
-sha256  8263e5652d07cecb3adadf05140b65e70cfa169ecec5f520fe1671479ce12a83  LICENSE
+sha256  2eee60f52d4e11357bf89e72b034d050e285e47fda1361e5662fb322ee27d771  LICENSE
diff --git a/package/python-lark/python-lark.mk b/package/python-lark/python-lark.mk
index 9cb30abb65..1a85b49bd3 100644
--- a/package/python-lark/python-lark.mk
+++ b/package/python-lark/python-lark.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LARK_VERSION = 1.1.8
+PYTHON_LARK_VERSION = 1.2.2
 PYTHON_LARK_SOURCE = lark-$(PYTHON_LARK_VERSION).tar.gz
-PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/12/1c/b466b58dacac15ffefce9bcb5128e18948a143849610a7d5300f31920be0
+PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/af/60/bc7622aefb2aee1c0b4ba23c1446d3e30225c8770b38d7aedbfb65ca9d5a
 PYTHON_LARK_SETUP_TYPE = setuptools
 PYTHON_LARK_LICENSE = MIT
 PYTHON_LARK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
