Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65841EB64D8
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07F49611EA;
	Sun, 18 Jun 2023 13:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07F49611EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8hz__bFo_uhP; Sun, 18 Jun 2023 13:17:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B23461212;
	Sun, 18 Jun 2023 13:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B23461212
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B5A11BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 748B481E46
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 748B481E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 99dzIc5kCcF1 for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:17:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2E7A81E3E
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2E7A81E3E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C2DE83DA6; Sun, 18 Jun 2023 13:17:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 15:15:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c97e81251d977223620348aba8aa5fcd93dc9b02
X-Git-Newrev: 9aa45c0f892a129cc56f57fd0c9dffbe0af3b4fb
X-Patchwork-Hint: ignore
Message-Id: <20230618131719.9C2DE83DA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: bump to version
 9.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9aa45c0f892a129cc56f57fd0c9dffbe0af3b4fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to wording update:
https://github.com/python-pillow/Pillow/commit/997932bc93c778919fe22f4838ef0929482fe520

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pillow/python-pillow.hash | 6 +++---
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index d514bdfe56..43bb824b6a 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  ee6e9a6c729ed9e9a78ccd3f6e9d7143  Pillow-9.4.0.tar.gz
-sha256  a1c2d7780448eb93fbcc3789bf3916aa5720d942e37945f4056680317f1cd23e  Pillow-9.4.0.tar.gz
+md5  ed80942ad1ade1aab0fcf3790d0be3ec  Pillow-9.5.0.tar.gz
+sha256  bf548479d336726d7a0eceb6e767e179fbde37833ae42794602631a070d630f1  Pillow-9.5.0.tar.gz
 
 # Locally computed sha256 checksums
-sha256  4e1755595052d843e2f350c930759f945ecf707bf812883948d181016b12dd0f  LICENSE
+sha256  0fdb68ffb39062553be40be4e6eaea9700b4f5e870a720ae86b8925d67613ddd  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index c02968610f..b69d329cde 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 9.4.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/bc/07/830784e061fb94d67649f3e438ff63cfb902dec6d48ac75aeaaac7c7c30e
+PYTHON_PILLOW_VERSION = 9.5.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/00/d5/4903f310765e0ff2b8e91ffe55031ac6af77d982f0156061e20a4d1a8b2d
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
