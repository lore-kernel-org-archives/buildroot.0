Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE019C46467
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 939E660F98;
	Sun, 15 Jan 2023 11:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 939E660F98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZiUb6H6mfPux; Sun, 15 Jan 2023 11:21:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B918660D91;
	Sun, 15 Jan 2023 11:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B918660D91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 585E41BF29F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 131FC81FE1
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 131FC81FE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hd7Rn12TPYEK for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:19:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EC5981F6E
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EC5981F6E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C96B87103; Sun, 15 Jan 2023 11:19:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:16:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cec8c511127ccb6223a133399a88b3fd5cd8ded9
X-Git-Newrev: 9af376f6da76c7c8b38e01d9d3cae04948d5f758
X-Patchwork-Hint: ignore
Message-Id: <20230115111943.3C96B87103@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytz: bump to version 2022.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=9af376f6da76c7c8b38e01d9d3cae04948d5f758
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index e71e77e5b7..6d6e1b606c 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5  bf46b54a7e9bcb65ea38f54646181979  pytz-2022.6.tar.gz
-sha256  e89512406b793ca39f5971bc999cc538ce125c0e51c27941bef4568b460095e2  pytz-2022.6.tar.gz
+md5  3b9356e4dcd441df922cc01e8eb15983  pytz-2022.7.tar.gz
+sha256  7ccfae7b4b2c067464a6733c6261673fdb8fd1be905460396b97a073e9fa683a  pytz-2022.7.tar.gz
 # Locally computed sha256 checksums
 sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 58f06e1993..057a3ef173 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2022.6
+PYTHON_PYTZ_VERSION = 2022.7
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/76/63/1be349ff0a44e4795d9712cc0b2d806f5e063d4d34631b71b832fac715a8
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/6d/37/54f2d7c147e42dc85ffbc6910862bb4f141fb3fc14d9a88efaa1a76c7df2
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
