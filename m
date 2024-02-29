Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6904FC54798
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 22:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3218210D;
	Thu, 29 Feb 2024 22:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7LaoPZdWX_0Z; Thu, 29 Feb 2024 22:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90E08820CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90E08820CD;
	Thu, 29 Feb 2024 22:01:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0BB21BF25B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 22:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB94441D85
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 22:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XItDmmJX_6h1 for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 22:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6A1F41BAB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6A1F41BAB
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 22:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA51287E1C; Thu, 29 Feb 2024 22:01:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 23:00:01 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: aef9df6cacbf0e2e266d73ed49ae0c51dc569c64
X-Git-Newrev: 82969b61891b66ee272940000592682127748eaf
X-Patchwork-Hint: ignore
Message-Id: <20240229220114.CA51287E1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/python-esptool:
 add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=82969b61891b66ee272940000592682127748eaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:espressif:esptool is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/AC284820-5731-4100-91BC-F50FE078848E

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 81fab735aee5d052e02a1304fb537b001c7d69c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-esptool/python-esptool.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index c0709c64b1..cefed065a4 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -10,5 +10,7 @@ PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/a3/63/c757f50b6069
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
+PYTHON_ESPTOOL_CPE_ID_VENDOR = espressif
+PYTHON_ESPTOOL_CPE_ID_PRODUCT = esptool
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
