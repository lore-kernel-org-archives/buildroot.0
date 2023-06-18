Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8805AEB64D8
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B1FD6070A;
	Sun, 18 Jun 2023 13:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B1FD6070A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZaTOuN9uHRf9; Sun, 18 Jun 2023 13:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D1B06103A;
	Sun, 18 Jun 2023 13:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D1B06103A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 420081BF86C
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14CD761095
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14CD761095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DSatRDg2RwVn for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:08:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BEC960FB1
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BEC960FB1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0970983D1E; Sun, 18 Jun 2023 13:08:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 15:04:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 795f4ffbd9c30fd70eea5601832a79ec1c90ae86
X-Git-Newrev: 7c46dd628e708e249253f123bf465e5c60f9b51a
X-Patchwork-Hint: ignore
Message-Id: <20230618130843.0970983D1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-txaio: bump to version
 23.1.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7c46dd628e708e249253f123bf465e5c60f9b51a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License has changed due to company name update:
https://github.com/crossbario/txaio/commit/91dace6ad1ddef3741d8c4db70d0e8728db046f0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-txaio/python-txaio.hash | 6 +++---
 package/python-txaio/python-txaio.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index f06c14b21f..d561cec635 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txaio/json
-md5  9b692af4c4fce73cadd36374c138936b  txaio-22.2.1.tar.gz
-sha256  2e4582b70f04b2345908254684a984206c0d9b50e3074a24a4c55aba21d24d01  txaio-22.2.1.tar.gz
+md5  297409f2dff8e71bad24467374aa8775  txaio-23.1.1.tar.gz
+sha256  f9a9216e976e5e3246dfd112ad7ad55ca915606b60b84a757ac769bd404ff704  txaio-23.1.1.tar.gz
 # Locally computed sha256 checksums
-sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
+sha256  ab1dd7a42dbdae302346c5a4571f2149691cc1ec06836232bf4923527e3fe41c  LICENSE
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index 1a8a888963..585b3a5f57 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 22.2.1
+PYTHON_TXAIO_VERSION = 23.1.1
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/6d/4b/28313388dfb2bdedb71b35b900459c56ba08ccb7ad2885487df037808c06
+PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/51/91/bc9fd5aa84703f874dea27313b11fde505d343f3ef3ad702bddbe20bfd6e
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
 PYTHON_TXAIO_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
