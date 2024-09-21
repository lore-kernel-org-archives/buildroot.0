Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF833CF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CFE260863;
	Sat, 21 Sep 2024 21:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKG7nRRMabS3; Sat, 21 Sep 2024 21:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9947D6086F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9947D6086F;
	Sat, 21 Sep 2024 21:09:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1137A1BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C18860656
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbmlMB77xpL6 for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F1CF6073C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F1CF6073C
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 158C18119A; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:53:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6fa72e99a4868db4a1a021345aeeaf2cba7ec24
X-Git-Newrev: 7ec68128d5b1faf501341735352183312568a276
X-Patchwork-Hint: ignore
Message-Id: <20240921210743.158C18119A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyproject-metadata: bump to
 version 0.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ec68128d5b1faf501341735352183312568a276
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pyproject-metadata/python-pyproject-metadata.hash | 4 ++--
 package/python-pyproject-metadata/python-pyproject-metadata.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.hash b/package/python-pyproject-metadata/python-pyproject-metadata.hash
index 51a3e4b85b..af5121c63c 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.hash
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproject-metadata/json
-md5  ca5e9527cff96153a976e14530b53746  pyproject-metadata-0.7.1.tar.gz
-sha256  0a94f18b108b9b21f3a26a3d541f056c34edcb17dc872a144a15618fed7aef67  pyproject-metadata-0.7.1.tar.gz
+md5  048ef3f91a5ba7c89a33894cb2c7725d  pyproject_metadata-0.8.0.tar.gz
+sha256  376d5a00764ac29440a54579f88e66b7d9cb7e629d35c35a1c7248bfebc9b455  pyproject_metadata-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.mk b/package/python-pyproject-metadata/python-pyproject-metadata.mk
index 6fac22abee..eaf31ff591 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.mk
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPROJECT_METADATA_VERSION = 0.7.1
-PYTHON_PYPROJECT_METADATA_SOURCE = pyproject-metadata-$(PYTHON_PYPROJECT_METADATA_VERSION).tar.gz
-PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/38/af/b0e6a9eba989870fd26e10889446d1bec2e6d5be0a1bae2dc4dcda9ce199
+PYTHON_PYPROJECT_METADATA_VERSION = 0.8.0
+PYTHON_PYPROJECT_METADATA_SOURCE = pyproject_metadata-$(PYTHON_PYPROJECT_METADATA_VERSION).tar.gz
+PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/cf/cc/428b057f8c229b7c374efe9d6a6a35e693f79e071e25846ab0c55e59d337
 PYTHON_PYPROJECT_METADATA_SETUP_TYPE = setuptools
 PYTHON_PYPROJECT_METADATA_LICENSE = MIT
 PYTHON_PYPROJECT_METADATA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
