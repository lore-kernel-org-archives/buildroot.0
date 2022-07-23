Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA18FC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BEC484C0B;
	Sat, 23 Jul 2022 17:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BEC484C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uRfdmje9uw_U; Sat, 23 Jul 2022 17:00:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DE0584C08;
	Sat, 23 Jul 2022 17:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DE0584C08
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25C141BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A71484BEF
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A71484BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FR1CQAbLWrzb for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:57:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDDAB84BFF
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDDAB84BFF
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C02CC847EF; Sat, 23 Jul 2022 16:44:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 18:57:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 002f0e927d857e51595cedf3d2a44613b4f7e5f1
X-Git-Newrev: e49122a58d8c6cbf61fb9c1fc16be7a3fa712d09
X-Patchwork-Hint: ignore
Message-Id: <20220723164412.C02CC847EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-botocore: bump to version
 1.27.8
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
Content-Type: multipart/mixed; boundary="===============4622183499382217394=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4622183499382217394==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e49122a58d8c6cbf61fb9c1fc16be7a3fa712d09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-botocore/python-botocore.hash | 2 +-
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 9d5f706fef..bb806fe251 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,4 +1,4 @@
 # sha256 from https://pypi.org/pypi/botocore/json
-sha256  011360e79a4b843aa6591573cfa61e8eddc99b91adab1dfdb9a2b7f2c8511193  botocore-1.22.2.tar.gz
+sha256  db6667b8dfd175d16187653942cd91dd1f0cf36adc0ea9d7a0805ba4d2a3321f  botocore-1.27.8.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 1628e05562..459eefeab1 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.22.2
+PYTHON_BOTOCORE_VERSION = 1.27.8
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/0d/95/f2e74e4a91994d9ebe45746f75a8c5cafd723a88270a9772d8d66e1a8ba1
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/d1/b0/ea92703bbbf82353d571636fe6697b162c3881576986d6474119d03fce53
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt

--===============4622183499382217394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4622183499382217394==--
