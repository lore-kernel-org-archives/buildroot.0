Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F14AE77180
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 22:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B565608A2;
	Mon,  9 Dec 2024 22:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8FIfojbFlBD; Mon,  9 Dec 2024 22:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F01CF608C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F01CF608C6;
	Mon,  9 Dec 2024 22:42:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E809ED2
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92249605A1
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXykIBjYGSSt for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 22:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1712605B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1712605B0
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:42:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE02E86B5E; Mon,  9 Dec 2024 22:42:27 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Dec 2024 23:34:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba08a37af572397aef2b38de8f45381d12f7f441
X-Git-Newrev: abad994acd5bf0eade1c19482c9df2f3581325dc
X-Patchwork-Hint: ignore
Message-Id: <20241209224227.CE02E86B5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyasynchat: fix 'library'
 typo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=abad994acd5bf0eade1c19482c9df2f3581325dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyasynchat/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyasynchat/Config.in b/package/python-pyasynchat/Config.in
index bf11cc5b39..17204a1b30 100644
--- a/package/python-pyasynchat/Config.in
+++ b/package/python-pyasynchat/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PYTHON_PYASYNCHAT
 	  Make asynchat available for Python 3.12 onwards.
 
 	  This is a compatibility package using the code removed from
-	  the standard libary, upstream does not intend any
+	  the standard library, upstream does not intend any
 	  maintenance.
 
 	  https://github.com/simonrob/pyasynchat
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
