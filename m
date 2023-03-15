Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD72C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 07:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8C1081208;
	Wed, 15 Mar 2023 07:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8C1081208
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JkGZy6UOF54E; Wed, 15 Mar 2023 07:16:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 187D381076;
	Wed, 15 Mar 2023 07:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 187D381076
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 424BA1BF47E
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 07:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2989140503
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 07:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2989140503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7d-6a6CF04MM for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 07:16:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67C5640139
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 07:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67C5640139
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54CC4873BB; Wed, 15 Mar 2023 07:16:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 08:11:25 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: b110ed88653201e0cd856fc5d2a3af709475fe65
X-Git-Newrev: 88f42191722586f6ebcd2882b4b258055e648f86
X-Patchwork-Hint: ignore
Message-Id: <20230315071625.54CC4873BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/quazip: add
 QUAZIP_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=88f42191722586f6ebcd2882b4b258055e648f86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

cpe:2.3:a:quazip_project:quazip is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aquazip_project%3Aquazip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 25c67417160b176776233aad9b0d685643695f8e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quazip/quazip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 7731e59d94..7d58877ac2 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -12,5 +12,6 @@ QUAZIP_DEPENDENCIES = \
 	qt5base
 QUAZIP_LICENSE = LGPL-2.1
 QUAZIP_LICENSE_FILES = COPYING
+QUAZIP_CPE_ID_VENDOR = quazip_project
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
