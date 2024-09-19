Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029BFCE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C65984172B;
	Thu, 19 Sep 2024 09:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibiFS8mn2gI3; Thu, 19 Sep 2024 09:16:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A02C416B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A02C416B6;
	Thu, 19 Sep 2024 09:16:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E28B1BF97E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1987841FD
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZAhTr0VxOwm for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DD2C84396
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DD2C84396
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A6248189C; Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:34 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: e9fe4e6cb9f4cdb6a37964c2e3934703c746a558
X-Git-Newrev: 506c14d8e1ff272c7ad4a3653d3d131030b9fb3f
X-Patchwork-Hint: ignore
Message-Id: <20240919091453.3A6248189C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/go-src: fix
 variable typo in patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=506c14d8e1ff272c7ad4a3653d3d131030b9fb3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c31189363b65b390fe8c0fddf03f26f933451d89)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch b/package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch
index 992a83a644..c7cf02ced2 100644
--- a/package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch
+++ b/package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch
@@ -7,7 +7,7 @@ Actually if GOHOSTOS == GOOS || GOHOSTARCH == GOARCH the go build system
 assume it's not cross compiling and uses the same toolchain also for the
 bootstrap.  This is a problem in case the cross compilation mandates a
 different toolchain for bootstrap and target.  This patch adds
-GO_ASSUME_CROSSCOMPILING varible to assure that in case of cross
+GO_ASSUME_CROSSCOMPILING variable to assure that in case of cross
 compilation CC_FOR_TARGET can be different from CC.
 
 Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
