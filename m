Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700C4C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 20:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 238F081388;
	Sat, 28 Jan 2023 20:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 238F081388
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSqH2wT-xcG2; Sat, 28 Jan 2023 20:06:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EE6C81350;
	Sat, 28 Jan 2023 20:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EE6C81350
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 016801BF327
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFD6360DC2
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFD6360DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrgy0bu3BbWY for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 20:05:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B1C360E00
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 20:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B1C360E00
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7547787B39; Sat, 28 Jan 2023 20:05:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 21:03:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af2788ea2ff34e5795ed10df8703bf0f89fda1d7
X-Git-Newrev: 6b7ef8030c829ac04c4e78d3f2c878f5c9483a78
X-Patchwork-Hint: ignore
Message-Id: <20230128200546.7547787B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add myself to postgresql
 package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6b7ef8030c829ac04c4e78d3f2c878f5c9483a78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 83fa9e403d..4ead3a71f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2087,6 +2087,7 @@ F:	package/libgeos/
 F:	package/libosmium/
 F:	package/osm2pgsql/
 F:	package/postgis/
+F:	package/postgresql/
 F:	package/protozero/
 F:	package/timescaledb/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
