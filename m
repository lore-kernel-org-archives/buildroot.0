Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FBFC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6070605A4;
	Sun, 11 Dec 2022 09:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6070605A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v0itYjqzWS3t; Sun, 11 Dec 2022 09:09:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BFD86060A;
	Sun, 11 Dec 2022 09:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BFD86060A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A785A1BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C49E5409AA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C49E5409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FXF7BJiei1fM for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D950D4093E
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D950D4093E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C56D485FAB; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:30:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2733644c8947f8dafa1559bc12b3e67cee99ae6c
X-Git-Newrev: 225e8745c62c75b20867af928d459abfbb53da94
X-Patchwork-Hint: ignore
Message-Id: <20221211085516.C56D485FAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-simplejson: bump to version
 3.18.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=225e8745c62c75b20867af928d459abfbb53da94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-simplejson/python-simplejson.hash | 4 ++--
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index 0f56d4c6cc..1c99b87590 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplejson/json
-md5  0b8f47c9451bf101a791f8b5bccf1f33  simplejson-3.17.6.tar.gz
-sha256  cf98038d2abf63a1ada5730e91e84c642ba6c225b0198c3684151b1f80c5f8a6  simplejson-3.17.6.tar.gz
+md5  83e24e662f024e06af2fffe698227da4  simplejson-3.18.0.tar.gz
+sha256  58a429d2c2fa80834115b923ff689622de8f214cf0dc4afa9f59e824b444ab31  simplejson-3.18.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 52bff7569c..1607d9c90c 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 3.17.6
+PYTHON_SIMPLEJSON_VERSION = 3.18.0
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/7a/47/c7cc3d4ed15f09917838a2fb4e1759eafb6d2f37ebf7043af984d8b36cf7
+PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/17/3d/b8bfe1f40558f6a16f70c349adf97480dc71a7d11b2b1a5dc0824a87faa0
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
