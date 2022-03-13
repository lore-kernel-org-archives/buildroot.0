Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96BBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 09:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91CC760EAE;
	Sun, 13 Mar 2022 09:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVav8u7V-Bor; Sun, 13 Mar 2022 09:11:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89C9960E99;
	Sun, 13 Mar 2022 09:11:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0B301BF97C
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BBFB60E91
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id phA5TQdAsNAB for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 09:11:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C88DE606E6
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 09:11:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8ED7F83A68; Sun, 13 Mar 2022 09:02:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 09:47:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19294eb352feb9cc96bc7eeb8942da27f715ab87
X-Git-Newrev: c7557cb05410f981fe5b8784bb321b28767ea93a
X-Patchwork-Hint: ignore
Message-Id: <20220313090240.8ED7F83A68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-weasyprint: bump to version
 54.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7557cb05410f981fe5b8784bb321b28767ea93a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from distutils to flit package infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 8d231c50ba..90ccc1d057 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  a90fd2d5a581a0e218943af3a8b64a31  weasyprint-53.4.tar.gz
-sha256  10ccb17d55c73096bdf1edd3efe58cb855b07e4c307d9bad4ebc9a3f13ff4580  weasyprint-53.4.tar.gz
+md5  3917447c277db6931b8370f1d725db49  weasyprint-54.2.tar.gz
+sha256  d5e8aa82e3e2a2477a4543f0646d9fb14080c9ba34a0859751eb23757cc00466  weasyprint-54.2.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index 0a944825bb..925de855bc 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 53.4
+PYTHON_WEASYPRINT_VERSION = 54.2
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/72/25/336e274fde0e48cf9979d44667411fbcfa55d323fd7672068807b6de2f89
-PYTHON_WEASYPRINT_SETUP_TYPE = distutils
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/f3/dc/d3d6f1d87a0a0b09637a1f5076790e229cc803c3584ed4edb76553844001
+PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
