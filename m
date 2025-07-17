Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350FBC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2BE4417B1;
	Thu, 17 Jul 2025 20:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Qf13ceMlzzf; Thu, 17 Jul 2025 20:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 299ED417A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 299ED417A0;
	Thu, 17 Jul 2025 20:43:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22C56A59
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBCE982025
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FuXxYVrSoTXy for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24B2B82089
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24B2B82089
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 178998674A; Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Jul 2025 22:31:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81cf89d3501b3037062c58d1743c94fd0ed18a60
X-Git-Newrev: 4dae2ee4feb98168c13e1256e71a05a49f91645b
X-Patchwork-Hint: ignore
Message-Id: <20250717204325.178998674A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pypika-tortoise: bump to
 version 0.6.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4dae2ee4feb98168c13e1256e71a05a49f91645b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/python-pypika-tortoise/python-pypika-tortoise.hash | 4 ++--
 package/python-pypika-tortoise/python-pypika-tortoise.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash b/package/python-pypika-tortoise/python-pypika-tortoise.hash
index eb9caddd52..a2798b5c20 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.hash
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
-md5  faef2df5c61d114588fe61c4dac2c39e  pypika_tortoise-0.5.0.tar.gz
-sha256  ed0f56761868dc222c03e477578638590b972280b03c7c45cd93345b18b61f58  pypika_tortoise-0.5.0.tar.gz
+md5  1a80beca2d767b93ff62ebe9fbce6a63  pypika_tortoise-0.6.1.tar.gz
+sha256  36ec2c88c255b9ed7ef49a6068cdeac10dafd4ddfeb828205d3afc092507fc3a  pypika_tortoise-0.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
index b2b10abffd..f0e92faff5 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.mk
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPIKA_TORTOISE_VERSION = 0.5.0
+PYTHON_PYPIKA_TORTOISE_VERSION = 0.6.1
 PYTHON_PYPIKA_TORTOISE_SOURCE = pypika_tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
-PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/7d/7b/74dce3354d81988f1d69b689f20b28c3e92f2dcc0c46975bdafd3eb37b18
+PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/db/03/c293fd42c3669e5a79d508c3ed1ca3ffa501600d93abd904a0f86d493ba0
 PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = poetry
 PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
 PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
