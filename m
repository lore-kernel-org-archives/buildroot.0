Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA92AC47DB7
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 23:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95E1440012;
	Sat, 20 Jan 2024 23:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95E1440012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X16cDTlzOz33; Sat, 20 Jan 2024 23:04:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 655EB40A91;
	Sat, 20 Jan 2024 23:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 655EB40A91
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 351991BF21A
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A41340012
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A41340012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ayN25sgN6Naw for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 23:03:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C87B640A88
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 23:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C87B640A88
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2C768634E; Sat, 20 Jan 2024 23:03:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 23:58:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71ff1bd8a4f945ce405a941f806c54b73cf551d5
X-Git-Newrev: 5f905f06bdf212520ab1f37179b5b6d5a2dee132
X-Patchwork-Hint: ignore
Message-Id: <20240120230317.B2C768634E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-oauthlib: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f905f06bdf212520ab1f37179b5b6d5a2dee132
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:oauthlib_project:oauthlib is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/204A2244-7F74-4AAE-BA8E-E9FE707EC833

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-oauthlib/python-oauthlib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index 1e49487d6a..eb0ccbf46f 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -10,5 +10,7 @@ PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/6d/fa/fbf40010379
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
+PYTHON_OAUTHLIB_CPE_ID_VENDOR = oauthlib_project
+PYTHON_OAUTHLIB_CPE_ID_PRODUCT = oauthlib
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
