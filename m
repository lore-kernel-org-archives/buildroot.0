Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3934EC4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C961B41E79;
	Tue,  6 Feb 2024 10:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C961B41E79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IVET7Aq3k9Zc; Tue,  6 Feb 2024 10:34:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B78341E72;
	Tue,  6 Feb 2024 10:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B78341E72
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0574C1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDCAA4149E
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDCAA4149E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xyJ44yHI1n8i for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:34:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA20D4149A
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA20D4149A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3A7D86F9B; Tue,  6 Feb 2024 10:34:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 11:28:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc7bab307a77561e5d297312990e7af89ada0730
X-Git-Newrev: 4771d62dd0576c6eb5880aadced514c3c4d15d74
X-Patchwork-Hint: ignore
Message-Id: <20240206103428.B3A7D86F9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dtschema: bump to version
 2023.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=4771d62dd0576c6eb5880aadced514c3c4d15d74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dtschema/python-dtschema.hash | 4 ++--
 package/python-dtschema/python-dtschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
index a391e4ab21..3e1dd22133 100644
--- a/package/python-dtschema/python-dtschema.hash
+++ b/package/python-dtschema/python-dtschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dtschema/json
-md5  bb0ecd8b8680b76f7cb55da002f58d62  dtschema-2023.9.tar.gz
-sha256  52c6d271065155ca134d8a0bcf7e0ebed67b3991acbbd7a98b74eb8642f67d87  dtschema-2023.9.tar.gz
+md5  cc4be8cfc01804cc31a123b56f68aeb1  dtschema-2023.11.tar.gz
+sha256  cf9a449ea743c0a955cf6034ef246668fa5ea177684977c61fef7604af5f273b  dtschema-2023.11.tar.gz
 # Locally computed sha256 checksums
 sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
index 0fc13073f8..e1dd5009fd 100644
--- a/package/python-dtschema/python-dtschema.mk
+++ b/package/python-dtschema/python-dtschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DTSCHEMA_VERSION = 2023.9
+PYTHON_DTSCHEMA_VERSION = 2023.11
 PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
-PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/24/97/daa9109a854727cd4e1a715e4123198e5abd47db10c131de5bc0cef0acc3
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/5a/94/7890ef663fba1cca84cf0ab64c7f68685343c921ab883f0356cd9978b605
 PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
 PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
 PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
