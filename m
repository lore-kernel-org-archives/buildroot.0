Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F97C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30B344F04C;
	Mon, 20 Feb 2023 22:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30B344F04C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jFkEHNKxJRuO; Mon, 20 Feb 2023 22:26:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 378EA4F059;
	Mon, 20 Feb 2023 22:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 378EA4F059
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09E1B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9ABC61196
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9ABC61196
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n3ABUVSeYvo9 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD9316112C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD9316112C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDB6D8648F; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:30:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6b401a65858161cd840378632d934a5fa13120d1
X-Git-Newrev: d85a17270de1595d4b63c999e4c76b3bd53eccab
X-Patchwork-Hint: ignore
Message-Id: <20230220205203.BDB6D8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-u-msgpack: bump
 to version 2.7.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d85a17270de1595d4b63c999e4c76b3bd53eccab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to year update:
https://github.com/vsergeev/u-msgpack-python/commit/8794887e2a71258ddacb7c435ca6f43304c2a21b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-u-msgpack/python-u-msgpack.hash | 6 +++---
 package/python-u-msgpack/python-u-msgpack.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-u-msgpack/python-u-msgpack.hash b/package/python-u-msgpack/python-u-msgpack.hash
index 0891783985..0ec2385533 100644
--- a/package/python-u-msgpack/python-u-msgpack.hash
+++ b/package/python-u-msgpack/python-u-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/u-msgpack-python/json
-md5  8691cea6bc7b44bce6e2115260a54323  u-msgpack-python-2.7.1.tar.gz
-sha256  b7e7d433cab77171a4c752875d91836f3040306bab5063fb6dbe11f64ea69551  u-msgpack-python-2.7.1.tar.gz
+md5  6c4fbe9e1df1c1563ecc9e435b82fdcb  u-msgpack-python-2.7.2.tar.gz
+sha256  e86f7ac6aa0ef4c6c49f004b4fd435bce99c23e2dd5d73003f3f9816024c2bd8  u-msgpack-python-2.7.2.tar.gz
 # Locally computed sha256 checksums
-sha256  268ae7b7efbf67cd7bc0a9efea844fcf448d03f9cc6b8c79e8fe311815985030  LICENSE
+sha256  f938fe2d3b7b329005d4b2851f106fd4351ca55f0836335acbe52386312f7f31  LICENSE
diff --git a/package/python-u-msgpack/python-u-msgpack.mk b/package/python-u-msgpack/python-u-msgpack.mk
index e0a3b3f297..372c5a8d45 100644
--- a/package/python-u-msgpack/python-u-msgpack.mk
+++ b/package/python-u-msgpack/python-u-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_U_MSGPACK_VERSION = 2.7.1
+PYTHON_U_MSGPACK_VERSION = 2.7.2
 PYTHON_U_MSGPACK_SOURCE = u-msgpack-python-$(PYTHON_U_MSGPACK_VERSION).tar.gz
-PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/62/94/a4f485b628310534d377b3e7cb6f85b8066dc823dbff0e4421fb4227fb7e
+PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/44/a7/1cb4f059bbf72ea24364f9ba3ef682725af09969e29df988aa5437f0044e
 PYTHON_U_MSGPACK_SETUP_TYPE = setuptools
 PYTHON_U_MSGPACK_LICENSE = MIT
 PYTHON_U_MSGPACK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
