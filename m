Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF39C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:56:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F8AB61872
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F8AB61872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B05B4147E;
	Sun,  3 Oct 2021 19:56:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zAfnIPXMM7te; Sun,  3 Oct 2021 19:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C30F5407E8;
	Sun,  3 Oct 2021 19:56:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA0F01BF45A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B3C1407B9
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s7wMGtt9NzWu for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F7FB407BE
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A29D487B23; Sun,  3 Oct 2021 19:53:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 21:32:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 906019688998df36bfff3994a26d3b2055a082f0
X-Git-Newrev: 0138db0f4d8445cc7a5cdcb646f04ab47961ad2d
X-Patchwork-Hint: ignore
Message-Id: <20211003195308.A29D487B23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-meld3: bump to version 2.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0138db0f4d8445cc7a5cdcb646f04ab47961ad2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-meld3/python-meld3.hash | 8 ++++----
 package/python-meld3/python-meld3.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-meld3/python-meld3.hash b/package/python-meld3/python-meld3.hash
index f423b0bf19..69b303e60e 100644
--- a/package/python-meld3/python-meld3.hash
+++ b/package/python-meld3/python-meld3.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/meld3/json
-md5	56fff5d6599efeefc81cf2d3b8cf6b4e  meld3-2.0.0.tar.gz
-sha256	1efda676264490db2e30bfb81b27a918cc6d9c2de6d609491aa43410b9537eb9  meld3-2.0.0.tar.gz
+md5  1add16caefc9e6b82ef4f40532cb4918  meld3-2.0.1.tar.gz
+sha256  3ea266994f1aa83507679a67b493b852c232a7905e29440a6b868558cad5e775  meld3-2.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256	5fe11cd858707131b6ec1338b5c2cd68dd1fdb875e3ec967149bc6fea858ecec  LICENSE.txt
-sha256	2422945b49554688d529e1f8d4ac6e0ab77a817e8889158e1e56cf963ecf5c4d  COPYRIGHT.txt
+sha256  5fe11cd858707131b6ec1338b5c2cd68dd1fdb875e3ec967149bc6fea858ecec  LICENSE.txt
+sha256  2422945b49554688d529e1f8d4ac6e0ab77a817e8889158e1e56cf963ecf5c4d  COPYRIGHT.txt
diff --git a/package/python-meld3/python-meld3.mk b/package/python-meld3/python-meld3.mk
index f67172e6f8..c7973d9c71 100644
--- a/package/python-meld3/python-meld3.mk
+++ b/package/python-meld3/python-meld3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MELD3_VERSION = 2.0.0
+PYTHON_MELD3_VERSION = 2.0.1
 PYTHON_MELD3_SOURCE = meld3-$(PYTHON_MELD3_VERSION).tar.gz
-PYTHON_MELD3_SITE = https://files.pythonhosted.org/packages/00/3b/023446ddc1bf0b519c369cbe88269c30c6a64bd10af4817c73f560c302f7
+PYTHON_MELD3_SITE = https://files.pythonhosted.org/packages/53/af/5b8b67d04a36980de03505446d35db39c7b2a01b9bac1cb673434769ddb8
 PYTHON_MELD3_LICENSE = ZPL-2.1
 PYTHON_MELD3_LICENSE_FILES = COPYRIGHT.txt LICENSE.txt
 PYTHON_MELD3_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
