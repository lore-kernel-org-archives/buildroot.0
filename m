Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073B4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:39:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C52F060F9D
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C52F060F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BD794011F;
	Tue, 26 Oct 2021 19:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1qZGKvLCKRx; Tue, 26 Oct 2021 19:39:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FB7940130;
	Tue, 26 Oct 2021 19:39:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 271B31BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E678640548
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KpYZyEprH-2p for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 343AD40555
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 53EE788F04; Tue, 26 Oct 2021 19:34:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:34:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0cdbe8b70152d498973d97b37b3418e933b27b6e
X-Git-Newrev: 169995a9206146d233515917934c076fc68ab7cd
X-Patchwork-Hint: ignore
Message-Id: <20211026193445.53EE788F04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python{3}-pycryptodomex: bump to
 version 3.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=169995a9206146d233515917934c076fc68ab7cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 package/python3-pycryptodomex/python3-pycryptodomex.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 0dd2a7c08d..544468b37e 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  91b86ca7fa80d41179d7735067c7347a  pycryptodomex-3.10.1.tar.gz
-sha256  541cd3e3e252fb19a7b48f420b798b53483302b7fe4d9954c947605d0a263d62  pycryptodomex-3.10.1.tar.gz
+md5  3d007103f68f7e902167719655d2b57a  pycryptodomex-3.11.0.tar.gz
+sha256  0398366656bb55ebdb1d1d493a7175fc48ade449283086db254ac44c7d318d6d  pycryptodomex-3.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c273fb45d120362875aafdd6189f4d7c70f6c36d4cb7ce427e0dc704753639df  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index fc2dca4da9..f1fda7aea2 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-pycryptodomex/python3-pycryptodomex.mk
-PYTHON_PYCRYPTODOMEX_VERSION = 3.10.1
+PYTHON_PYCRYPTODOMEX_VERSION = 3.11.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/82/e2/a0f9f5452a59bafaa3420585f22b58a8566c4717a88c139af2276bb5695d
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/47/14/dd9ad29cd29ea4cc521286f2cb401ca7ac6fd5db0791c5e9bacaf2c9ac78
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.mk b/package/python3-pycryptodomex/python3-pycryptodomex.mk
index 76ad74b43f..ee03a08ec6 100644
--- a/package/python3-pycryptodomex/python3-pycryptodomex.mk
+++ b/package/python3-pycryptodomex/python3-pycryptodomex.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-pycryptodomex/python-pycryptodomex.mk
-PYTHON3_PYCRYPTODOMEX_VERSION = 3.10.1
+PYTHON3_PYCRYPTODOMEX_VERSION = 3.11.0
 PYTHON3_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON3_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/82/e2/a0f9f5452a59bafaa3420585f22b58a8566c4717a88c139af2276bb5695d
+PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/47/14/dd9ad29cd29ea4cc521286f2cb401ca7ac6fd5db0791c5e9bacaf2c9ac78
 PYTHON3_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON3_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
