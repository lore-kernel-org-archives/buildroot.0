Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F00BC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1615481306;
	Tue, 27 Dec 2022 20:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1615481306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1IkvNp6Sn-H; Tue, 27 Dec 2022 20:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C6F881410;
	Tue, 27 Dec 2022 20:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C6F881410
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E83761BF37A
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C21F0402F7
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C21F0402F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LeqJd6w_du6B for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:28:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE480402C3
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE480402C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC96F86E8B; Tue, 27 Dec 2022 20:28:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 21:27:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82edf126c98bbf652de917892f25ea6d37f99bb9
X-Git-Newrev: 02cc05e757970a23da3c0818f275d465a4c1f280
X-Patchwork-Hint: ignore
Message-Id: <20221227202820.CC96F86E8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add myself to more packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=02cc05e757970a23da3c0818f275d465a4c1f280
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5eed4a8455..48e7e08b3a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2105,12 +2105,16 @@ F:	package/gnuplot/
 F:	package/sdl2/
 
 N:	Michael Nosthoff <buildroot@heine.tech>
+F:	package/boost/
+F:	package/fmt/
 F:	package/grpc/
 F:	package/gtest/
+F:	package/json-for-modern-cpp/
 F:	package/libabseil-cpp/
 F:	package/networkd-dispatcher/
 F:	package/protobuf/
 F:	package/re2/
+F:	package/spdlog/
 
 N:	Michael Rommel <rommel@layer-7.net>
 F:	package/knock/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
