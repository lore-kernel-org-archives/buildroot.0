Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA260CCD190
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 07:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A246141104;
	Wed, 15 Oct 2025 07:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ha70S2y-gKJo; Wed, 15 Oct 2025 07:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B71941147
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B71941147;
	Wed, 15 Oct 2025 07:17:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 067DB1BA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6D4840860
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsSSYnCWGGdG for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 07:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 036E841400
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 036E841400
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:16:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D69178710F; Wed, 15 Oct 2025 07:16:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 08:48:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1519659b42323ee0dccd3b4642258b756a968396
X-Git-Newrev: a6ef3ac5e3713fd3a491a263c57b34968f1137bd
X-Patchwork-Hint: ignore
Message-Id: <20251015071659.D69178710F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xlsxwriter: bump version to
 3.2.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6ef3ac5e3713fd3a491a263c57b34968f1137bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to copyright year bump:
https://github.com/jmcnamara/XlsxWriter/commit/35240021021faafa1b70835876560ecde32d3591

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-xlsxwriter/python-xlsxwriter.hash | 6 +++---
 package/python-xlsxwriter/python-xlsxwriter.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 009ebe9c36..92c3dee1d3 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlsxwriter/json
-md5  881932c4645db35b39b1da684af42a01  XlsxWriter-3.2.1.tar.gz
-sha256  97618759cb264fb6a93397f660cca156ffa9561743b1823dafb60dc4474e1902  XlsxWriter-3.2.1.tar.gz
+md5  9b577c64f83dec8e357dab62be575e5a  xlsxwriter-3.2.9.tar.gz
+sha256  254b1c37a368c444eac6e2f867405cc9e461b0ed97a3233b2ac1e574efb4140c  xlsxwriter-3.2.9.tar.gz
 # Locally computed sha256 checksums
-sha256  272e8fbd91096feeea0a250775ed83dfed17143ee4acd5d9567a1e42104c038f  LICENSE.txt
+sha256  cf08b60a4ded986b58a617cb8304373bda5c4eff42fb4e30d7597b616e116e87  LICENSE.txt
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index be2bd342ca..e6a8fe4adf 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 3.2.1
-PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/48/4f/108b0bada5cfcc47c24ea6181f4c563fbafef50bcc0054089c256b2ae578
+PYTHON_XLSXWRITER_VERSION = 3.2.9
+PYTHON_XLSXWRITER_SOURCE = xlsxwriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
+PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/46/2c/c06ef49dc36e7954e55b802a8b231770d286a9758b3d936bd1e04ce5ba88
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
