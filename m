Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61594C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17480402EC;
	Mon,  4 Dec 2023 20:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17480402EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 67eM_Hv43Fjk; Mon,  4 Dec 2023 20:22:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34594400F8;
	Mon,  4 Dec 2023 20:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34594400F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EF531BF97A
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83D4760FE5
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83D4760FE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ErB5P9-lZBSW for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F36060FC8
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F36060FC8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BFD1879B9; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 12:25:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 778fddf9e2020bce64df78c7f86edcd4b62e80cb
X-Git-Newrev: 3223987c937c5e7ef2caf0166bb45f4089d89b2f
X-Patchwork-Hint: ignore
Message-Id: <20231204201328.7BFD1879B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-psycopg2: bump to version
 2.9.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=3223987c937c5e7ef2caf0166bb45f4089d89b2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-psycopg2/python-psycopg2.hash | 4 ++--
 package/python-psycopg2/python-psycopg2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
index 58f98f9d84..6659c6cef8 100644
--- a/package/python-psycopg2/python-psycopg2.hash
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psycopg2/json
-md5  3cec7285f61690633bb070d4bba259c2  psycopg2-2.9.5.tar.gz
-sha256  a5246d2e683a972e2187a8714b5c2cf8156c064629f9a9b1a873c1730d9e245a  psycopg2-2.9.5.tar.gz
+md5  eae35fa97cdc92b910b706c720a257c7  psycopg2-2.9.9.tar.gz
+sha256  d1454bde93fb1e224166811694d600e746430c006fbb031ea06ecc2ea41bf156  psycopg2-2.9.9.tar.gz
 # Locally computed sha256 checksums
 sha256  9614b85dfc9a72c5b2ca33144c1d7e1ed3b1c297459d9fb28a6a5762c2e8d71b  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index fa23c2814f..0149b8d185 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYCOPG2_VERSION = 2.9.5
+PYTHON_PSYCOPG2_VERSION = 2.9.9
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/89/d6/cd8c46417e0f7a16b4b0fc321f4ab676a59250d08fce5b64921897fb07cc
+PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/c9/5e/dc6acaf46d78979d6b03458b7a1618a68e152a6776fce95daac5e0f0301b
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
