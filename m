Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8D4C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 507ED81F7D;
	Tue,  2 Jul 2024 07:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxd6i259rn4W; Tue,  2 Jul 2024 07:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F39FF81FE2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F39FF81FE2;
	Tue,  2 Jul 2024 07:48:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 224951BF97E
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C77040D33
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAVJxA4ggDOn for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0774240B7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0774240B7F
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:48:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7BA683A81; Tue,  2 Jul 2024 07:48:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 09:08:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a75aca39dfbe6ca468a5cfd20604bd6d97b755f
X-Git-Newrev: 9ebf00882df8ed9d8aaaaea3bd219e22781f1d84
X-Patchwork-Hint: ignore
Message-Id: <20240702074809.E7BA683A81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dateutil: bump to version
 2.9.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ebf00882df8ed9d8aaaaea3bd219e22781f1d84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-dateutil/python-dateutil.hash | 4 ++--
 package/python-dateutil/python-dateutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dateutil/python-dateutil.hash b/package/python-dateutil/python-dateutil.hash
index a52fb30a0f..c127582376 100644
--- a/package/python-dateutil/python-dateutil.hash
+++ b/package/python-dateutil/python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-dateutil/json
-md5  5970010bb72452344df3d76a10281b65  python-dateutil-2.8.2.tar.gz
-sha256  0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86  python-dateutil-2.8.2.tar.gz
+md5  f4888298c0f2d5239c85c6457455a975  python-dateutil-2.9.0.tar.gz
+sha256  78e73e19c63f5b20ffa567001531680d939dc042bf7850431877645523c66709  python-dateutil-2.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ba00f51a0d92823b5a1cde27d8b5b9d2321e67ed8da9bc163eff96d5e17e577e  LICENSE
diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
index b75f510bce..a2f1620b9f 100644
--- a/package/python-dateutil/python-dateutil.mk
+++ b/package/python-dateutil/python-dateutil.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DATEUTIL_VERSION = 2.8.2
-PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9
+PYTHON_DATEUTIL_VERSION = 2.9.0
+PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/d9/77/bd458a2e387e98f71de86dcc2ca2cab64489736004c80bc12b70da8b5488
 PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_DATEUTIL_LICENSE = BSD-3-Clause
 PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
