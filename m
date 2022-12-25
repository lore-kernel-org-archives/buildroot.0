Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC982C4332F
	for <buildroot@archiver.kernel.org>; Sun, 25 Dec 2022 21:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05B1E80DB6;
	Sun, 25 Dec 2022 21:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05B1E80DB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QzSsBmPRUP6t; Sun, 25 Dec 2022 21:14:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D70B80C3E;
	Sun, 25 Dec 2022 21:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D70B80C3E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D15D1BF20D
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 21:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 558B780C3E
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 21:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 558B780C3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qyIaOPPbRXI for <buildroot@lists.busybox.net>;
 Sun, 25 Dec 2022 21:14:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23EA180C37
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23EA180C37
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 21:14:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C240D1814B9; Sun, 25 Dec 2022 22:14:19 +0100 (CET)
To: buildroot@buildroot.org
Date: Sun, 25 Dec 2022 22:13:54 +0100
Message-Id: <20221225211355.6668-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1672002861; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=GfO8zWvsjivmPOgttsQ0Bxv2w4gXGFl22cHlzoyzXlQ=;
 b=jiK2eSclogADs1itHXBSt3QprHcBw50ou5mDo74nPDYUSGhSwIs8TvXScvjX6ooDGfNsYU
 M1frib8fDXprGf7TfljUXjpAiu948oIpu/LVtWSEl/Ohb4oPaoVeYHGEyPGN2n+oHYKhLG
 ul/dIx91Pn6sSpIfHx3gRWBkcMPHG1w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=jiK2eScl
Subject: [Buildroot] [PATCH] DEVELOPERS: add myself to more packages
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
