Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1A8C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:17:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55D8361108
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55D8361108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31A3F60FF0;
	Thu,  7 Oct 2021 20:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zi23FQsMEpcC; Thu,  7 Oct 2021 20:17:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95A2D60FF5;
	Thu,  7 Oct 2021 20:17:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79BAD1BF9C2
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A12E843B9
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VUUNY0pXRoP0 for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 20:16:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7ED5842DC
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 20:16:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C4F76934EC; Thu,  7 Oct 2021 20:14:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Oct 2021 22:16:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb465e2f62e9b74c59e23f307d999c4c546e5459
X-Git-Newrev: 96464f756217cd6bf7a1e17078f3671c4478d2e5
X-Patchwork-Hint: ignore
Message-Id: <20211007201417.C4F76934EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: change project URL to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=96464f756217cd6bf7a1e17078f3671c4478d2e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apache/Config.in b/package/apache/Config.in
index 693ee20a1b..8b6a5bf7ea 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_APACHE
 	  server that provides HTTP services in sync with the current
 	  HTTP standards.
 
-	  http://httpd.apache.org
+	  https://httpd.apache.org
 
 if BR2_PACKAGE_APACHE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
