Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EC9C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FEAF84974;
	Sun, 15 Sep 2024 21:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXgBgrezvNee; Sun, 15 Sep 2024 21:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60A6E84971
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60A6E84971;
	Sun, 15 Sep 2024 21:42:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BE591BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 731C2608AB
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lx5FiBzhA0rQ for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30F4960893
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30F4960893
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DFEC7FB7E; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 11:59:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0208f26946ca9a1d3692add6d8446b63a450569b
X-Git-Newrev: a1b174ab327ddfa950670ca0a7e972e5e9257302
X-Patchwork-Hint: ignore
Message-Id: <20240915213641.2DFEC7FB7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-collections: bump to
 version 5.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1b174ab327ddfa950670ca0a7e972e5e9257302
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jaraco-collections/python-jaraco-collections.hash | 4 ++--
 package/python-jaraco-collections/python-jaraco-collections.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-jaraco-collections/python-jaraco-collections.hash b/package/python-jaraco-collections/python-jaraco-collections.hash
index 0308d48641..d3d6742f0b 100644
--- a/package/python-jaraco-collections/python-jaraco-collections.hash
+++ b/package/python-jaraco-collections/python-jaraco-collections.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.collections/json
-md5  2b12f44216432f1ce2ead377fd7a2b93  jaraco.collections-5.0.0.tar.gz
-sha256  1680e8d09f295f625c7ba926880175a26fdbe7092b4c76d198e30476b21cfe68  jaraco.collections-5.0.0.tar.gz
+md5  33a136eb3dd4c36090270ea2d4d43e7c  jaraco_collections-5.1.0.tar.gz
+sha256  0e4829409d39ad18a40aa6754fee2767f4d9730c4ba66dc9df89f1d2756994c2  jaraco_collections-5.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-collections/python-jaraco-collections.mk b/package/python-jaraco-collections/python-jaraco-collections.mk
index 1400e286ee..3414799f44 100644
--- a/package/python-jaraco-collections/python-jaraco-collections.mk
+++ b/package/python-jaraco-collections/python-jaraco-collections.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_COLLECTIONS_VERSION = 5.0.0
-PYTHON_JARACO_COLLECTIONS_SOURCE = jaraco.collections-$(PYTHON_JARACO_COLLECTIONS_VERSION).tar.gz
-PYTHON_JARACO_COLLECTIONS_SITE = https://files.pythonhosted.org/packages/e6/85/9c4ab9772bcc2c9b4beffd56aca70f646e4a1f3a576579fa401d742b46a8
+PYTHON_JARACO_COLLECTIONS_VERSION = 5.1.0
+PYTHON_JARACO_COLLECTIONS_SOURCE = jaraco_collections-$(PYTHON_JARACO_COLLECTIONS_VERSION).tar.gz
+PYTHON_JARACO_COLLECTIONS_SITE = https://files.pythonhosted.org/packages/8c/ed/3f0ef2bcf765b5a3d58ecad8d825874a3af1e792fa89f89ad79f090a4ccc
 PYTHON_JARACO_COLLECTIONS_SETUP_TYPE = setuptools
 PYTHON_JARACO_COLLECTIONS_LICENSE = MIT
 PYTHON_JARACO_COLLECTIONS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
