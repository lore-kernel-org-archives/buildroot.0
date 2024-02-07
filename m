Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748D5C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3176E4096D;
	Wed,  7 Feb 2024 19:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UVKBYLCyyIKa; Wed,  7 Feb 2024 19:52:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 421E5410CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 421E5410CA;
	Wed,  7 Feb 2024 19:52:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DA7F1BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B42D83C98
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:52:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wu2YNJU_0A5O for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:52:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E15083B9B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E15083B9B
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:52:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57729876D6; Wed,  7 Feb 2024 19:52:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 20:50:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f44c0807c63f0bdd9640b7b29c131590f03be0ca
X-Git-Newrev: ae5274dd545eb011f18cae24331300d944b8be0f
X-Patchwork-Hint: ignore
Message-Id: <20240207195229.57729876D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiocoap: bump to version
 0.4.7
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ae5274dd545eb011f18cae24331300d944b8be0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file moved:
https://github.com/chrysn/aiocoap/commit/8f2e96d76bcf1f6f8d7b8065b5c5865afa50d20f
https://github.com/chrysn/aiocoap/commit/065945fb7f34db33f641199aceb527527c1a3431

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiocoap/python-aiocoap.hash | 6 +++---
 package/python-aiocoap/python-aiocoap.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
index ab50ff0958..c9d73cda26 100644
--- a/package/python-aiocoap/python-aiocoap.hash
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiocoap/json
-md5  03ca0411b7401bfd6e9bdaefe09bd88a  aiocoap-0.4.5.tar.gz
-sha256  906c927822185c8acf04fdcc1dd98fd845f31dabf5d5e395c39137dcbd6ba1e3  aiocoap-0.4.5.tar.gz
+md5  baebbc38bc8db31472c438521f7121e3  aiocoap-0.4.7.tar.gz
+sha256  90f3bcaffd454f5421d3ad55ddbe3fe10a686d4b9f3c4445d427b130493a96a4  aiocoap-0.4.7.tar.gz
 # Locally computed sha256 checksums
-sha256  2bb211d412a6bfa4b2a9cf01123c7fe90e5e6185938896e23ab07b84f8494180  LICENSE
+sha256  0ad39132b3529369998eb7493b950dc7452b07ba9d8cca7619766b6c6d8270fa  doc/LICENSE.rst
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index 92f47b7a4f..73a0d61eba 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_AIOCOAP_VERSION = 0.4.5
+PYTHON_AIOCOAP_VERSION = 0.4.7
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/65/63/9051af6a2fc498f50b71f23bdbde0cc1d1f0a69eb767776dbf6d1411e240
+PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/de/14/843232b56c0f09b2ceddae3da37598d9109c4b1d9383b1ab72232018e9e8
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
 PYTHON_AIOCOAP_LICENSE = MIT
-PYTHON_AIOCOAP_LICENSE_FILES = LICENSE
+PYTHON_AIOCOAP_LICENSE_FILES = doc/LICENSE.rst
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
