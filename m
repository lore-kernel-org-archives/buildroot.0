Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805C4C4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 17:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BAE141ECB;
	Sat,  3 Feb 2024 17:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BAE141ECB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XQAKS2aFOSFk; Sat,  3 Feb 2024 17:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7548041E63;
	Sat,  3 Feb 2024 17:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7548041E63
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 824E81BF834
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AB3B41747
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98bw4C3-EBKJ for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 12:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 821A041752
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 821A041752
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 821A041752
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 12:29:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E42F8688B; Sat,  3 Feb 2024 12:29:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Feb 2024 13:26:06 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d0dd00d5ea659efdee6554c81ee6b9a6be214859
X-Git-Newrev: 28454fa55706cd73001377cf6f55284e5ded7315
X-Patchwork-Hint: ignore
Message-Id: <20240203122959.4E42F8688B@busybox.osuosl.org>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 spf=fail smtp.mailfrom=osuosl.org
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-hpack: add
 CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=28454fa55706cd73001377cf6f55284e5ded7315
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:python:hpack is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/9DD17147-CB76-4A8F-BE82-4AE1BC7BFCD5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d00b3f17f663368733c035194874965e52f64ad6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-hpack/python-hpack.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-hpack/python-hpack.mk b/package/python-hpack/python-hpack.mk
index 3cf534d055..4b581c1001 100644
--- a/package/python-hpack/python-hpack.mk
+++ b/package/python-hpack/python-hpack.mk
@@ -10,5 +10,7 @@ PYTHON_HPACK_SITE = https://files.pythonhosted.org/packages/3e/9b/fda93fb4d957db
 PYTHON_HPACK_SETUP_TYPE = setuptools
 PYTHON_HPACK_LICENSE = MIT
 PYTHON_HPACK_LICENSE_FILES = LICENSE
+PYTHON_HPACK_CPE_ID_VENDOR = python
+PYTHON_HPACK_CPE_ID_PRODUCT = hpack
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
