Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EA9C54EBE
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 19:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F0A6417A4;
	Thu, 12 Jan 2023 19:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F0A6417A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zs99pXoOM4cj; Thu, 12 Jan 2023 19:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F0144179F;
	Thu, 12 Jan 2023 19:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F0144179F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D72021BF973
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B18C141799
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B18C141799
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pz7CrqxunYJm for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 19:32:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFCE04179F
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 19:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFCE04179F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCBCE87AA2; Thu, 12 Jan 2023 19:32:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 20:27:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a598dedd8090d3c7ba4ea8c323a702289586647
X-Git-Newrev: 6abb8721dbf0987ec43f248c84ce4f0f4d11b697
X-Patchwork-Hint: ignore
Message-Id: <20230112193229.BCBCE87AA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-weasyprint: bump to version
 57.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6abb8721dbf0987ec43f248c84ce4f0f4d11b697
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 4da8ea479a..d6026cf034 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  bab389bdfb25e03d64591c56367fb344  weasyprint-57.1.tar.gz
-sha256  397a9d11298f94485ec3b7b68aeef1c6106fb638350126d9d4a64109b73508a0  weasyprint-57.1.tar.gz
+md5  497030cecafffca06bae2b161846b461  weasyprint-57.2.tar.gz
+sha256  b8e9ef2dcbcfbc82e99215acfd68f947b2b5f1999b5b156db75fabe380ba7e9a  weasyprint-57.2.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index d1e5e7983d..27b07226d9 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 57.1
+PYTHON_WEASYPRINT_VERSION = 57.2
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/32/3f/d305dc714c119e5b11c0ea1ecff9741407b6da90d6b684859d3b3e586692
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/b1/88/335dd6cb71a9d58584c975bf1db0ab9a3a9f15f9bffef1cbfac0fb1ee72e
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
