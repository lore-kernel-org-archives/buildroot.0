Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D35EC43334
	for <buildroot@archiver.kernel.org>; Sat,  2 Jul 2022 13:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EF5641592;
	Sat,  2 Jul 2022 13:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EF5641592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fojlo2JTiD_D; Sat,  2 Jul 2022 13:54:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50F2341549;
	Sat,  2 Jul 2022 13:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50F2341549
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 591691BF5A1
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00AA040129
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00AA040129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rph57T9PDtkr for <buildroot@lists.busybox.net>;
 Sat,  2 Jul 2022 13:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33CA540390
 for <buildroot@buildroot.org>; Sat,  2 Jul 2022 13:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33CA540390
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2511B87875; Sat,  2 Jul 2022 13:39:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 2 Jul 2022 15:48:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b022b1081e3867477b8dc774913f3f35624c90f
X-Git-Newrev: 06ac43e7cc06133e9014882d7cef3040b1c818c1
X-Patchwork-Hint: ignore
Message-Id: <20220702133939.2511B87875@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycryptodomex: bump to
 version 3.15.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=06ac43e7cc06133e9014882d7cef3040b1c818c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index bb257499af..97c5e79024 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  55f8c1121335891c7e972b73c15369ac  pycryptodomex-3.14.1.tar.gz
-sha256  2ce76ed0081fd6ac8c74edc75b9d14eca2064173af79843c24fa62573263c1f2  pycryptodomex-3.14.1.tar.gz
+md5  683580f8f464348397a41ebabb5511a9  pycryptodomex-3.15.0.tar.gz
+sha256  7341f1bb2dadb0d1a0047f34c3a58208a92423cdbd3244d998e4b28df5eac0ed  pycryptodomex-3.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 067516fc84..8f22bf3ef2 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.14.1
+PYTHON_PYCRYPTODOMEX_VERSION = 3.15.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/24/40/e249ac3845a2333ce50f1bb02299ffb766babdfe80ca9d31e0158ad06afd
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/52/0d/6cc95a83f6961a1ca041798d222240890af79b381e97eda3b9b538dba16f
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
