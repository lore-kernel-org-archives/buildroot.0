Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52810C4167D
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 12:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E4F083A4D;
	Fri, 10 Nov 2023 12:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E4F083A4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ob9WjAtrRKl5; Fri, 10 Nov 2023 12:27:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54EF083A4C;
	Fri, 10 Nov 2023 12:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54EF083A4C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A26171BF37C
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 12:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C79E60BAD
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 12:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C79E60BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZL1FppUggWII for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 12:27:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2097E60FB5
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 12:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2097E60FB5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10FDB86F32; Fri, 10 Nov 2023 12:27:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 13:00:17 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: fc4bccfa25fd0456ba45f636b61a2f40479c91ac
X-Git-Newrev: ad9fb6063dcd3beb5a43f53b5099da80560bb21e
X-Patchwork-Hint: ignore
Message-Id: <20231110122704.10FDB86F32@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/kvmtool: add
 KVMTOOL_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad9fb6063dcd3beb5a43f53b5099da80560bb21e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

cpe:2.3:a:kvmtool_project:kvmtool is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/9B4C8068-B4EB-487F-958A-353BD3F494D1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 718a800828cc16131322e5c618c8dde42a8c8123)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kvmtool/kvmtool.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index df6ae7e0f1..9c58e44876 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -17,6 +17,7 @@ KVMTOOL_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_ZLIB),zlib)
 KVMTOOL_LICENSE = GPL-2.0
 KVMTOOL_LICENSE_FILES = COPYING
+KVMTOOL_CPE_ID_VENDOR = kvmtool_project
 
 # Disable -Werror, otherwise musl is not happy
 KVMTOOL_MAKE_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
