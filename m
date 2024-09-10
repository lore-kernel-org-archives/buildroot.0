Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B298EDE9BF
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 699E661189;
	Tue, 10 Sep 2024 20:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60dISWVtqxiz; Tue, 10 Sep 2024 20:53:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 441B4611A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 441B4611A9;
	Tue, 10 Sep 2024 20:53:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 463D41BF95A
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A392409FE
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKYqPv2XuuNS for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDB24409FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDB24409FD
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9F2D85132; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a66a2af64abbf1e501fd3c7d79bd41cea36a244
X-Git-Newrev: c31189363b65b390fe8c0fddf03f26f933451d89
X-Patchwork-Hint: ignore
Message-Id: <20240910205131.E9F2D85132@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go-src: fix variable typo in patch
 description
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

commit: https://git.buildroot.net/buildroot/commit/?id=c31189363b65b390fe8c0fddf03f26f933451d89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
