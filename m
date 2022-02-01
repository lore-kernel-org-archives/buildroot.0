Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831DEC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 17:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21B15415E2;
	Tue,  1 Feb 2022 17:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nzYouPn_1GUx; Tue,  1 Feb 2022 17:42:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 753BA4162D;
	Tue,  1 Feb 2022 17:42:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41BAD1BF396
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E6D8415D9
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZEAxwxasgYu for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 17:42:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4EEE415D5
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 17:42:04 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ExAInsdi7roAhExAJnY9t4; Tue, 01 Feb 2022 18:42:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643737323; bh=z7pYeUxnV7epkvpIioiFXcrozG98XalOdziWhzUOYpE=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ivz7rDF5kW1bx9uN/uICYcAJ6zk/0qrt+AgHENeoEgTLsxoiosx7WtQAwZW+S8gRN
 z+N9MubD7V2sNBvYS3qGIfDj9PAognHL8NmAoHHAVBlu82CgRxdSe3rsk08mNaIosA
 CI7ImYDc9HqQIGRFGht8MDunhtkAqk/c6JkmGlCDEkE/vdhSMHdbrGD1ksPJNQ1R1W
 FOKYvTZ8aPljiWlxr8b1U/PTpk2fTDrEwYyh5UVy13DgPLyFz+D3Y+XnqmQU3gKlUd
 W2Lf0MI54cDWElAiz3Lqk7HppRwgq7SZxfpcYwLyvcK97QzewJSsnI3jrfsFG07Gge
 bDd2Okak6kh3A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 18:42:02 +0100
Message-Id: <20220201174202.286878-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGYc07N90Gy9oXtM+qFjSz7pdp+376opJKHHXTARo+/gs9uYdYppDRtSoDvmo5kaD2XHwurs0AfDLRl+OFeUXHT2heWliaGASMlmRklnn/4b+xuhzKB6
 yDXZf7dE8cIvtuIV/jkHJn2fw7f/VyVBAPH8HBPKgI4j76IhzISXx+Wgt0wYMJc0qXD5BMcwho953CTRzX0R+RsrgiYcnBgyejgHxhI3rejDD74qfSA38t2d
 e8ITUUb1Ia5ktYilTju16OrrVa6uYT/IKC2gwdinVj1LXbi4E768VNcVKtooGSRU
Subject: [Buildroot] [PATCH] DEVELOPERS: remove Martin Hicks from file
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Martin Hicks <mort@bork.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Martin Hicks asked to not maintain cryptsetup anymore:
https://lists.buildroot.org/pipermail/buildroot/2022-February/635413.html

Also he doesn't mantain any other package, so let's remove him from this
file.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5255b096b0..555723867e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1847,9 +1847,6 @@ F:	package/rpi-firmware/
 F:	package/tzdata/
 F:	package/zic/
 
-N:	Martin Hicks <mort@bork.org>
-F:	package/cryptsetup/
-
 N:	Martin Kepplinger <martink@posteo.de>
 F:	package/tslib/
 F:	package/x11r7/xdriver_xf86-input-tslib/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
