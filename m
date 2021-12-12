Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ADAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7C1B61CE7;
	Sun, 12 Dec 2021 15:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5UbBd3eCI0r; Sun, 12 Dec 2021 15:08:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2862060E88;
	Sun, 12 Dec 2021 15:08:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5F91BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58A2A40961
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7wvmv3GYABI for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:07:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A1B340439
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:07:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9E09F83473; Sun, 12 Dec 2021 15:02:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 16:07:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 042656017682f788644c46c0f7de23a832410eac
X-Git-Newrev: 1e60b6f1da53c8192d79c9f8c7c029bb3fee63ea
X-Patchwork-Hint: ignore
Message-Id: <20211212150245.9E09F83473@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/davinci-bootcount: add myself to
 DEVELOPERS
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e60b6f1da53c8192d79c9f8c7c029bb3fee63ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add myself to DEVELOPERS as maintainer of davinci-bootcount.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3023526427..adfd1b76fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -631,6 +631,9 @@ F:	package/lua-cjson/
 F:	package/luaexpat/
 F:	package/xinetd/
 
+N:	Dario Binacchi <dariobin@libero.it>
+F:	package/davinci-bootcount/
+
 N:	David Bachelart <david.bachelart@bbright.com>
 F:	package/ccrypt/
 F:	package/dos2unix/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
