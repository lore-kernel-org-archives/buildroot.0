Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBF5C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 13:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16E2181776;
	Sun, 18 Dec 2022 13:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16E2181776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mn8K0x-zl_3b; Sun, 18 Dec 2022 13:54:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 525C681767;
	Sun, 18 Dec 2022 13:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 525C681767
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF3BA1BF5A7
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9EA3401F1
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9EA3401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98w34wNurRlx for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 13:53:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EED35400D3
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 13:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EED35400D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCF6A86892; Sun, 18 Dec 2022 13:53:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 14:51:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8332d747df3dab5fbd038a3adf3726cc6a165c12
X-Git-Newrev: 15f7b944df8be0f20e88f1d2b50534700030981e
X-Patchwork-Hint: ignore
Message-Id: <20221218135357.DCF6A86892@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiocoap: bump to version
 0.4.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=15f7b944df8be0f20e88f1d2b50534700030981e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-aiocoap/python-aiocoap.hash | 4 ++--
 package/python-aiocoap/python-aiocoap.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
index 176b3d22c7..ab50ff0958 100644
--- a/package/python-aiocoap/python-aiocoap.hash
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiocoap/json
-md5  218178420e8fc3581001f52eb726b016  aiocoap-0.4.4.tar.gz
-sha256  9d7c9626cbc4dc24a91c6b8694cbeb834e376ab7e20e4137609380f726a9540b  aiocoap-0.4.4.tar.gz
+md5  03ca0411b7401bfd6e9bdaefe09bd88a  aiocoap-0.4.5.tar.gz
+sha256  906c927822185c8acf04fdcc1dd98fd845f31dabf5d5e395c39137dcbd6ba1e3  aiocoap-0.4.5.tar.gz
 # Locally computed sha256 checksums
 sha256  2bb211d412a6bfa4b2a9cf01123c7fe90e5e6185938896e23ab07b84f8494180  LICENSE
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index 96d8619a84..92f47b7a4f 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCOAP_VERSION = 0.4.4
+PYTHON_AIOCOAP_VERSION = 0.4.5
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/6a/7c/139993da8dcdfc86446ee6df65b98c68e40c5fcb0caeff3a6b348d9f7d6f
+PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/65/63/9051af6a2fc498f50b71f23bdbde0cc1d1f0a69eb767776dbf6d1411e240
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
 PYTHON_AIOCOAP_LICENSE = MIT
 PYTHON_AIOCOAP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
