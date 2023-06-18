Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A712EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AA14610C3;
	Sun, 18 Jun 2023 13:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AA14610C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gwKiP7ELPYqB; Sun, 18 Jun 2023 13:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F58F60FE6;
	Sun, 18 Jun 2023 13:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F58F60FE6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F99C1BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 095E840363
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 095E840363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W9JG6NjzFrn6 for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:08:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31AFD402F6
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31AFD402F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 202C483D24; Sun, 18 Jun 2023 13:08:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 15:06:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7978383cb055d05b4ca4da6dea2f8192c7898725
X-Git-Newrev: 4f50a8cad0efb5783e9d93d62d932e0f114bf346
X-Patchwork-Hint: ignore
Message-Id: <20230618130843.202C483D24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-yarl: bump to version 1.9.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f50a8cad0efb5783e9d93d62d932e0f114bf346
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file now contains the full Apache 2.0 license instead of just a
reference to it:
https://github.com/aio-libs/yarl/commit/cc4a11e961fb24b5658df1c5125b26cb44c0b875

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-yarl/python-yarl.hash | 6 +++---
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 9725e0058b..624297aeba 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  57c82725b9f4895eecee45faf5e61a54  yarl-1.8.2.tar.gz
-sha256  49d43402c6e3013ad0978602bf6bf5328535c48d192304b91b97a3c6790b1562  yarl-1.8.2.tar.gz
+md5  4e46a0c7078d34d9734a7c5d182dee92  yarl-1.9.2.tar.gz
+sha256  04ab9d4b9f587c06d801c2abfe9317b77cdf996c65a90d5e84ecc45010823571  yarl-1.9.2.tar.gz
 # Locally computed sha256 checksums
-sha256  56d6ac6c8105c0a51304c21db060e361af9a8ea0af9a75c239c28b5d13693838  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 77e0c91383..e4424ff577 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.8.2
+PYTHON_YARL_VERSION = 1.9.2
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/c4/1e/1b204050c601d5cd82b45d5c8f439cb6f744a2ce0c0a6f83be0ddf0dc7b2
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/5f/3f/04b3c5e57844fb9c034b09c5cb6d2b43de5d64a093c30529fd233e16cf09
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
