Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1B0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 22:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F2BF40204;
	Sat, 18 Dec 2021 22:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FpI-cFH9NYbX; Sat, 18 Dec 2021 22:49:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBDBF400C1;
	Sat, 18 Dec 2021 22:49:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF1791BF5AE
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1F53607C1
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1VmyjoH6ANNL for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 22:49:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1833860768
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 22:49:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9F6D97F908; Sat, 18 Dec 2021 22:44:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 23:48:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb3fec9d64e765d7485cf4b7b09bd18cc68dd328
X-Git-Newrev: aab198fdd48de28905d16955fd8964fab3db3c42
X-Patchwork-Hint: ignore
Message-Id: <20211218224419.9F6D97F908@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenaptx: fix typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=aab198fdd48de28905d16955fd8964fab3db3c42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace libogg by libopenaptx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libopenaptx/libopenaptx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenaptx/libopenaptx.mk b/package/libopenaptx/libopenaptx.mk
index a4f58050b7..75a5532e96 100644
--- a/package/libopenaptx/libopenaptx.mk
+++ b/package/libopenaptx/libopenaptx.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# libogg
+# libopenaptx
 #
 ################################################################################
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
