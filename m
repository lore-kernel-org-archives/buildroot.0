Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3DAC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4F0384F11;
	Sun,  4 Feb 2024 10:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4F0384F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gwKkynT6dE62; Sun,  4 Feb 2024 10:17:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29FA984F26;
	Sun,  4 Feb 2024 10:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29FA984F26
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14A6C1BF41D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E232C84F11
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E232C84F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnv5lSlngSVb for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22307821CB
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22307821CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11F40868DB; Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 11:16:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae2baf1771cbbebae65e32397480deec6bf879e4
X-Git-Newrev: a01deb6617ff38914f649f88c71e7c0c5ee71b01
X-Patchwork-Hint: ignore
Message-Id: <20240204101729.11F40868DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp: update
 PYTHON_AIOHTTP_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=a01deb6617ff38914f649f88c71e7c0c5ee71b01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:aiohttp_project:aiohttp has been deprecated in favor of
cpe:2.3:a:aiohttp:aiohttp in November 2023:

  <cpe-item name="cpe:/a:aiohttp_project:aiohttp:3.8.0:beta0" deprecated="true" deprecation_date="2023-11-22T17:09:16.157Z">
    <title xml:lang="en-US">Aiohttp Project Aiohttp 3.8.0 Beta 0</title>
      <reference href="https://github.com/aio-libs/aiohttp/releases">Change Log</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:aiohttp_project:aiohttp:3.8.0:beta0:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:aiohttp:aiohttp:3.8.0:beta0:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-aiohttp/python-aiohttp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 2cb9058b97..3dc822e832 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -10,7 +10,7 @@ PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/54/07/9467d3f8dae2
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-PYTHON_AIOHTTP_CPE_ID_VENDOR = aiohttp_project
+PYTHON_AIOHTTP_CPE_ID_VENDOR = aiohttp
 PYTHON_AIOHTTP_CPE_ID_PRODUCT = aiohttp
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
