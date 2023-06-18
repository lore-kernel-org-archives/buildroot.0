Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60A8EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EF8B60A99;
	Sun, 18 Jun 2023 13:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EF8B60A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xueLdnb1Rf3F; Sun, 18 Jun 2023 13:09:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A92FC60F66;
	Sun, 18 Jun 2023 13:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A92FC60F66
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6AC111BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43C5E410E4
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43C5E410E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iRkJWhuGMhd7 for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:08:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29C784097A
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29C784097A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16ACB83CEC; Sun, 18 Jun 2023 13:08:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 15:04:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c46dd628e708e249253f123bf465e5c60f9b51a
X-Git-Newrev: 7978383cb055d05b4ca4da6dea2f8192c7898725
X-Patchwork-Hint: ignore
Message-Id: <20230618130843.16ACB83CEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-weasyprint: bump to version
 59.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7978383cb055d05b4ca4da6dea2f8192c7898725
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index d6026cf034..c22677cad0 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  497030cecafffca06bae2b161846b461  weasyprint-57.2.tar.gz
-sha256  b8e9ef2dcbcfbc82e99215acfd68f947b2b5f1999b5b156db75fabe380ba7e9a  weasyprint-57.2.tar.gz
+md5  2cb135e7c5318bb1652205035f083922  weasyprint-59.0.tar.gz
+sha256  223a76636b3744eaa4ab8a2885f50cf46cf8ebb1acb99b5276d02feccf507492  weasyprint-59.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index 27b07226d9..a1e3d23b75 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 57.2
+PYTHON_WEASYPRINT_VERSION = 59.0
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/b1/88/335dd6cb71a9d58584c975bf1db0ab9a3a9f15f9bffef1cbfac0fb1ee72e
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/1d/69/11343bbb46d4f2a311677058e19cc2f7bc55a769b64c547a64ea1e2b6045
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
