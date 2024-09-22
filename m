Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D29DCF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 16:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08C8F60720;
	Sun, 22 Sep 2024 16:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZE2Wc_mP9Vf; Sun, 22 Sep 2024 16:23:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4F3460764
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4F3460764;
	Sun, 22 Sep 2024 16:23:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD5571BF870
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D91D340607
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSGobDamC3CQ for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 16:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6600405F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6600405F0
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 16:23:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B117884297; Sun, 22 Sep 2024 16:23:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 18:04:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: afe6c55f1931c4fcaf6d280a49019d0f7d184418
X-Git-Newrev: ebf881362c9974623be769cd03ef6108db410c74
X-Patchwork-Hint: ignore
Message-Id: <20240922162313.B117884297@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-api-core: bump to
 version 2.20.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebf881362c9974623be769cd03ef6108db410c74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 7a52c94417..966a9b3a14 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  39052bc872e39093248cc1841b0037ca  google_api_core-2.19.2.tar.gz
-sha256  ca07de7e8aa1c98a8bfca9321890ad2340ef7f2eb136e558cee68f24b94b0a8f  google_api_core-2.19.2.tar.gz
+md5  72fec88a65cd809c31c35f4284a72274  google_api_core-2.20.0.tar.gz
+sha256  f74dff1889ba291a4b76c5079df0711810e2d9da81abfdc99957bc961c1eb28f  google_api_core-2.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index b2bf049624..18669a71e4 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.19.2
+PYTHON_GOOGLE_API_CORE_VERSION = 2.20.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/78/14/99c2514b3ccc5aad1e0776f0ae8295c9f7153aead4f41d07dd126cecdc14
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/c8/5c/31c1742a53b79c8a0c4757b5fae2e8ab9c519cbd7b98c587d4294e1d2d16
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
