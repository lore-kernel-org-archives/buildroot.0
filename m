Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3D3C4708C
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE84740523;
	Mon,  5 Dec 2022 11:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE84740523
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id boinTwQ2yFZC; Mon,  5 Dec 2022 11:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF587404FE;
	Mon,  5 Dec 2022 11:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF587404FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 878C61BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E8444167F
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E8444167F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hETT2abHv71a for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B70D415D6
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B70D415D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27EAE85BA3; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:08:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f5fe64ab9208f68043acc3b6e687de21d8be614
X-Git-Newrev: e83212051cc8b79171a50a5bf965f8a2a32ec6f7
X-Patchwork-Hint: ignore
Message-Id: <20221205112607.27EAE85BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wrapt: bump to version
 1.14.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e83212051cc8b79171a50a5bf965f8a2a32ec6f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from distutils to setuptools build backend.

License hash changed due to year update:
https://github.com/GrahamDumpleton/wrapt/commit/240fea86df0357f3642db040f912031e4ecdfcb1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-wrapt/python-wrapt.hash | 6 +++---
 package/python-wrapt/python-wrapt.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index 63dae991eb..cb62e19aa7 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5  6d56ed0de4336462a73350341462f45e  wrapt-1.12.1.tar.gz
-sha256  b62ffa81fb85f4332a4f609cab4ac40709470da05643a082ec1eb88e6d9b97d7  wrapt-1.12.1.tar.gz
+md5  6e7340264f038efdefcba707250c91c2  wrapt-1.14.1.tar.gz
+sha256  380a85cf89e0e69b7cfbe2ea9f765f004ff419f34194018a6827ac0e3edfed4d  wrapt-1.14.1.tar.gz
 # Locally computed sha256 checksums
-sha256  e37c13f84fb3c9a54161b0fcf75f4d302fb86ce42cd6106147bda79e4197d9f2  LICENSE
+sha256  77d2a9159cffe12473f539a71a3e741f35117e61bfd005ebd60c3a1778e2c1f1  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index 32d8a24c14..406f6c3aa1 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 1.12.1
+PYTHON_WRAPT_VERSION = 1.14.1
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/82/f7/e43cefbe88c5fd371f4cf0cf5eb3feccd07515af9fd6cf7dbf1d1793a797
-PYTHON_WRAPT_SETUP_TYPE = distutils
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/11/eb/e06e77394d6cf09977d92bff310cb0392930c08a338f99af6066a5a98f92
+PYTHON_WRAPT_SETUP_TYPE = setuptools
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
