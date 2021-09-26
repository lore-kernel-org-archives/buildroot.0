Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D52C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:02:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD67660F24
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD67660F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99BBC40314;
	Sun, 26 Sep 2021 21:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o6uVmkaY8bAC; Sun, 26 Sep 2021 21:02:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07AD840312;
	Sun, 26 Sep 2021 21:02:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A76A1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60EF740300
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EF4MtDaH0YC for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E95240305
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A77CF8D2AF; Sun, 26 Sep 2021 20:57:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 22:16:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85fb0f304fe816ad389a90a925950cbe629d5745
X-Git-Newrev: b1e1b56e6fad837c59828247c62e23529440381d
X-Patchwork-Hint: ignore
Message-Id: <20210926205756.A77CF8D2AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cbor2: bump to version 5.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1e1b56e6fad837c59828247c62e23529440381d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index cacaf7b76c..879463c2ce 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  0b4ac06208304fd8251e50d55a7692ca  cbor2-5.4.0.tar.gz
-sha256  a7926f7244b08c413f1a4fa71a81aa256771c75bdf1a4fd77308547a2d63dd48  cbor2-5.4.0.tar.gz
+md5  87b3ad8a9dd8875fa46c6ec06e3fb0ba  cbor2-5.4.1.tar.gz
+sha256  a8bf432f6cb595f50aeb8fed2a4aa3b3f7caa7f135fb57e4378eaa39242feac9  cbor2-5.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 325f20faf7..af42d0344a 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.4.0
+PYTHON_CBOR2_VERSION = 5.4.1
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/dd/cf/154810bb8698a583fd30faec5a34d84d8a01cc700e34c1e41b90616d7d63
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/9e/25/9dd432c051010faea6a702cb85d0b53dc9d5414513866b6a73b3ac954092
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
