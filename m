Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FB2C433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 18:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 067E1415A1;
	Fri, 21 Oct 2022 18:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 067E1415A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pjcU92bdeIuC; Fri, 21 Oct 2022 18:52:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22A63415A5;
	Fri, 21 Oct 2022 18:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22A63415A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DDA91BF9CB
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 18:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 394948441E
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 18:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 394948441E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVaMI1DJ92zS for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 18:52:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6821584360
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 18:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6821584360
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56E5A86F49; Fri, 21 Oct 2022 18:52:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 21 Oct 2022 20:48:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aee1cc302f6da050b198ea63a7c78e62579aed97
X-Git-Newrev: 9454960cd11ca728ab148551064b32f45aa54d9f
X-Patchwork-Hint: ignore
Message-Id: <20221021185221.56E5A86F49@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-esptool: bump version to 4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9454960cd11ca728ab148551064b32f45aa54d9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index 4f19fbde41..7e523a7027 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  60bf3a49a794ff5627552f642f28ea3d  esptool-4.1.tar.gz
-sha256  51a41655187780cb802a5827fab68a3db0d6206330560459c55fcf0e222f277f  esptool-4.1.tar.gz
+md5  973b63eac1391d3491846d8676c783e7  esptool-4.3.tar.gz
+sha256  03d00312eef258baf83faefd0b912b2251dd0440242da9dcb1b18fe75ed614c3  esptool-4.3.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index 51bc563c5c..3f33fd7865 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 4.1
+PYTHON_ESPTOOL_VERSION = 4.3
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/bb/d5/9d000803520b68fd9f6447cd7c15352a79984196f57f0519839b0f80fb8f
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/5b/d7/0dae311a94a490d7b7af2f4fab079b34f6244c6129017997bc994f7b360b
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
