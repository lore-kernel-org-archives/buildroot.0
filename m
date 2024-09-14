Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9430DC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 669F4820EA;
	Sun, 15 Sep 2024 21:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8iWwxa_zhh_W; Sun, 15 Sep 2024 21:38:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3819081B9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3819081B9D;
	Sun, 15 Sep 2024 21:38:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07D1F1BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60E8480BDE
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAjNStYVzE56 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FEF280A47
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FEF280A47
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CA3283683; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 23:52:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf3ee43224cea89548e07f7441b2ba842908f837
X-Git-Newrev: bb8445c44781f5dd9a72b775d641b163e122a207
X-Patchwork-Hint: ignore
Message-Id: <20240915213637.6CA3283683@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-argh: bump to version 0.31.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb8445c44781f5dd9a72b775d641b163e122a207
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-argh/python-argh.hash | 4 ++--
 package/python-argh/python-argh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-argh/python-argh.hash b/package/python-argh/python-argh.hash
index bac9df42d6..e90b79dce8 100644
--- a/package/python-argh/python-argh.hash
+++ b/package/python-argh/python-argh.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/argh/json
-md5  2659a6353589156e6aa65a99797f8913  argh-0.31.0.tar.gz
-sha256  b93093544309ddbfe6c73dc9bfd60dbc4acecef39f3f464774b3084a1ec5d7b0  argh-0.31.0.tar.gz
+md5  b3526d2a5126defffdb8075e1c34f0c8  argh-0.31.3.tar.gz
+sha256  f30023d8be14ca5ee6b1b3eeab829151d7bbda464ae07dc4dd5347919c5892f9  argh-0.31.3.tar.gz
 # Locally computed sha256 checksums
 sha256  2594f46b9b23a5fddeca090faeb270c7ceee8116675fe35082be859aa7466e89  COPYING
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/python-argh/python-argh.mk b/package/python-argh/python-argh.mk
index 0da3281d49..cdaa7e4139 100644
--- a/package/python-argh/python-argh.mk
+++ b/package/python-argh/python-argh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGH_VERSION = 0.31.0
+PYTHON_ARGH_VERSION = 0.31.3
 PYTHON_ARGH_SOURCE = argh-$(PYTHON_ARGH_VERSION).tar.gz
-PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/7c/3c/1b7f3fab380c96d61119178040c0183161fe0f182c4da3933bcb3284538f
+PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/4f/34/bc0b3577a818b4b70c6e318d23fe3c81fc3bb25f978ca8a3965cd8ee3af9
 PYTHON_ARGH_SETUP_TYPE = flit
 PYTHON_ARGH_LICENSE = LGPL-3.0+
 PYTHON_ARGH_LICENSE_FILES = COPYING COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
