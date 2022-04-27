Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE106C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 18:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8937982A6C;
	Wed, 27 Apr 2022 18:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4_Rn5A7YuGIh; Wed, 27 Apr 2022 18:57:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80BE5831C1;
	Wed, 27 Apr 2022 18:57:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 712591BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D7094015D
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZGixqBeT8zp for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:57:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8639400BA
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:57:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1C39B845FF; Wed, 27 Apr 2022 18:47:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 20:50:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 608d754cebb126745153c0a3d836355e43dc1c54
X-Git-Newrev: 3cd32e0a57112ecc309092331e9836051f105ec0
X-Patchwork-Hint: ignore
Message-Id: <20220427184726.1C39B845FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-esptool: bump version to 3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cd32e0a57112ecc309092331e9836051f105ec0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-esptool/python-esptool.hash | 6 +++---
 package/python-esptool/python-esptool.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index a916f9a09a..ac8f6972d7 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5	84aa6ffb4723b1f59a2c83244a9ad918  esptool-3.2.tar.gz
-sha256	9638ff11c68e621e08e7c3335d4fd9d70b2ddcf7caae778073cd8cc27be1216f  esptool-3.2.tar.gz
+md5  ac499eaa99df9b536a98a6f99644f8f6  esptool-3.3.tar.gz
+sha256  39b92e1848e352183188f149f3e876cde4b8a1c095551e7e545a28e5c11eea13  esptool-3.3.tar.gz
 # Locally computed sha256 checksums
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index 77291e252b..28b5075e72 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 3.2
+PYTHON_ESPTOOL_VERSION = 3.3
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/60/a4/33907f5b735f9179061bd6b6cae7123d4a2d0cdf46c879fa55e66edef24f
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/63/85/1a7f65d3f89c112c721c6ec013ecd948112df17640e453ddeb1921b05aab
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
