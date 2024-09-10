Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1CCECE582
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 07:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4460B409F8;
	Tue, 10 Sep 2024 07:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjHMVaZa8vLc; Tue, 10 Sep 2024 07:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EFBC4135A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EFBC4135A;
	Tue, 10 Sep 2024 07:10:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77CD91BF2C1
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BCEB6080F
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dp5uZ5b7KUwk for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 07:09:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6FF5460809
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FF5460809
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FF5460809
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:09:01 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id F3250C35D3
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6977020005;
 Tue, 10 Sep 2024 07:08:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1snuzd-00HS4t-2a;
 Tue, 10 Sep 2024 09:08:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 09:08:16 +0200
Message-Id: <20240910070823.4158894-37-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910070823.4158894-1-peter@korsgaard.com>
References: <20240910070823.4158894-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 36/42] package/go-src: fix variable typo in
 patch description
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-build.go-explicit-option-for-crosscompilation.patch    | 2 +-
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
