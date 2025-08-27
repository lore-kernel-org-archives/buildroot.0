Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40248CA0EFF
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 06:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFAD6811B5;
	Wed, 27 Aug 2025 06:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwytoY_EJoXO; Wed, 27 Aug 2025 06:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5967811AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5967811AF;
	Wed, 27 Aug 2025 06:02:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E407CB8C
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 06:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5FD060BFF
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 06:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-rkvLktzrBc for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 06:02:44 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83E6960BFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83E6960BFC
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83E6960BFC
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 06:02:43 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 950EABDE3DFC;
 Wed, 27 Aug 2025 07:56:01 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br015@umbiko.net>
Date: Wed, 27 Aug 2025 07:55:48 +0200
Message-ID: <20250827055548.1739-1-br015@umbiko.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1756274161; bh=+XKHtL3OijrUwy0jc8fNKejhuuYSJXU7sNFlxjSG7GY=;
 h=From:To:Cc:Subject:Date;
 b=NmimfLG6kORoA/31IBPH+TS+Dp1cbWYEdbBqzqqKqBYWvg7ZBbFwsLEX5+QPO2RTA
 PxsoL1HWBsKKbyAcG1HkkwYBPyrA4PkulWa8aNMwMgKje4ry5JPCcpwL72wpwV11pE
 ngiGCsJIgYpGdZ5GkJpL8vIPi5bnUL03F4BjXbHA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=NmimfLG6
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: upgrade Andreas Ziegler's email
 address
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The old one lasted for 10 years, lately spam 
levels reached a rather uncomfortable level ... 

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
