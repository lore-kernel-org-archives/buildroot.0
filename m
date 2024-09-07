Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2288AEB64DF
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 20:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B290640426;
	Sat,  7 Sep 2024 20:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTlDcnGO9Xw8; Sat,  7 Sep 2024 20:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 381974045D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 381974045D;
	Sat,  7 Sep 2024 20:03:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FBB31BF863
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9FF881919
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkOXFReOFOIL for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 20:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BA95818CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BA95818CD
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 20:03:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19E9386F3E; Sat,  7 Sep 2024 20:03:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Sep 2024 21:50:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8884bd4f62c0d15cff6b18ca5f052c8102002798
X-Git-Newrev: cdabacb266fddbe4ff8727eff50ef85be9bc53c5
X-Patchwork-Hint: ignore
Message-Id: <20240907200357.19E9386F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-idna: bump to version 3.8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cdabacb266fddbe4ff8727eff50ef85be9bc53c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-idna/python-idna.hash | 4 ++--
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 7b22841d88..88459b38df 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  31cc572cb7a6519159c927c998c64c79  idna-3.7.tar.gz
-sha256  028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc  idna-3.7.tar.gz
+md5  4490e5070a3dcbf1a6cd178cb523cdfb  idna-3.8.tar.gz
+sha256  d838c2c0ed6fced7693d5e8ab8e734d5f8fda53a039c0164afb0b82e771e3603  idna-3.8.tar.gz
 # Locally computed sha256 checksums
 sha256  a59f0b0ef3635874109a4461ca44ff7a70d50696e814767bfaf721d4c9b0db0f  LICENSE.md
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index b3c012ed0d..c9b83a5bff 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 3.7
+PYTHON_IDNA_VERSION = 3.8
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/21/ed/f86a79a07470cb07819390452f178b3bef1d375f2ec021ecfc709fc7cf07
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/e8/ac/e349c5e6d4543326c6883ee9491e3921e0d07b55fdf3cce184b40d63e72a
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = flit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
