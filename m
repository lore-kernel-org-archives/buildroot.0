Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB6CC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF8F884ED9;
	Fri, 28 Feb 2025 16:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irIXy4_pOLfv; Fri, 28 Feb 2025 16:57:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0B0F84EEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0B0F84EEC;
	Fri, 28 Feb 2025 16:57:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1259968
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E00A478C4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DfM35r3ZoyIF for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD72D4256F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD72D4256F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9044821C6; Fri, 28 Feb 2025 16:30:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jan 2025 16:48:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d555cc8e83fdcd8593d3e069d662cbd89d982f4e
X-Git-Newrev: 7ad307aa1ca4deb6b73fb82637751ddcc1d2b3a0
X-Patchwork-Hint: ignore
Message-Id: <20250228163008.A9044821C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-tomli: bump to
 version 2.2.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7ad307aa1ca4deb6b73fb82637751ddcc1d2b3a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tomli/python-tomli.hash | 4 ++--
 package/python-tomli/python-tomli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
index 8ee4939af0..ec30f06db2 100644
--- a/package/python-tomli/python-tomli.hash
+++ b/package/python-tomli/python-tomli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomli/json
-md5  e65b234adc4513d94792c69bb025b622  tomli-2.0.2.tar.gz
-sha256  d46d457a85337051c36524bc5349dd91b1877838e2979ac5ced3e710ed8a60ed  tomli-2.0.2.tar.gz
+md5  1e0e2fb2e29f3d77f0507bee71fb4ab4  tomli-2.2.1.tar.gz
+sha256  cd45e1dc79c835ce60f7404ec8119f2eb06d38b1deba146f07ced3bbc44505ff  tomli-2.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index 3c3d4dc182..c23ae94758 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLI_VERSION = 2.0.2
+PYTHON_TOMLI_VERSION = 2.2.1
 PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
-PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/35/b9/de2a5c0144d7d75a57ff355c0c24054f965b2dc3036456ae03a51ea6264b
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/18/87/302344fed471e44a87289cf4967697d07e532f2421fdaf868a303cbae4ff
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
 PYTHON_TOMLI_SETUP_TYPE = flit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
