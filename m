Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B45BC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3667B4ED7C;
	Mon, 20 Feb 2023 21:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3667B4ED7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LdIK_whmWDdN; Mon, 20 Feb 2023 21:59:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 349C742D3A;
	Mon, 20 Feb 2023 21:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 349C742D3A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AC2C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41458415BC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41458415BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oZc2hdqwLgjV for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75632416AD
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75632416AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62D6C86494; Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:29:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ec022187abdad4cbf286531b236c460d14b97739
X-Git-Newrev: fdda5c1a6dea195260fc57cc2940dfed88071468
X-Patchwork-Hint: ignore
Message-Id: <20230220205202.62D6C86494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-m2r: bump to
 version 0.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdda5c1a6dea195260fc57cc2940dfed88071468
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-m2r/python-m2r.hash | 4 ++--
 package/python-m2r/python-m2r.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-m2r/python-m2r.hash b/package/python-m2r/python-m2r.hash
index 0770e0d1b1..4bdd7160d8 100644
--- a/package/python-m2r/python-m2r.hash
+++ b/package/python-m2r/python-m2r.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/m2r/json
-md5  8bdb45c19e2b59bb5ffb9a0348e81ad8  m2r-0.2.1.tar.gz
-sha256  bf90bad66cda1164b17e5ba4a037806d2443f2a4d5ddc9f6a5554a0322aaed99  m2r-0.2.1.tar.gz
+md5  255d080f56eb3d3a82d95194850c99c3  m2r-0.3.1.tar.gz
+sha256  aafb67fc49cfb1d89e46a3443ac747e15f4bb42df20ed04f067ad9efbee256ab  m2r-0.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  28728ec0ecbd8c171ebaeccebf69e3961282fd81f06abc7424c65546b6ae6f27  LICENSE
diff --git a/package/python-m2r/python-m2r.mk b/package/python-m2r/python-m2r.mk
index 47fb154c68..8a4708f128 100644
--- a/package/python-m2r/python-m2r.mk
+++ b/package/python-m2r/python-m2r.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_M2R_VERSION = 0.2.1
+PYTHON_M2R_VERSION = 0.3.1
 PYTHON_M2R_SOURCE = m2r-$(PYTHON_M2R_VERSION).tar.gz
-PYTHON_M2R_SITE = https://files.pythonhosted.org/packages/39/e7/9fae11a45f5e1a3a21d8a98d02948e597c4afd7848a0dbe1a1ebd235f13e
+PYTHON_M2R_SITE = https://files.pythonhosted.org/packages/94/65/fd40fbdc608298e760affb95869c3baed237dfe5649d62da1eaa1deca8f3
 PYTHON_M2R_SETUP_TYPE = setuptools
 PYTHON_M2R_LICENSE = MIT
 PYTHON_M2R_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
