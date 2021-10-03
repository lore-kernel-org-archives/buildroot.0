Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538C5C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:25:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D3A561B3E
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D3A561B3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBB754263F;
	Sun,  3 Oct 2021 08:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urh5k8nDeTNL; Sun,  3 Oct 2021 08:25:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CBBF426D1;
	Sun,  3 Oct 2021 08:25:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF2671BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7718404EC
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3M6uPFBH4Pka for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0C474019B
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2AC088DB44; Sun,  3 Oct 2021 08:20:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 10:22:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 501a333b28f2f66603873b3aee66e147c6de634b
X-Git-Newrev: 09ef0bd75f69445e3aa78adec7813f5a9afc35b5
X-Patchwork-Hint: ignore
Message-Id: <20211003082055.2AC088DB44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-semver: bump to version
 2.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=09ef0bd75f69445e3aa78adec7813f5a9afc35b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And update URL in Config.in.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-semver/Config.in          | 2 +-
 package/python-semver/python-semver.hash | 4 ++--
 package/python-semver/python-semver.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-semver/Config.in b/package/python-semver/Config.in
index c66231a730..4af2bbf449 100644
--- a/package/python-semver/Config.in
+++ b/package/python-semver/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_SEMVER
 	help
 	  Python helper for Semantic Versioning (http://semver.org/).
 
-	  https://github.com/k-bx/python-semver
+	  https://github.com/python-semver/python-semver
diff --git a/package/python-semver/python-semver.hash b/package/python-semver/python-semver.hash
index 5c13764e57..10cb0a8464 100644
--- a/package/python-semver/python-semver.hash
+++ b/package/python-semver/python-semver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/semver/json
-md5  3e11ae9782121e8ffe9f8a8b763a8cb5  semver-2.10.2.tar.gz
-sha256  c0a4a9d1e45557297a722ee9bac3de2ec2ea79016b6ffcaca609b0bc62cf4276  semver-2.10.2.tar.gz
+md5  e98b5fb283ea84daa5195087de83ebf1  semver-2.13.0.tar.gz
+sha256  fa0fe2722ee1c3f57eac478820c3a5ae2f624af8264cbdf9000c980ff7f75e3f  semver-2.13.0.tar.gz
 # Locally computed
 sha256  cda490c32e61d3884dc17791fc8078f2a3e564fba98dd18b4dc64eb2720b2b6f  LICENSE.txt
diff --git a/package/python-semver/python-semver.mk b/package/python-semver/python-semver.mk
index 32ed6b971f..d3a905754f 100644
--- a/package/python-semver/python-semver.mk
+++ b/package/python-semver/python-semver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SEMVER_VERSION = 2.10.2
+PYTHON_SEMVER_VERSION = 2.13.0
 PYTHON_SEMVER_SOURCE = semver-$(PYTHON_SEMVER_VERSION).tar.gz
-PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/aa/e8/cb894f70a52887f001aff5f264f68272c21fa58268495aca17df396c161f
+PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/31/a9/b61190916030ee9af83de342e101f192bbb436c59be20a4cb0cdb7256ece
 PYTHON_SEMVER_SETUP_TYPE = setuptools
 PYTHON_SEMVER_LICENSE = BSD-3-Clause
 PYTHON_SEMVER_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
