Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4A3C47DB7
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 23:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 409094046B;
	Sat, 20 Jan 2024 23:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 409094046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GAdeq58P1zNj; Sat, 20 Jan 2024 23:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AF4D40B0E;
	Sat, 20 Jan 2024 23:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AF4D40B0E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EACB1BF21A
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CAB040A88
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CAB040A88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GxzSlS-ufwPa for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 23:03:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0470F40A90
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 23:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0470F40A90
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4B998634D; Sat, 20 Jan 2024 23:03:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 23:58:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5a20c7f245313ead143b0c30060e49e1f90d40a
X-Git-Newrev: 4d361c3d32eb368e479eb65ac6df625804fa805b
X-Patchwork-Hint: ignore
Message-Id: <20240120230317.E4B998634D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-html5lib: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d361c3d32eb368e479eb65ac6df625804fa805b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:html5lib:html5lib is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/97A353CC-7402-4606-93CA-111308296748

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-html5lib/python-html5lib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-html5lib/python-html5lib.mk b/package/python-html5lib/python-html5lib.mk
index 84229eabd0..320ef01c7a 100644
--- a/package/python-html5lib/python-html5lib.mk
+++ b/package/python-html5lib/python-html5lib.mk
@@ -10,5 +10,7 @@ PYTHON_HTML5LIB_SITE = https://files.pythonhosted.org/packages/ac/b6/b55c3f49042
 PYTHON_HTML5LIB_LICENSE = MIT
 PYTHON_HTML5LIB_LICENSE_FILES = LICENSE
 PYTHON_HTML5LIB_SETUP_TYPE = setuptools
+PYTHON_HTML5LIB_CPE_ID_VENDOR = html5lib
+PYTHON_HTML5LIB_CPE_ID_PRODUCT = html5lib
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
