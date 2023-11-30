Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C6FC07CA9
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C2266F568;
	Thu, 30 Nov 2023 08:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C2266F568
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eEpJ3-SzQFIc; Thu, 30 Nov 2023 08:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C843B6F551;
	Thu, 30 Nov 2023 08:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C843B6F551
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5331BF23B
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 611AB408A4
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 611AB408A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3nrBX2CTG5C4 for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:38:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D28F4091E
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D28F4091E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C6A787602; Thu, 30 Nov 2023 08:38:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 09:28:07 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: ec2238b8bcdd114a1d0b0f0db9027f887e990c39
X-Git-Newrev: d8bc17fa2f7bdafdac86e07106de05b0668f1829
X-Patchwork-Hint: ignore
Message-Id: <20231130083815.6C6A787602@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/exfatprogs: add
 EXFATPROGS_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8bc17fa2f7bdafdac86e07106de05b0668f1829
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

cpe:2.3:a:namjaejeon:exfatprogs is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/F174A846-F275-4AD8-A0E3-6D0CEFDFF308

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3da62675d730eec9b402f8edd1de5e046e94d71d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exfatprogs/exfatprogs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index d755c7a214..fcc9ff0788 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -9,6 +9,7 @@ EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
 EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
 EXFATPROGS_LICENSE_FILES = COPYING
+EXFATPROGS_CPE_ID_VENDOR = namjaejeon
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
