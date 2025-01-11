Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A353C282D1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ADFF849CC;
	Fri, 28 Feb 2025 16:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tGiahC95Zl5; Fri, 28 Feb 2025 16:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EF51849C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EF51849C3;
	Fri, 28 Feb 2025 16:55:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CEE4711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F142424B1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zPmkHzNFIvhs for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 903734254D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 903734254D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 885F387A8B; Fri, 28 Feb 2025 16:30:05 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 18:39:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 58007e20b2231416fefb3f42eacddf3999149068
X-Git-Newrev: 9923df7b192af3a8a3cec3c5854eea79ee325c0c
X-Patchwork-Hint: ignore
Message-Id: <20250228163005.885F387A8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pylibftdi: bump
 to version 0.23.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9923df7b192af3a8a3cec3c5854eea79ee325c0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to year update:
https://github.com/codedstructure/pylibftdi/commit/e604c863134200b370a963f6822eebf2b4315992

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pylibftdi/python-pylibftdi.hash | 6 +++---
 package/python-pylibftdi/python-pylibftdi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index 00cee048f4..fd7d9f17b0 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylibftdi/json
-md5  a1d3039e8e09b3fb73cb03f1d6f3119b  pylibftdi-0.22.0.tar.gz
-sha256  85a6aab438f765342843aa2d59bb28fbb0d30847a621fb9800985185990f01af  pylibftdi-0.22.0.tar.gz
+md5  c3f06a398c7e7e2bc9d6ff8476378d5e  pylibftdi-0.23.0.tar.gz
+sha256  bf5b4c6ba73d79a6f6df849c345b00ba763d023201bed9ba51d876a4397b16d8  pylibftdi-0.23.0.tar.gz
 # Locally computed sha256 checksums
-sha256  b8a7b113cfaa2c01d0701183de16ba653465692b1e29e0229244eee42fb3a9a8  LICENSE.txt
+sha256  d42da8dcd174be0b5a20366aa3427b6c7570528a1992d50df9c6597cb3ecb898  LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index 1085c4879a..e6c138bbf1 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.22.0
+PYTHON_PYLIBFTDI_VERSION = 0.23.0
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/74/b3/a3c333a250143d204a0bb60de7c1e5f841543231f04c71ff4fa65e5b90c2
+PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/9d/f0/551ccbd8e989e898707e0e0859344fcf538c2310521847a1035ad3e9b164
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
 PYTHON_PYLIBFTDI_SETUP_TYPE = poetry
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
