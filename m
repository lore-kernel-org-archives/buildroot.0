Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3A4C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C279983F05;
	Tue,  7 Jun 2022 19:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-EZGqE053mh; Tue,  7 Jun 2022 19:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 280B883E84;
	Tue,  7 Jun 2022 19:35:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 974DF1BF475
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A76CA405D6
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BbtnXw3s2No8 for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 788D140B42
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6BB4A86E21; Tue,  7 Jun 2022 19:04:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jun 2022 23:10:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e82a1c49bce61143c963c72f4674c6ebcefca5ba
X-Git-Newrev: 9d97ca0a5ebccabc7b5e605ade4ccbcc19668ca1
X-Patchwork-Hint: ignore
Message-Id: <20220607190459.6BB4A86E21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aioblescan: bump to version
 0.2.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d97ca0a5ebccabc7b5e605ade4ccbcc19668ca1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aioblescan/python-aioblescan.hash | 4 ++--
 package/python-aioblescan/python-aioblescan.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioblescan/python-aioblescan.hash b/package/python-aioblescan/python-aioblescan.hash
index 2592aace33..9a40ca4560 100644
--- a/package/python-aioblescan/python-aioblescan.hash
+++ b/package/python-aioblescan/python-aioblescan.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioblescan/json
-md5  f59934c040a817192fcd3e713633cf20  aioblescan-0.2.8.tar.gz
-sha256  2b048f5fe6e85b18fe306bdb63307705f3d1139563d3187d751b8657065a5bd9  aioblescan-0.2.8.tar.gz
+md5  0601cf9335e5d89166a88f53597c79bf  aioblescan-0.2.13.tar.gz
+sha256  28632e32c8180ea4b792f4cf9b88968dd100f4d3cee0cf16d27c193cf954422a  aioblescan-0.2.13.tar.gz
 # Locally computed sha256 checksums
 sha256  c2066cd44079e0c706234001af18cb6ad4b62fc68d0d08d29fdc7319916647e0  LICENSE.txt
diff --git a/package/python-aioblescan/python-aioblescan.mk b/package/python-aioblescan/python-aioblescan.mk
index 8a9db927ac..f0e277d528 100644
--- a/package/python-aioblescan/python-aioblescan.mk
+++ b/package/python-aioblescan/python-aioblescan.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOBLESCAN_VERSION = 0.2.8
+PYTHON_AIOBLESCAN_VERSION = 0.2.13
 PYTHON_AIOBLESCAN_SOURCE = aioblescan-$(PYTHON_AIOBLESCAN_VERSION).tar.gz
-PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/d2/10/b8b496903f33935c99f3602200d44ccc0b0a57b87e5fa65b89466c1b1f31
+PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/bd/04/c6798c76704d57da22f19c2e47485821d4b23144ef75f9c0e18dbfe47565
 PYTHON_AIOBLESCAN_SETUP_TYPE = setuptools
 PYTHON_AIOBLESCAN_LICENSE = MIT
 PYTHON_AIOBLESCAN_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
