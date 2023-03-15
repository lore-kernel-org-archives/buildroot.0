Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9930CC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 07:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E58C81499;
	Wed, 15 Mar 2023 07:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E58C81499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIeGAfRqw7nj; Wed, 15 Mar 2023 07:13:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51D5881453;
	Wed, 15 Mar 2023 07:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51D5881453
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B7D31BF47E
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 07:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C301781076
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 07:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C301781076
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFpgD4ClDSI8 for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 07:12:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBFC980FAE
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 07:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBFC980FAE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB3978739E; Wed, 15 Mar 2023 07:12:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 08:11:19 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b88eb874cf0268be7b76bda7d05c0178e59d5896
X-Git-Newrev: 61425d7a6c9b6963131255f24b8270614cc0f2b5
X-Patchwork-Hint: ignore
Message-Id: <20230315071247.DB3978739E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/quazip: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=61425d7a6c9b6963131255f24b8270614cc0f2b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index 44645ec9b9..ac04fda619 100644
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
