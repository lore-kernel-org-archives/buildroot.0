Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CFDC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 08:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DF2881381;
	Sun, 11 Dec 2022 08:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DF2881381
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sear5qnfMMtu; Sun, 11 Dec 2022 08:55:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1CF581373;
	Sun, 11 Dec 2022 08:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1CF581373
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5FB31BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FEBC404DD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FEBC404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ww48lrLVtN-U for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7472403A7
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7472403A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B209E85FA6; Sun, 11 Dec 2022 08:55:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:28:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09c966af735ca53b447f52965d123c21e43ae522
X-Git-Newrev: 5d068bf4c4fce1eb376711940fb02a017815127e
X-Patchwork-Hint: ignore
Message-Id: <20221211085514.B209E85FA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-canopen: bump to version
 2.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d068bf4c4fce1eb376711940fb02a017815127e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-canopen/python-canopen.hash | 5 +++--
 package/python-canopen/python-canopen.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-canopen/python-canopen.hash b/package/python-canopen/python-canopen.hash
index 32bcae18f9..610dca3f34 100644
--- a/package/python-canopen/python-canopen.hash
+++ b/package/python-canopen/python-canopen.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/canopen/json
-sha256  4394770d528e93a48936138c4a7b37b5dff26d54f82a435ad9790cd1e43f55b9  canopen-1.0.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/canopen/json
+md5  0719b73bd8ccaeaa9fb758c5338fd030  canopen-2.0.0.tar.gz
+sha256  bcc8aa9ea83f7ada5da0dade81038977be52a93802c2657649729eb1f82065d9  canopen-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0740d30978affcd91c0fc817b7cf942a332381bf0380fe17e60c6a0b377c6e0d  LICENSE.txt
diff --git a/package/python-canopen/python-canopen.mk b/package/python-canopen/python-canopen.mk
index fc328c698e..bd0a3bfba7 100644
--- a/package/python-canopen/python-canopen.mk
+++ b/package/python-canopen/python-canopen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CANOPEN_VERSION = 1.0.0
+PYTHON_CANOPEN_VERSION = 2.0.0
 PYTHON_CANOPEN_SOURCE = canopen-$(PYTHON_CANOPEN_VERSION).tar.gz
-PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/1f/2b/55b6d82b3dcba184a01c6fe027df239953940e36a463cd24b71e67bd1f37
+PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/9e/d6/6ced4b410b904aeee5f7d0227187eae95a5ad769f01014a74fc0e016845e
 PYTHON_CANOPEN_SETUP_TYPE = setuptools
 PYTHON_CANOPEN_LICENSE = MIT
 PYTHON_CANOPEN_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
