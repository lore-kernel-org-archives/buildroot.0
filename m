Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4C2C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCBA841843;
	Wed, 28 Feb 2024 21:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aY602W66e-VT; Wed, 28 Feb 2024 21:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FA914183A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FA914183A;
	Wed, 28 Feb 2024 21:27:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B9D61BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8907E41722
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fUhC77Bhf7Nf for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DF724175B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DF724175B
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8418087CA0; Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:21:45 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 801051154b62c21b3e8014cf2544ca51dcb14ee7
X-Git-Newrev: 3f2145c0848e9114bbd5412285cd300d802d7a0f
X-Patchwork-Hint: ignore
Message-Id: <20240228212549.8418087CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-aiohttp:
 update PYTHON_AIOHTTP_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f2145c0848e9114bbd5412285cd300d802d7a0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:aiohttp_project:aiohttp has been deprecated in favor of
cpe:2.3:a:aiohttp:aiohttp in November 2023:

  <cpe-item name="cpe:/a:aiohttp_project:aiohttp:3.8.0:beta0" deprecated="true" deprecation_date="2023-11-22T17:09:16.157Z">
    <title xml:lang="en-US">Aiohttp Project Aiohttp 3.8.0 Beta 0</title>
      <reference href="https://github.com/aio-libs/aiohttp/releases">Change Log</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:aiohttp_project:aiohttp:3.8.0:beta0:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:aiohttp:aiohttp:3.8.0:beta0:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a01deb6617ff38914f649f88c71e7c0c5ee71b01)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-aiohttp/python-aiohttp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 8b0b15f13b..8944b5f77f 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -10,7 +10,7 @@ PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/ff/4f/62d9859b7d4e
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
