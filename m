Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589D9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 17:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E7CF60B47;
	Sat, 23 Apr 2022 17:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id idWtxZ39UI5v; Sat, 23 Apr 2022 17:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81B5D60A6D;
	Sat, 23 Apr 2022 17:12:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF77A1BF5A1
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 17:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EAE440160
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 17:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ncgGwKNnfSku for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 17:12:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA332400E3
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 17:12:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 62A4084216; Sat, 23 Apr 2022 17:02:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 19:11:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6eefe2f8f443df4a284717b0dddf33566956e05a
X-Git-Newrev: 664f1fc1c7dce0ab62668f9ec5fe13d9e9faff2d
X-Patchwork-Hint: ignore
Message-Id: <20220423170211.62A4084216@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add myself for wtfutil
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

commit: https://git.buildroot.net/buildroot/commit/?id=664f1fc1c7dce0ab62668f9ec5fe13d9e9faff2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I forgot to do so when submitting the package, so let's fix that now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ca9decb58f..1bb90f8f33 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2987,6 +2987,7 @@ F:	package/vde2/
 F:	package/w_scan/
 F:	package/wayland/
 F:	package/weston/
+F:	package/wtfutil/
 F:	package/zisofs-tools/
 F:	support/download/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
