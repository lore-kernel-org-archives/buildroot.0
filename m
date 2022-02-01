Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6244AC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 17:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18247825B9;
	Tue,  1 Feb 2022 17:41:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A-xVpi0o_07y; Tue,  1 Feb 2022 17:41:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 548A181839;
	Tue,  1 Feb 2022 17:41:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BA001BF396
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C13D81839
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8R86HLH4qudU for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 17:41:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC9D6817C3
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 17:41:21 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ex9bnfDjtQUuPEx9bnj43t; Tue, 01 Feb 2022 18:41:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643737280; bh=z7pYeUxnV7epkvpIioiFXcrozG98XalOdziWhzUOYpE=;
 h=From:To:Subject:Date:MIME-Version;
 b=LLZ69nBhF9iWKoFfoaSVC3FFNf/YZcffJ8n8EmMt3r58z/bJl1plcevYP6gdoa1GX
 5EXpmgDdevupgtC6uJE9TQlxVXSDZAF3viQ3+MoEJ9cTNmj9ZwwYAyV4FRVc5f4KkZ
 JuMEGdaC7z94DC62RNC7Aiy7Y7nx/RMGwqS0GazCAOUR5l+8LVKDkNa6teIdXfnRFU
 IZ4W7v/0ROGKFNMJaguq7VY2S9UnbZwS/cHg/s1OksI8qyCn2UFLkMyBiy+8YKDUB0
 db4IuqKnWS9vs1E4FjogQXxo8DMBdWZfzR6iVn08NOn95RIUXmvHuuuq+CZO8fpE2+
 01CjN9OoRahlg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 18:41:18 +0100
Message-Id: <20220201174118.277366-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBre3b0m2GPkVR8HBRTPTnulurSJ2dSYmd1EVz3GSu+3TV2/v2YOZfEpZdBxxXcMR/8wa5Tu0+6x5RSbwe9vAHVSMjlKriDL8Q0ERTqWBMOBdgl43Ogk
 RSQl42TsSvkHug6HWlj3Xuz9GmeutVcLOExkRNVE7ERGPLJj2WL4y1fFyf30gPJzC1Ve/tM0G6cwg4U+d0xLBq2AIoF7jEhHljBJD8ywSIfcrw77jpK0Ulay
 9GVRjqWakGjcHGj3ou5Mg4mA8B3KNa4VIwJhrBwDMhs=
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
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
