Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD90C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E28140BFD;
	Thu,  3 Nov 2022 21:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E28140BFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M0yNEUCEBG2D; Thu,  3 Nov 2022 21:10:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 601DF40C26;
	Thu,  3 Nov 2022 21:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 601DF40C26
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88C701BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D25D340BF0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D25D340BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pGrmS8IvAkqr for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E6A540C07
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E6A540C07
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B10587BCC; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aaf7d09c805c1d4e7b64c96719a3e965f1f16ce7
X-Git-Newrev: 02294e005949752929fa5136691f5422c567d522
X-Patchwork-Hint: ignore
Message-Id: <20221103205513.1B10587BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-prompt-toolkit:
 bump to version 3.0.31
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

commit: https://git.buildroot.net/buildroot/commit/?id=02294e005949752929fa5136691f5422c567d522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-prompt-toolkit/python-prompt-toolkit.hash | 4 ++--
 package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
index 5a24634a56..8b91ee767f 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/prompt-toolkit/json
-md5  ba9e63c3e7e5a4f4ce4e4770a4daba96  prompt_toolkit-3.0.20.tar.gz
-sha256  eb71d5a6b72ce6db177af4a7d4d7085b99756bf656d98ffcc4fecd36850eea6c  prompt_toolkit-3.0.20.tar.gz
+md5  0cc5e752cb2759e99658e2391644e767  prompt_toolkit-3.0.31.tar.gz
+sha256  9ada952c9d1787f52ff6d5f3484d0b4df8952787c087edf6a1f7c2cb1ea88148  prompt_toolkit-3.0.31.tar.gz
 # Locally computed sha256 checksums
 sha256  303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index b575783f96..bef761e20f 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.20
+PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.31
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/b4/56/9ab5868f34ab2657fba7e2192f41316252ab04edbbeb2a8583759960a1a7
+PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/80/76/c94cf323ca362dd7baca8d8ddf3b5fe1576848bc0156522ad581c04f8446
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
