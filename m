Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3C1EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DACC961244;
	Sun, 25 Jun 2023 19:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DACC961244
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbZN4JXYuEYb; Sun, 25 Jun 2023 19:13:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A43D60F20;
	Sun, 25 Jun 2023 19:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A43D60F20
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C17B01BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A78CC408F1
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A78CC408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rJre_fZC6p8v for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:13:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B00940912
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B00940912
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5316C84BBA; Sun, 25 Jun 2023 19:13:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 21:12:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b1d7f818bde9c2c967646e3a5713a6c2ede322f
X-Git-Newrev: 43ec76496316275c53ffbe67cb72903ad334eb98
X-Patchwork-Hint: ignore
Message-Id: <20230625191338.5316C84BBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bleak: bump to version
 0.20.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=43ec76496316275c53ffbe67cb72903ad334eb98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-bleak/python-bleak.hash | 4 ++--
 package/python-bleak/python-bleak.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index 2cd038cb68..aae230dac2 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  6f9881cc85648683927ab0b9c58a1a52  bleak-0.20.0.tar.gz
-sha256  7f6fe69454ad5d4c0ab05ae4a9aa1aabd6926d7128eab2fac4ef8a58a72999ee  bleak-0.20.0.tar.gz
+md5  97e2987748f1def21e1910a258027c17  bleak-0.20.2.tar.gz
+sha256  6c92a47abe34e6dea8ffc5cea9457cbff6e1be966854839dbc25cddb36b79ee4  bleak-0.20.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index 7d3dc2831f..9532774ae8 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 0.20.0
+PYTHON_BLEAK_VERSION = 0.20.2
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/aa/86/5084561ed4f31aec0322bef015db949a9f2bf0b4f6bd72b16479cf03f459
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/87/95/a6f614fae12a6fe1cf517f8600004dd6abd4af0e0e1177c03164d0637e81
 PYTHON_BLEAK_SETUP_TYPE = setuptools
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
