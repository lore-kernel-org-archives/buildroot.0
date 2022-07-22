Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9875C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BC7C60768;
	Fri, 22 Jul 2022 21:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BC7C60768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03aZp8iMqEku; Fri, 22 Jul 2022 21:17:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 543A66072A;
	Fri, 22 Jul 2022 21:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 543A66072A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 555871BF215
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F5036072A
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F5036072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l09SMOUSRuBl for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:17:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54863605BA
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54863605BA
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E442D841D7; Fri, 22 Jul 2022 21:03:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 23:16:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d867408b012788d264735a6a71fa362863e081e
X-Git-Newrev: 13dbb736e1e6b2eb39a2f005b57440564a949ab3
X-Patchwork-Hint: ignore
Message-Id: <20220722210353.E442D841D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rsa: bump to version 4.8
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
Content-Type: multipart/mixed; boundary="===============0026900856103496274=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0026900856103496274==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=13dbb736e1e6b2eb39a2f005b57440564a949ab3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While at it, update the indentation of the license hash (two spaces).

Changelog:
https://github.com/sybrenstuvel/python-rsa/blob/main/CHANGELOG.md

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-rsa/python-rsa.hash | 4 ++--
 package/python-rsa/python-rsa.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-rsa/python-rsa.hash b/package/python-rsa/python-rsa.hash
index 9fbbf0ac88..2ea1245667 100644
--- a/package/python-rsa/python-rsa.hash
+++ b/package/python-rsa/python-rsa.hash
@@ -1,5 +1,5 @@
 # From https://pypi.org/project/rsa/
-sha256  9d689e6ca1b3038bc82bf8d23e944b6b6037bc02301a574935b2dd946e0353b9  rsa-4.7.2.tar.gz
+sha256  5c6bd9dc7a543b7fe4304a631f8a8a3b674e2bbfc49c2ae96200cdbe55df6b17  rsa-4.8.tar.gz
 
 # Locally computed
-sha256	073f28b7d389c8fe74f607e17c27f81eaa5ace69edc43a884f23f41b41c5c726  LICENSE
+sha256  073f28b7d389c8fe74f607e17c27f81eaa5ace69edc43a884f23f41b41c5c726  LICENSE
diff --git a/package/python-rsa/python-rsa.mk b/package/python-rsa/python-rsa.mk
index a3d4bb8235..0de35fe43e 100644
--- a/package/python-rsa/python-rsa.mk
+++ b/package/python-rsa/python-rsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RSA_VERSION = 4.7.2
+PYTHON_RSA_VERSION = 4.8
 PYTHON_RSA_SOURCE = rsa-$(PYTHON_RSA_VERSION).tar.gz
-PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/db/b5/475c45a58650b0580421746504b680cd2db4e81bc941e94ca53785250269
+PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/8c/ee/4022542e0fed77dd6ddade38e1e4dea3299f873b7fd4e6d78319953b0f83
 PYTHON_RSA_SETUP_TYPE = setuptools
 PYTHON_RSA_LICENSE = Apache-2.0
 PYTHON_RSA_LICENSE_FILES = LICENSE

--===============0026900856103496274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0026900856103496274==--
