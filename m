Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE99DC25B4F
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 16:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2767F60B45;
	Tue,  7 May 2024 16:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wraa9y7yvvTJ; Tue,  7 May 2024 16:13:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1AA960B0A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1AA960B0A;
	Tue,  7 May 2024 16:13:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFEC61BF966
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD8BF60781
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0wzgevvHAdH for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 16:13:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30EFC605AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30EFC605AD
 for <buildroot@buildroot.org>; Tue,  7 May 2024 16:13:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18F2F86A25; Tue,  7 May 2024 16:13:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 May 2024 18:00:39 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 0155095c558e915d6c5261a4d8cb4ec9ee9953a7
X-Git-Newrev: c681f1dc7d3c6b88621fb77ad34bcbc85558cafe
X-Patchwork-Hint: ignore
Message-Id: <20240507161335.18F2F86A25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ttyd: set
 CPE_ID_VALID
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

commit: https://git.buildroot.net/buildroot/commit/?id=c681f1dc7d3c6b88621fb77ad34bcbc85558cafe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

cpe:2.3:a:ttyd_project:ttyd is a valid CPE identifier for this package:

    https://nvd.nist.gov/products/cpe/detail/DBEDA75E-4E19-48C1-92D7-43E4035BC048

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
[yann.morin.1998@free.fr: Move to its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7d4ba7eaf9ef352edbb120e256a270bbe0e2115d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ttyd/ttyd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
index d17e21d60b..b629e5a29c 100644
--- a/package/ttyd/ttyd.mk
+++ b/package/ttyd/ttyd.mk
@@ -9,5 +9,6 @@ TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
 TTYD_LICENSE = MIT
 TTYD_LICENSE_FILES = LICENSE
 TTYD_DEPENDENCIES = json-c libuv libwebsockets openssl zlib
+TTYD_CPE_ID_VALID = YES
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
