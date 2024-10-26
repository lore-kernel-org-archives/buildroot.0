Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9F9D10BEC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 08:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 085C781E75;
	Sat, 26 Oct 2024 08:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IqqmI-KDoZsk; Sat, 26 Oct 2024 08:58:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 021B181FEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 021B181FEF;
	Sat, 26 Oct 2024 08:58:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27E5D5C52
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 08:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EFC040656
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 08:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-76HONrEPgy for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 08:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E625540BCB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E625540BCB
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 08:57:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE57C8390C; Sat, 26 Oct 2024 08:57:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 10:49:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 479a07874a1472df34cfba788c91c57aba426ada
X-Git-Newrev: 837d008b21fba2a696fa613a9e2f7cffffbc72e2
X-Patchwork-Hint: ignore
Message-Id: <20241026085746.CE57C8390C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-starlette: bump to version
 0.41.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=837d008b21fba2a696fa613a9e2f7cffffbc72e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 9a9671f41c..22b4f05f7c 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  cdef39e4684305e568bd91b45ceb9dbf  starlette-0.39.2.tar.gz
-sha256  caaa3b87ef8518ef913dac4f073dea44e85f73343ad2bdc17941931835b2a26a  starlette-0.39.2.tar.gz
+md5  c7bea1bc676a8e9adce0214bf632f67b  starlette-0.41.0.tar.gz
+sha256  39cbd8768b107d68bfe1ff1672b38a2c38b49777de46d2a592841d58e3bf7c2a  starlette-0.41.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index e1fa34a3ce..92c9ebb16b 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.39.2
+PYTHON_STARLETTE_VERSION = 0.41.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/02/0a/62fbd5697f6174041f9b4e2e377b6f383f9189b77dbb7d73d24624caca1d
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/78/53/c3a36690a923706e7ac841f649c64f5108889ab1ec44218dac45771f252a
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
