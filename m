Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64224C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3642381AD1;
	Sun, 15 Sep 2024 21:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lq5DT-ByDpV3; Sun, 15 Sep 2024 21:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52B968477D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52B968477D;
	Sun, 15 Sep 2024 21:39:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A9381BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E145D80BC9
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CX5QhC7tkF1Q for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2D0C80B3C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2D0C80B3C
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDD7783685; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e908b2d5313673231660b5f35ccdd39ef497d055
X-Git-Newrev: 67562a9f1e27a4ce3fd775e53dfe096c6754fed6
X-Patchwork-Hint: ignore
Message-Id: <20240915213639.EDD7783685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-future: bump to version
 1.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=67562a9f1e27a4ce3fd775e53dfe096c6754fed6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to date update:
https://github.com/PythonCharmers/python-future/commit/6eef83de7db1086633c98ba2e104de1b471944d0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-future/python-future.hash | 6 +++---
 package/python-future/python-future.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-future/python-future.hash b/package/python-future/python-future.hash
index 3b2bbb0212..8839d80c91 100644
--- a/package/python-future/python-future.hash
+++ b/package/python-future/python-future.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/future/json
-md5  dedcb70d14b23388670d54145aab8be4  future-0.18.3.tar.gz
-sha256  34a17436ed1e96697a86f9de3d15a3b0be01d8bc8de9c1dffd59fb8234ed5307  future-0.18.3.tar.gz
+md5  028bd8af5a7dd853fd12c8bf627236a9  future-1.0.0.tar.gz
+sha256  bd2968309307861edae1458a4f8a4f3598c03be43b97521076aebf5d94c07b05  future-1.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  916e561392d48471b9c23437f56e2652f320cb3b119ceaa162edf41016f746b9  LICENSE.txt
+sha256  beba04103c3a9fff928b59c77d5fbeb03a3e4bd0d7ac3d1e1f8994a21e30ee3b  LICENSE.txt
diff --git a/package/python-future/python-future.mk b/package/python-future/python-future.mk
index 57bf13d83b..698863a13d 100644
--- a/package/python-future/python-future.mk
+++ b/package/python-future/python-future.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FUTURE_VERSION = 0.18.3
+PYTHON_FUTURE_VERSION = 1.0.0
 PYTHON_FUTURE_SOURCE = future-$(PYTHON_FUTURE_VERSION).tar.gz
-PYTHON_FUTURE_SITE = https://files.pythonhosted.org/packages/8f/2e/cf6accf7415237d6faeeebdc7832023c90e0282aa16fd3263db0eb4715ec
+PYTHON_FUTURE_SITE = https://files.pythonhosted.org/packages/a7/b2/4140c69c6a66432916b26158687e821ba631a4c9273c474343badf84d3ba
 PYTHON_FUTURE_SETUP_TYPE = setuptools
 PYTHON_FUTURE_LICENSE = MIT
 PYTHON_FUTURE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
