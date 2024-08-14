Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB707C531DC
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 19:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AB2581CFE;
	Wed, 14 Aug 2024 19:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gouuzbpp2ouL; Wed, 14 Aug 2024 19:28:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00E0181D67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00E0181D67;
	Wed, 14 Aug 2024 19:28:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DB3E1BF40D
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 19:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 412C081C38
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 19:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDu0yojl6YZb for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 19:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65BD981C6E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65BD981C6E
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 19:28:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D33085C95; Wed, 14 Aug 2024 19:28:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 21:25:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 896d0e21994400e0c36bec6bff92028c18e9999d
X-Git-Newrev: 62803c66e7ca4857d12489747e385e3f657daf98
X-Patchwork-Hint: ignore
Message-Id: <20240814192804.0D33085C95@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-jc: bump to
 1.25.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=62803c66e7ca4857d12489747e385e3f657daf98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog: https://github.com/kellyjonbrazil/jc/releases/tag/v1.25.3

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jc/python-jc.hash | 4 ++--
 package/python-jc/python-jc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
index 6bcb886a47..75d64da7bf 100644
--- a/package/python-jc/python-jc.hash
+++ b/package/python-jc/python-jc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jc/json
-md5  e042a82acf978e5dc16dd1ac9371e97a  jc-1.25.2.tar.gz
-sha256  97ada193495f79550f06fe0cbfb119ff470bcca57c1cc593a5cdb0008720e0b3  jc-1.25.2.tar.gz
+md5  7e9454e01eafa7c8c6e415fddc7d2638  jc-1.25.3.tar.gz
+sha256  fa3140ceda6cba1210d1362f363cd79a0514741e8a1dd6167db2b2e2d5f24f7b  jc-1.25.3.tar.gz
 # Locally computed sha256 checksums
 sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index c57c9e8acc..202884f3dc 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JC_VERSION = 1.25.2
+PYTHON_JC_VERSION = 1.25.3
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/39/2e/c0d557b2ee673e2e0aef24a01e732aa232f6b1e180f339058f674f391ab8
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/a5/82/bfb1ec7d9667bc2f922254bc62e12fd460a5de3b711518f5089df0a17180
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
