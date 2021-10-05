Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD414C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:38:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76A3361371
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76A3361371
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E4A1403C6;
	Tue,  5 Oct 2021 19:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lsGNkeA9I0VF; Tue,  5 Oct 2021 19:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE724403D8;
	Tue,  5 Oct 2021 19:38:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10BEC1BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50E1E60C03
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNW6aWaDTWIK for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9EBE607A3
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AB8FE91216; Tue,  5 Oct 2021 19:34:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 21:31:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e9c10daa147196ea946c73c0beddfd681706cbb
X-Git-Newrev: 9b47792fcfa10500e062b676aff3ba97ae33dd2a
X-Patchwork-Hint: ignore
Message-Id: <20211005193450.AB8FE91216@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aenum: bump to version 3.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b47792fcfa10500e062b676aff3ba97ae33dd2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plus, indent with two spaces on the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-aenum/python-aenum.hash | 9 +++++----
 package/python-aenum/python-aenum.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-aenum/python-aenum.hash b/package/python-aenum/python-aenum.hash
index 16ee23aba5..d10254f9b1 100644
--- a/package/python-aenum/python-aenum.hash
+++ b/package/python-aenum/python-aenum.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/aenum/json
-sha256	a4334cabf47c167d44ab5a6198837b80deec5d5bad1b5cf70c966c3a330260e8  aenum-2.2.3.tar.gz
-# locally calculated
-sha256	0db837e38002017b352666c83c8d3216ee5b9b2229375eb2cf4487f8c24e1f8c  aenum/LICENSE
+# md5, sha256 from https://pypi.org/pypi/aenum/json
+md5  6f30144abd4d156f22f8a49d81c496df  aenum-3.1.0.tar.gz
+sha256  87f0e9ef4f828578ab06af30e4d7944043bf4ecd3f4b7bd1cbe37e2173cde94a  aenum-3.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256  0db837e38002017b352666c83c8d3216ee5b9b2229375eb2cf4487f8c24e1f8c  aenum/LICENSE
diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
index 97fcbb5e86..98695d99ce 100644
--- a/package/python-aenum/python-aenum.mk
+++ b/package/python-aenum/python-aenum.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AENUM_VERSION = 2.2.3
+PYTHON_AENUM_VERSION = 3.1.0
 PYTHON_AENUM_SOURCE = aenum-$(PYTHON_AENUM_VERSION).tar.gz
-PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/6f/6a/8ed729e0add885d7a559ebb06133029b1f8c4bd66cbf1bdee1ec969fb310
+PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/ae/25/00b2949186e76a4c9732e33221274964fecf5c88178cbe5a14a80cfc04e8
 PYTHON_AENUM_SETUP_TYPE = setuptools
 PYTHON_AENUM_LICENSE = BSD-3-Clause
 PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
