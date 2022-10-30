Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0A6C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC4274035D;
	Sun, 30 Oct 2022 11:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC4274035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U9swQEGW0N0h; Sun, 30 Oct 2022 11:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC2F140357;
	Sun, 30 Oct 2022 11:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC2F140357
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 022921BF957
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37BE94030A
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37BE94030A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-BVafx3L1KX for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1946040358
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1946040358
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05FC387471; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:53:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32602849a8352647c46cc5330668339000205bdf
X-Git-Newrev: 8a5178293fa9dcfab1e2599de6dd7d6b163c7007
X-Patchwork-Hint: ignore
Message-Id: <20221030110443.05FC387471@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wsaccel: bump to version
 0.6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a5178293fa9dcfab1e2599de6dd7d6b163c7007
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-wsaccel/python-wsaccel.hash | 4 ++--
 package/python-wsaccel/python-wsaccel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wsaccel/python-wsaccel.hash b/package/python-wsaccel/python-wsaccel.hash
index 9d0002d41d..b388c3cc7c 100644
--- a/package/python-wsaccel/python-wsaccel.hash
+++ b/package/python-wsaccel/python-wsaccel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wsaccel/json
-md5  973168711818dd98b8b28a4c2db77a27  wsaccel-0.6.3.tar.gz
-sha256  fdb27866bb6b6e7a29e45222778ff97938782a0ce92eff07dfb20af8fb9301c4  wsaccel-0.6.3.tar.gz
+md5  73bdc70035813ded14f9a4b81e82622a  wsaccel-0.6.4.tar.gz
+sha256  cbf66a88bcaf6c6ad16d50ea29215891526b6e993c4bc7ed44b044ee6fe3ad3d  wsaccel-0.6.4.tar.gz
 # Locally computed sha256 checksums
 sha256  b6982974cb838b985b54b663d1780d280735086249c2e28015f25dd455df25da  LICENSE
diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
index 7c78951f2f..ce41d431ff 100644
--- a/package/python-wsaccel/python-wsaccel.mk
+++ b/package/python-wsaccel/python-wsaccel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WSACCEL_VERSION = 0.6.3
+PYTHON_WSACCEL_VERSION = 0.6.4
 PYTHON_WSACCEL_SOURCE = wsaccel-$(PYTHON_WSACCEL_VERSION).tar.gz
-PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/f5/d1/3e99875a764d0d6ec94a74977ed72dd3022a7f31d036622da9cff8fc072f
+PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/77/0b/a44df15382a76b6768184630d483b8363d65b9f70d1aacf76153d496bbb9
 PYTHON_WSACCEL_LICENSE = Apache-2.0
 PYTHON_WSACCEL_LICENSE_FILES = LICENSE
 PYTHON_WSACCEL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
