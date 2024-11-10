Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6609D12D4A
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 16:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60D3D400C3;
	Sun, 10 Nov 2024 16:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tnyK2FPHS9O0; Sun, 10 Nov 2024 16:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32E944005E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32E944005E;
	Sun, 10 Nov 2024 16:46:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 51EA6DAC
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C9754028C
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAQfh8gG6CY9 for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 16:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1D3040131
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1D3040131
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:46:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9F7081212; Sun, 10 Nov 2024 16:46:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Nov 2024 17:44:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9ce050c4ab676721a6916f3fd09aa78c3513c63
X-Git-Newrev: 3a88a7fc7edb7eb3b5d2168356af88218b3502bb
X-Patchwork-Hint: ignore
Message-Id: <20241110164617.B9F7081212@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dtschema: bump to version
 2024.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a88a7fc7edb7eb3b5d2168356af88218b3502bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dtschema/python-dtschema.hash | 4 ++--
 package/python-dtschema/python-dtschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
index ca5867cf16..b53830f4cb 100644
--- a/package/python-dtschema/python-dtschema.hash
+++ b/package/python-dtschema/python-dtschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dtschema/json
-md5  1bd2cb19c8d9da652e4d7c5be16c7d20  dtschema-2024.9.tar.gz
-sha256  1e5cc422736d5e4167f764478e50093f340bbede95b569ed66d60748dbc39ab2  dtschema-2024.9.tar.gz
+md5  e4ecd1925af81376865ce0169dc1146a  dtschema-2024.11.tar.gz
+sha256  bb7dd36ff9406ec89607b893cfc5e1ffa7ead76fd5c48df77eafc9b4d4196047  dtschema-2024.11.tar.gz
 # Locally computed sha256 checksums
 sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
index c848b547c0..13ccc16e95 100644
--- a/package/python-dtschema/python-dtschema.mk
+++ b/package/python-dtschema/python-dtschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DTSCHEMA_VERSION = 2024.9
+PYTHON_DTSCHEMA_VERSION = 2024.11
 PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
-PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/6e/ed/38406756269a83b341ceb5884874692f18eeae820b70a198e8f3699c11da
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/b7/e2/260c0429118b1555ddc2d0d465b7ab36e76ab2454a3d1a916ef06dffccca
 PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
 PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
 PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
