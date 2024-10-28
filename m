Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B11D33990
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 486CF40569;
	Mon, 28 Oct 2024 14:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOH2_8dthBKt; Mon, 28 Oct 2024 14:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC5FE407AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC5FE407AF;
	Mon, 28 Oct 2024 14:42:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C8145C24
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9705240967
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXb4T5jftLeS for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5223408EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5223408EC
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0E5A842F5; Mon, 28 Oct 2024 14:40:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 14:47:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bba8ad89a07eada3a730dd0027452324bb3faeab
X-Git-Newrev: c594544bcc3eb97cccde764890086544762a0f11
X-Patchwork-Hint: ignore
Message-Id: <20241028144052.A0E5A842F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-starlette: bump to version
 0.41.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c594544bcc3eb97cccde764890086544762a0f11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 22b4f05f7c..f422e6cfe0 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  c7bea1bc676a8e9adce0214bf632f67b  starlette-0.41.0.tar.gz
-sha256  39cbd8768b107d68bfe1ff1672b38a2c38b49777de46d2a592841d58e3bf7c2a  starlette-0.41.0.tar.gz
+md5  97321ad76438c1106ddd817baddcda06  starlette-0.41.2.tar.gz
+sha256  9834fd799d1a87fd346deb76158668cfa0b0d56f85caefe8268e2d97c3468b62  starlette-0.41.2.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 92c9ebb16b..3caa136987 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.41.0
+PYTHON_STARLETTE_VERSION = 0.41.2
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/78/53/c3a36690a923706e7ac841f649c64f5108889ab1ec44218dac45771f252a
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/3e/da/1fb4bdb72ae12b834becd7e1e7e47001d32f91ec0ce8d7bc1b618d9f0bd9
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
