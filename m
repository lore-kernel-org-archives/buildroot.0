Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3627D33990
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A217160632;
	Mon, 28 Oct 2024 14:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YffBIeWgsf_p; Mon, 28 Oct 2024 14:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E07960646
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E07960646;
	Mon, 28 Oct 2024 14:41:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20D575C24
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9175A605B0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vD3aqjy6nUi for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 813A8605A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 813A8605A8
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BB638430E; Mon, 28 Oct 2024 14:40:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 14:47:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c39971d316155a76ad1495ecc4c19bee7b3f6b21
X-Git-Newrev: ccb4073736515a984408df27428e082db8b02bc6
X-Patchwork-Hint: ignore
Message-Id: <20241028144052.6BB638430E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ruamel-yaml-clib: bump to
 version 0.2.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=ccb4073736515a984408df27428e082db8b02bc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to formatting changes:
https://sourceforge.net/p/ruamel-yaml-clib/code/ci/9ff72c32e7be55987ee5fb4cd8803b54e28e8a3f/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash | 6 +++---
 package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
index 937afc3df1..2bb726819c 100644
--- a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
+++ b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ruamel.yaml.clib/json
-md5  b72e549363fa1b9c4f9123e98f2b46cc  ruamel.yaml.clib-0.2.8.tar.gz
-sha256  beb2e0404003de9a4cab9753a8805a8fe9320ee6673136ed7f04255fe60bb512  ruamel.yaml.clib-0.2.8.tar.gz
+md5  53fa5737bbe5a07fac7db3d1a083fee9  ruamel.yaml.clib-0.2.12.tar.gz
+sha256  6c8fbb13ec503f99a91901ab46e0b07ae7941cd527393187039aec586fdfd36f  ruamel.yaml.clib-0.2.12.tar.gz
 # Locally computed sha256 checksums
-sha256  5458f90e82366f660f956b3c929ba5f7a0efdb99a99a847e2f51f2020ffbe887  LICENSE
+sha256  99f72489621ceea1254f9f0ea7c6e8a5e8e38b62edd1d983e6e1cb20d533f0a6  LICENSE
diff --git a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
index 25c3b44131..2a4d8a98d1 100644
--- a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
+++ b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_CLIB_VERSION = 0.2.8
+PYTHON_RUAMEL_YAML_CLIB_VERSION = 0.2.12
 PYTHON_RUAMEL_YAML_CLIB_SOURCE = ruamel.yaml.clib-$(PYTHON_RUAMEL_YAML_CLIB_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_CLIB_SITE = https://files.pythonhosted.org/packages/46/ab/bab9eb1566cd16f060b54055dd39cf6a34bfa0240c53a7218c43e974295b
+PYTHON_RUAMEL_YAML_CLIB_SITE = https://files.pythonhosted.org/packages/20/84/80203abff8ea4993a87d823a5f632e4d92831ef75d404c9fc78d0176d2b5
 PYTHON_RUAMEL_YAML_CLIB_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_CLIB_LICENSE = MIT
 PYTHON_RUAMEL_YAML_CLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
