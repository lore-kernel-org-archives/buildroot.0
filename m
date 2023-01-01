Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C50C4167B
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 18:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36653812C6;
	Sun,  1 Jan 2023 18:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36653812C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X-WwTEHcGAdr; Sun,  1 Jan 2023 18:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7320781066;
	Sun,  1 Jan 2023 18:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7320781066
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07BE81BF41A
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E46E7400CF
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E46E7400CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zot3HxPtj0G3 for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 18:27:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40CE540022
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 18:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40CE540022
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 308D587084; Sun,  1 Jan 2023 18:27:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Jan 2023 19:24:11 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: e68074e21e4b5e13dd0a4425edfdec72cd0bdbdc
X-Git-Newrev: 35fa0316c9f1d60c6202c93b6d17ce396474ed68
X-Patchwork-Hint: ignore
Message-Id: <20230101182744.308D587084@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] DEVELOPERS: add myself to
 more packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=35fa0316c9f1d60c6202c93b6d17ce396474ed68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 02cc05e757970a23da3c0818f275d465a4c1f280)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9adfa2e268..5a27587aac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2087,12 +2087,16 @@ F:	package/gnuplot/
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
