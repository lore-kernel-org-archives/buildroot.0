Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D1BC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FB2F41868;
	Mon,  4 Dec 2023 20:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FB2F41868
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ntBz8-JSxKh; Mon,  4 Dec 2023 20:18:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43E9B417AF;
	Mon,  4 Dec 2023 20:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43E9B417AF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18ACC1BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 696B74176C
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 696B74176C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4wPYPKCUSH4C for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71F0641728
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71F0641728
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EC3A879B6; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 12:25:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7748d228e66c70d570acea07e4ff749ec3146279
X-Git-Newrev: 778fddf9e2020bce64df78c7f86edcd4b62e80cb
X-Patchwork-Hint: ignore
Message-Id: <20231204201328.6EC3A879B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-psutil: bump to version
 5.9.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=778fddf9e2020bce64df78c7f86edcd4b62e80cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to quote removal:
https://github.com/giampaolo/psutil/commit/bea3cf2d16899251b4b5f6b2609db9881645ea2d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-psutil/python-psutil.hash | 6 +++---
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 15927562b1..f388118663 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5  f72751d05b781757b7cd9bc375d2e351  psutil-5.9.4.tar.gz
-sha256  3d7f9739eb435d4b1338944abe23f49584bde5395f27487d2ee25ad9a8774a62  psutil-5.9.4.tar.gz
+md5  eec35090e7474e471a12f0dd16c981f9  psutil-5.9.6.tar.gz
+sha256  e4b92ddcd7dd4cdd3f900180ea1e104932c7bce234fb88976e2a3b296441225a  psutil-5.9.6.tar.gz
 # Locally computed sha256 checksums
-sha256  24c12984500caa07ffdce19eebc06396c5e6d244b573bc6c438f4a6ef8e56c1b  LICENSE
+sha256  b89c063b3786e28e0c0a38f1931db61fed35e69dd2a2966fbecffee0f46c8d10  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index e764d1accc..ece1039a51 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.9.4
+PYTHON_PSUTIL_VERSION = 5.9.6
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/3d/7d/d05864a69e452f003c0d77e728e155a89a2a26b09e64860ddd70ad64fb26
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/2d/01/beb7331fc6c8d1c49dd051e3611379bfe379e915c808e1301506027fce9d
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
