Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B1CC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B549A403EA;
	Wed, 20 Dec 2023 20:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B549A403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7u29g8Imrip0; Wed, 20 Dec 2023 20:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C99940949;
	Wed, 20 Dec 2023 20:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C99940949
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2DE21BF365
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 842DF61558
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 842DF61558
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DRLs1-63SIiH for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:58:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7E3261048
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7E3261048
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A309387C94; Wed, 20 Dec 2023 20:58:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 21:54:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 088dd5fd3f81e929831d846f3afac035fbc079da
X-Git-Newrev: aa5ee701b11ddafb5565dc0d57a2e045cd68dc19
X-Patchwork-Hint: ignore
Message-Id: <20231220205825.A309387C94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyproject-metadata: new
 host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa5ee701b11ddafb5565dc0d57a2e045cd68dc19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-pyproject-metadata.hash                         |  5 +++++
 .../python-pyproject-metadata/python-pyproject-metadata.mk | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.hash b/package/python-pyproject-metadata/python-pyproject-metadata.hash
new file mode 100644
index 0000000000..51a3e4b85b
--- /dev/null
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyproject-metadata/json
+md5  ca5e9527cff96153a976e14530b53746  pyproject-metadata-0.7.1.tar.gz
+sha256  0a94f18b108b9b21f3a26a3d541f056c34edcb17dc872a144a15618fed7aef67  pyproject-metadata-0.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.mk b/package/python-pyproject-metadata/python-pyproject-metadata.mk
new file mode 100644
index 0000000000..6fac22abee
--- /dev/null
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyproject-metadata
+#
+################################################################################
+
+PYTHON_PYPROJECT_METADATA_VERSION = 0.7.1
+PYTHON_PYPROJECT_METADATA_SOURCE = pyproject-metadata-$(PYTHON_PYPROJECT_METADATA_VERSION).tar.gz
+PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/38/af/b0e6a9eba989870fd26e10889446d1bec2e6d5be0a1bae2dc4dcda9ce199
+PYTHON_PYPROJECT_METADATA_SETUP_TYPE = setuptools
+PYTHON_PYPROJECT_METADATA_LICENSE = MIT
+PYTHON_PYPROJECT_METADATA_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
