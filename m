Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FF3C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7693660AC0;
	Mon, 16 Sep 2024 10:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVsE-55QxtXV; Mon, 16 Sep 2024 10:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DFCA60B01
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DFCA60B01;
	Mon, 16 Sep 2024 10:02:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DFAB1BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 615B5403D1
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRFj1-70DKy6 for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D20A403E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D20A403E3
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:01:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEAD08377A; Mon, 16 Sep 2024 10:01:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 11:54:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 032b33d4fa33e03d752835a9d04532306b3710f0
X-Git-Newrev: d86debb6b0dcf2459c5b07e7f6a4988e8539c6b4
X-Patchwork-Hint: ignore
Message-Id: <20240916100146.BEAD08377A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mako: bump to version 1.3.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=d86debb6b0dcf2459c5b07e7f6a4988e8539c6b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/sqlalchemy/mako/commit/d115670e5ad1c7a7405924f6db5c02af0f8e0c59

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-mako/python-mako.hash | 6 +++---
 package/python-mako/python-mako.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index 03651cf956..07caaf8f75 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5  90da23903468efe9aa88dc88081579ff  Mako-1.3.0.tar.gz
-sha256  e3a9d388fd00e87043edbe8792f45880ac0114e9c4adc69f6e9bfb2c55e3b11b  Mako-1.3.0.tar.gz
+md5  0cf9ef37c1f8ffd453ef2b2a3a5573b3  Mako-1.3.5.tar.gz
+sha256  48dbc20568c1d276a2698b36d968fa76161bf127194907ea6fc594fa81f943bc  Mako-1.3.5.tar.gz
 # Locally computed sha256 checksums
-sha256  0a326e448dd22f220dd30796677ddbdf3ddaa6427a9744fea9deaa51d9d74fd9  LICENSE
+sha256  15627b36b38d0729cdd686df9abf606503d99d624b2f5ec5cb254a75d5afa891  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 2eba772b26..258b2db014 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.3.0
+PYTHON_MAKO_VERSION = 1.3.5
 PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/a9/6e/6b41e654bbdcef90c6b9e7f280bf7cbd756dc2560ce76214f5cdbc4ddab5
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/67/03/fb5ba97ff65ce64f6d35b582aacffc26b693a98053fa831ab43a437cbddb
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
