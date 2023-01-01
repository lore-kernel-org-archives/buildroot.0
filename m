Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F7DC4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 16:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32DEC60B26;
	Sun,  1 Jan 2023 16:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32DEC60B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3aMcQacqqxq3; Sun,  1 Jan 2023 16:49:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A80460AD5;
	Sun,  1 Jan 2023 16:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A80460AD5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A3D1A1BF3F9
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 16:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F68460AD5
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 16:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F68460AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9n5HWGDpVYq for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 16:49:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2EA460ACE
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 16:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2EA460ACE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF6F286DD1; Sun,  1 Jan 2023 16:49:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Jan 2023 16:56:59 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: c0a1f344c1be178589166739cb6ce1e6c5f0ee4f
X-Git-Newrev: 378f560fad786411e240f1bb75a6f8f5aa196738
X-Patchwork-Hint: ignore
Message-Id: <20230101164929.AF6F286DD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/exfat-utils: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=378f560fad786411e240f1bb75a6f8f5aa196738
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

cpe:2.3:a:exfat_project:exfat is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aexfat_project%3Aexfat

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8036b087489c96dfc4a0baf9fbe284a049a58298)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exfat-utils/exfat-utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index d13ec6bab8..fa471952f2 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -8,6 +8,8 @@ EXFAT_UTILS_VERSION = 1.3.0
 EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTILS_VERSION)
 EXFAT_UTILS_LICENSE = GPL-2.0+
 EXFAT_UTILS_LICENSE_FILES = COPYING
+EXFAT_UTILS_CPE_ID_VENDOR = exfat_project
+EXFAT_UTILS_CPE_ID_PRODUCT = exfat
 
 EXFAT_UTILS_CONF_OPTS += --exec-prefix=/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
