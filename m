Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F62CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45F51608A6;
	Sat, 21 Sep 2024 21:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPB6XhWZ_7E6; Sat, 21 Sep 2024 21:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A75A060B14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A75A060B14;
	Sat, 21 Sep 2024 21:09:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1014A1BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E672A60752
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBre7SMnjCpc for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED3D46077F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED3D46077F
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E885A84150; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:53:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7275aa0796481e57a9d9bdbc62f3c5c873c30a06
X-Git-Newrev: 1aef4507bb259542601723661edc7ad83301fe83
X-Patchwork-Hint: ignore
Message-Id: <20240921210742.E885A84150@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pypa-build: bump to version
 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=1aef4507bb259542601723661edc7ad83301fe83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pypa-build/python-pypa-build.hash | 4 ++--
 package/python-pypa-build/python-pypa-build.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
index a4e207e4e4..e4e6a8f181 100644
--- a/package/python-pypa-build/python-pypa-build.hash
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/build/json
-md5  9675d7b278f4533b9b75701e6e87390b  build-1.2.1.tar.gz
-sha256  526263f4870c26f26c433545579475377b2b7588b6f1eac76a001e873ae3e19d  build-1.2.1.tar.gz
+md5  f80cc64db8e7fd8f8403a5e8a0562d4d  build-1.2.2.tar.gz
+sha256  119b2fb462adef986483438377a13b2f42064a2a3a4161f24a0cca698a07ac8c  build-1.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index d8a23ddd8b..9404f08302 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPA_BUILD_VERSION = 1.2.1
+PYTHON_PYPA_BUILD_VERSION = 1.2.2
 PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
-PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/ce/9e/2d725d2f7729c6e79ca62aeb926492abbc06e25910dd30139d60a68bcb19
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/dd/bb/4a1b7e3a7520e310cf7bfece43788071604e1ccf693a7f0c4638c59068d6
 PYTHON_PYPA_BUILD_LICENSE = MIT
 PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = flit-bootstrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
