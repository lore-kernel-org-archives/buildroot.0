Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ACCC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED37381F0B;
	Thu,  3 Nov 2022 21:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED37381F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ian2tXJ_SA-7; Thu,  3 Nov 2022 21:14:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A71D81E88;
	Thu,  3 Nov 2022 21:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A71D81E88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 179511BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C22440C08
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C22440C08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UAluNSqM-bb8 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9ABD140C10
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ABD140C10
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A14C87BCE; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c114f2615a026eb0e4b6adf62469212104ca69ab
X-Git-Newrev: 0b7a6862449df74bcbf591fee71f8bedca1ff570
X-Patchwork-Hint: ignore
Message-Id: <20221103205513.8A14C87BCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pyicu: bump to
 version 2.10.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b7a6862449df74bcbf591fee71f8bedca1ff570
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to date update:
https://gitlab.pyicu.org/main/pyicu/-/commit/366090276963a90924d22420e2bd80a015fca332

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyicu/python-pyicu.hash | 10 +++++-----
 package/python-pyicu/python-pyicu.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index 8b113d4ab7..009b264336 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/PyICU/json
-md5  7656f5cc53a7c18b40e653d6eefdee14  PyICU-1.9.7.tar.gz
-# Locally computed
-sha256  db27cd1cc150b879c5465872bec7fdaf340eca140aa922be03891d5b9f855b61  PyICU-1.9.7.tar.gz
-sha256  74bbadee4ee3c3a1ac0ecfbd74bc7ce64046de1ceddf4717dc923809ca8ffce3  LICENSE
+# md5, sha256 from https://pypi.org/pypi/pyicu/json
+md5  4090ebb98702338cac3dbed2d72c2fd7  PyICU-2.10.2.tar.gz
+sha256  0c3309eea7fab6857507ace62403515b60fe096cbfb4f90d14f55ff75c5441c1  PyICU-2.10.2.tar.gz
+# Locally computed sha256 checksums
+sha256  00da5bf22f2386c4f6f07c734490e9b818c4dcf70e6ca49f594e9cec636b9c40  LICENSE
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index c6587c399c..512b2f857f 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYICU_VERSION = 1.9.7
+PYTHON_PYICU_VERSION = 2.10.2
 PYTHON_PYICU_SOURCE = PyICU-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://pypi.python.org/packages/6e/88/f42a1297909ca6d9113ba37b37067011ae29432fe592fdd98cf52ad23b77
+PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/64/00/a531e119a97e54601f616f5061879ec2d4bb058d225014f9acf94b2970c3
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
