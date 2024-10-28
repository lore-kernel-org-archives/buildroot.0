Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF5DD33990
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B1E740648;
	Mon, 28 Oct 2024 14:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STL4uR_BdTb2; Mon, 28 Oct 2024 14:41:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBB464064E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBB464064E;
	Mon, 28 Oct 2024 14:41:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BDA554EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14094408E5
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9V62oSRot0Ij for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D32F940930
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D32F940930
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E3DC842E5; Mon, 28 Oct 2024 14:40:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 14:47:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a58f2fd76f218a205b0b2aa38631ae5dd66d592b
X-Git-Newrev: e1c1b7295bdc71b5dddb4a365451483cb565b5e2
X-Patchwork-Hint: ignore
Message-Id: <20241028144052.1E3DC842E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-keyring: bump to version
 25.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1c1b7295bdc71b5dddb4a365451483cb565b5e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-keyring/python-keyring.hash | 4 ++--
 package/python-keyring/python-keyring.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index e45e108055..ddbe52fb35 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5  18421ba10fcf6af96586aa0761cc667d  keyring-25.4.1.tar.gz
-sha256  b07ebc55f3e8ed86ac81dd31ef14e81ace9dd9c3d4b5d77a6e9a2016d0d71a1b  keyring-25.4.1.tar.gz
+md5  abbca9e5a78bdb506d3ba0bfa3fe3642  keyring-25.5.0.tar.gz
+sha256  4c753b3ec91717fe713c4edd522d625889d8973a349b0e582622f49766de58e6  keyring-25.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index dff2d19e0c..1972f5f6de 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 25.4.1
+PYTHON_KEYRING_VERSION = 25.5.0
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/a5/1c/2bdbcfd5d59dc6274ffb175bc29aa07ecbfab196830e0cfbde7bd861a2ea
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/f6/24/64447b13df6a0e2797b586dad715766d756c932ce8ace7f67bd384d76ae0
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
