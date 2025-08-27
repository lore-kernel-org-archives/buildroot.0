Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651F5CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 21:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 291026125B;
	Wed, 27 Aug 2025 21:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bE537NG9PGyZ; Wed, 27 Aug 2025 21:56:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CDBD61266
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CDBD61266;
	Wed, 27 Aug 2025 21:56:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA38AB8C
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 21:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E803940789
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 21:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCl9edjV38RJ for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 21:56:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45040407CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45040407CA
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 21:56:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2ECFB87BF1; Wed, 27 Aug 2025 21:56:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Aug 2025 23:55:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34b585c099cf42af9076900ae4f5288d9872323d
X-Git-Newrev: e13a3c95c111168b1bfe0ec9fdb0879a83490b18
X-Patchwork-Hint: ignore
Message-Id: <20250827215640.2ECFB87BF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: upgrade Andreas Ziegler's
 email address
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e13a3c95c111168b1bfe0ec9fdb0879a83490b18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old one lasted for 10 years, lately spam
levels reached a rather uncomfortable level ...

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8915eb6738..537a8bc516 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -187,7 +187,7 @@ F:	package/pkg-qmake.mk
 F:	package/qt5/qt5opcua/
 F:	package/qt6/qt6opcua/
 
-N:	Andreas Ziegler <br015@umbiko.net>
+N:	Andreas Ziegler <br025@umbiko.net>
 F:	package/mpd/
 
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
