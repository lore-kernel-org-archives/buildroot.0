Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FE7C54798
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 22:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0813982F92;
	Thu, 29 Feb 2024 22:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TgRap_anZa0R; Thu, 29 Feb 2024 22:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FEB682BF4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FEB682BF4;
	Thu, 29 Feb 2024 22:02:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D0911BF25B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 22:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EB3D8249E
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 22:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o31BNAD5tIBu for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 22:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B10678225B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B10678225B
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 22:02:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A94EC87E24; Thu, 29 Feb 2024 22:02:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 22:59:54 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 631ed7b7be884e218bc175e00bf096e4fb411c4d
X-Git-Newrev: cb7360f760a0f7d5ecfb85fe51c54c0233822c16
X-Patchwork-Hint: ignore
Message-Id: <20240229220220.A94EC87E24@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-esptool:
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb7360f760a0f7d5ecfb85fe51c54c0233822c16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
index 0a71e1a78b..a8b3cbc1d6 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -10,5 +10,7 @@ PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/8b/4c/82d7fe5fa064
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
