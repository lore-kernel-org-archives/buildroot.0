Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D94C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 17:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD1C34036E;
	Mon, 30 Oct 2023 17:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD1C34036E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8rdPqs6-0qHt; Mon, 30 Oct 2023 17:24:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0327740176;
	Mon, 30 Oct 2023 17:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0327740176
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 926751BF3DA
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 17:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C40C60A47
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 17:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C40C60A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p0Km3iGwUn4Q for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 17:24:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 544536080B
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 17:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 544536080B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AFD4861BF; Mon, 30 Oct 2023 17:24:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 18:20:58 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 7aad5e1b433e4eb60a33c05474a6dcd2bffa8ce9
X-Git-Newrev: f8625442e96e5f098d354b71363d8855e811862e
X-Patchwork-Hint: ignore
Message-Id: <20231030172428.2AFD4861BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/zchunk: add
 ZCHUNK_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8625442e96e5f098d354b71363d8855e811862e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

cpe:2.3:a:zchunk:zchunk is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/480C0B83-3109-49EE-9E06-7866A54878CA

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3499c75ccf8b481fb3499a218920a3e276b09fa9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zchunk/zchunk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zchunk/zchunk.mk b/package/zchunk/zchunk.mk
index fc91f90431..2acdaba3a1 100644
--- a/package/zchunk/zchunk.mk
+++ b/package/zchunk/zchunk.mk
@@ -8,6 +8,7 @@ ZCHUNK_VERSION = 1.2.2
 ZCHUNK_SITE = $(call github,zchunk,zchunk,$(ZCHUNK_VERSION))
 ZCHUNK_LICENSE = BSD-2-Clause
 ZCHUNK_LICENSE_FILES = LICENSE
+ZCHUNK_CPE_ID_VENDOR = zchunk
 ZCHUNK_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
