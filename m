Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693F9CF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D54D403AE;
	Sun, 13 Oct 2024 10:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ox2UW4WrNzHb; Sun, 13 Oct 2024 10:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F96A40990
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F96A40990;
	Sun, 13 Oct 2024 10:46:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24FE31BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FDBA607F3
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJvbQ6mfHOTG for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:46:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAAF4607C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAAF4607C9
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:46:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A142B85D10; Sun, 13 Oct 2024 10:46:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 12:40:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb1173a4400a753c010814b760d6b59598ca75bc
X-Git-Newrev: 2c751df554f14b276c8c3eb43b691f41f15ba41a
X-Patchwork-Hint: ignore
Message-Id: <20241013104624.A142B85D10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bitarray: bump to version
 2.9.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c751df554f14b276c8c3eb43b691f41f15ba41a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bitarray/python-bitarray.hash | 4 ++--
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index d91a28af20..d5141ec728 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  024324a82314e9e68ecdcdefdc69071f  bitarray-2.9.2.tar.gz
-sha256  a8f286a51a32323715d77755ed959f94bef13972e9a2fe71b609e40e6d27957e  bitarray-2.9.2.tar.gz
+md5  476b9153ce4842182a5fed2ee0f83280  bitarray-2.9.3.tar.gz
+sha256  9eff55cf189b0c37ba97156a00d640eb7392db58a8049be6f26ff2712b93fa89  bitarray-2.9.3.tar.gz
 # Locally computed sha256 checksums
 sha256  6b5e04f6e0462e1b97be833f9d65e66cd5eceb3283f4a6f532261087d0ab1233  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index f86320c112..a15de6774c 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 2.9.2
+PYTHON_BITARRAY_VERSION = 2.9.3
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/c7/bf/25cf92a83e1fe4948d7935ae3c02f4c9ff9cb9c13e977fba8af11a5f642c
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/0d/c7/a85f206e6b2fddb93964efe53685ad8da7d856e6975b005ed6a88f25b010
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
