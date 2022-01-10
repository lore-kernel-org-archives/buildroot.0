Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A45C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 13:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D7EC829BB;
	Mon, 10 Jan 2022 13:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-i5w3a-DWPs; Mon, 10 Jan 2022 13:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF36681771;
	Mon, 10 Jan 2022 13:49:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DEE21BF3EA
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 13:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89D3B81771
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 13:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f3R5aiPMKGJS for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 13:49:48 +0000 (UTC)
X-Greylist: delayed 00:07:08 by SQLgrey-1.8.0
Received: from da1vs03.rockwellcollins.com (da1vs03.rockwellcollins.com
 [205.175.227.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD7868143F
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 13:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rockwellcollins.com; s=hrcrc2020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h/7f/aOmEEbCNij4KODS35DSXkQIiFIt673/dUcl700=;
 b=ptR3JnD3lDcsy9DEWOSFxZMv1pWLwE5v6xkLdfac3uXGOenysOHA0Ns3
 XqNYg7twJf3yy+WN2vm0KYrgxvtTNi4oBF+s2YutbZC4jyMyMkEtmd8t/
 a3t+jRqOUXZ/gLQNWFPNWqIKqKTM9g6xZ2rqhPQy1fgu2hE4H4VxQgTPV
 2Sazh3ynVzFCOInFRkwjjf1TPzdH6mpSCILtoeXAp3DQoT9p+DEgn3/Q8
 GWg8bNSLE2R8/SIUfnMSNkdAGedHHdL5/oXXiSSqSqkh7eGRo9MewZC/M
 6faNKrdnG7j4/kVVA8gpjDF/88wb2Ua0qi/JJkPJfUGpAkeXVEpyQz3ek Q==;
IronPort-SDR: qj47Tbm9lnmaWsL0w8LX2Im1lpCBSEzPyXXJS+sdA3zoQtUoZAk7zxGYxUrCCnS4NXlHwYaZr/
 hhOlYbf/slfuosbFGHY6WDlME+7J2lWd6hiBfXXQ3vL2jsjyq0Nk9Cueje3zDABuWlEwhGBBfJ
 umxI3bdtgUjgr4UNmbTLPAJc2QnSUuBwwi709NhXLWlKTz1mXLG7/usO/WDf1j28iGEngd8fIs
 HHHg7dogPOouLThRuKWBWFGecchgsYRRUNCEv8dvUUOyPXOZGfXXD+yy8/L9DqL+UyimI7e0b4
 cXk=
Received: from ofwda1n02.rockwellcollins.com (HELO
 crulimr02.rockwellcollins.com) ([205.175.227.14])
 by da1vs03.rockwellcollins.com with ESMTP; 10 Jan 2022 07:42:40 -0600
X-Received: from INM01314.rockwellcollins.com (inm01314.rockwellcollins.com
 [10.142.222.36])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id DEC926085D;
 Mon, 10 Jan 2022 07:42:34 -0600 (CST)
From: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 19:12:29 +0530
Message-Id: <20220110134229.1381-1-santosh.multhalli@rockwellcollins.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] Removed Santosh Multhalli
 (santosh.multhalli@rockwellcollins.com) as active developer of valjson
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
Cc: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>,
 matthew.weber@collins.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
---
 DEVELOPERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 215506c71c..3a530aa3f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1761,8 +1761,6 @@ F:	package/urg/
 F:	package/ussp-push/
 F:	support/misc/toolchainfile.cmake.in
 
-N:	Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
-F:	package/valijson/
 
 N:	Scott Fan <fancp2007@gmail.com>
 F:	package/libssh/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
