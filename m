Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0F5C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B4EA81A46;
	Wed,  7 Feb 2024 16:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AOI68F8kjrnt; Wed,  7 Feb 2024 16:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 862C482358
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 862C482358;
	Wed,  7 Feb 2024 16:45:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35E921BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D6F441461
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7w35FnQUpQU for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:45:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E2B340568
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E2B340568
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:45:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05CC98768C; Wed,  7 Feb 2024 16:45:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 17:43:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea08bfdf4511180def1a04befa5b06f5a627af3d
X-Git-Newrev: bcaf6b43279ba711888222bdad5b6988831b2d70
X-Patchwork-Hint: ignore
Message-Id: <20240207164556.05CC98768C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-soupsieve: bump to version
 2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcaf6b43279ba711888222bdad5b6988831b2d70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/facelessuser/soupsieve/commit/1615584814d597ce87d4b4d675250cbe20e3fa30

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-soupsieve/python-soupsieve.hash | 6 +++---
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index cf348d441f..278c7d1b0c 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  4c824620563604cbf783de149c8b8889  soupsieve-2.3.2.post1.tar.gz
-sha256  fc53893b3da2c33de295667a0e19f078c14bf86544af307354de5fcf12a3f30d  soupsieve-2.3.2.post1.tar.gz
+md5  88ae72bd970b425692235d17224204e6  soupsieve-2.5.tar.gz
+sha256  5663d5a7b3bfaeee0bc4372e7fc48f9cff4940b3eec54a6451cc5299f1097690  soupsieve-2.5.tar.gz
 # Locally computed sha256 checksums
-sha256  bc66234cadd3f6e7aaf7160faf165f3f869ffc8a11b6b0d6c44a2e2a83314dd0  LICENSE.md
+sha256  ceb7b9053b88addffa3102a457302bd840d123925ee9ed9c2ac90cf6548b33bf  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index ebf2ada7ac..581df7e787 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 2.3.2.post1
+PYTHON_SOUPSIEVE_VERSION = 2.5
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/f3/03/bac179d539362319b4779a00764e95f7542f4920084163db6b0fd4742d38
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/ce/21/952a240de1c196c7e3fbcd4e559681f0419b1280c617db21157a0390717b
 PYTHON_SOUPSIEVE_SETUP_TYPE = pep517
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
