Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6EDC4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2538405DF;
	Sat,  3 Feb 2024 18:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2538405DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a0MOsBIJHgE4; Sat,  3 Feb 2024 18:48:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7535F405E0;
	Sat,  3 Feb 2024 18:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7535F405E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB0361BF33E
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28BEA60A97
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:28:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zh5u4z4fWHR6 for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 12:28:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 11F9560AA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11F9560AA4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11F9560AA4
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 12:28:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B4DE86810; Sat,  3 Feb 2024 12:28:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Feb 2024 13:24:07 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: b47de9692e837bcf181210648d2a9ffff97cbe11
X-Git-Newrev: 19322a339e43b260508453698489ebd40648c764
X-Patchwork-Hint: ignore
Message-Id: <20240203122852.4B4DE86810@busybox.osuosl.org>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 spf=fail smtp.mailfrom=osuosl.org
Subject: [Buildroot] [git commit branch/2023.11.x] package/python-oauthlib:
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

commit: https://git.buildroot.net/buildroot/commit/?id=19322a339e43b260508453698489ebd40648c764
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:oauthlib_project:oauthlib is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/204A2244-7F74-4AAE-BA8E-E9FE707EC833

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5f905f06bdf212520ab1f37179b5b6d5a2dee132)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
