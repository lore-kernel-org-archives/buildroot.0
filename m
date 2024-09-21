Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745CECF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B052608B1;
	Sat, 21 Sep 2024 21:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YyZGoW1j4LKJ; Sat, 21 Sep 2024 21:11:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A06F6F6FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A06F6F6FF;
	Sat, 21 Sep 2024 21:11:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 206831BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 924D7606F0
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpVcDMVyqmWV for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0846607E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0846607E8
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD0E18119A; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:53:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54dadeedc5d498065ef0170921463b11aed058d1
X-Git-Newrev: a17849708413e771430ffcd2ecfadb9b838d3db4
X-Patchwork-Hint: ignore
Message-Id: <20240921210743.AD0E18119A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ruamel-yaml: bump to
 version 0.18.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=a17849708413e771430ffcd2ecfadb9b838d3db4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to date update:
https://sourceforge.net/p/ruamel-yaml/code/ci/6f41eb6001661917fceb0e88ed0693ae1a7c50f4/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-ruamel-yaml/python-ruamel-yaml.hash | 6 +++---
 package/python-ruamel-yaml/python-ruamel-yaml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
index 02845d112b..94a0d43544 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ruamel.yaml/json
-md5  24fac3544a3c7bd7eeaf6e4f704a056e  ruamel.yaml-0.18.5.tar.gz
-sha256  61917e3a35a569c1133a8f772e1226961bf5a1198bea7e23f06a0841dea1ab0e  ruamel.yaml-0.18.5.tar.gz
+md5  964a8e48646e26533d8e5f03cff99dde  ruamel.yaml-0.18.6.tar.gz
+sha256  8b27e6a217e786c6fbe5634d8f3f11bc63e0f80f6a5890f28863d9c45aac311b  ruamel.yaml-0.18.6.tar.gz
 # Locally computed sha256 checksums
-sha256  ba45629abb7022949148ce65de4a59e7ee164d30c94450389a6afdd3ebe4e9e0  LICENSE
+sha256  e84ff196f03668af751abae0c4cbd9169aa365121f50c30bb9a329666ab6260a  LICENSE
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index bbdac591ca..83a4aa12e8 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_VERSION = 0.18.5
+PYTHON_RUAMEL_YAML_VERSION = 0.18.6
 PYTHON_RUAMEL_YAML_SOURCE = ruamel.yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/82/43/fa976e03a4a9ae406904489119cd7dd4509752ca692b2e0a19491ca1782c
+PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/29/81/4dfc17eb6ebb1aac314a3eb863c1325b907863a1b8b1382cdffcb6ac0ed9
 PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_LICENSE = MIT
 PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
