Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80451C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 10:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49112402C3;
	Sat,  8 Jan 2022 10:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3uLSOZJU-Oxg; Sat,  8 Jan 2022 10:07:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF0D0402AF;
	Sat,  8 Jan 2022 10:07:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 262941BF84C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2216281699
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYz6p9W4rXAf for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 10:07:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37B9F815CD
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:07:07 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout06.t-online.de (Postfix) with SMTP id 93AB81D0CC;
 Sat,  8 Jan 2022 11:07:04 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.177.158]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n68cp-0STw5B0; Sat, 8 Jan 2022 11:07:03 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55044)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n68cp-0006Ev-Cf;
 Sat, 08 Jan 2022 11:07:03 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 11:07:03 +0100
Message-Id: <20220108100703.1104859-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1641636423-000116DC-7AC77457/0/0 CLEAN NORMAL
X-TOI-MSGID: e2058a9e-59c7-454e-b69b-bb962ca08598
Subject: [Buildroot] [PATCH 1/1] package/waf: bump version to 2.0.23
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://gitlab.com/ita1024/waf/blob/master/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/waf/waf.hash | 6 +++---
 package/waf/waf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index e9d387e7d0..21f47f76d8 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha1  494ada411468129ed229f946ecec3048400e320b  waf-2.0.22
-sha256  0a09ad26a2cfc69fa26ab871cb558165b60374b5a653ff556a0c6aca63a00df1  waf-2.0.22
+sha1  89b24f9c19328339c2c8103796755474b66f3a8d  waf-2.0.23
+sha256  28a2e4583314a162cfcbffefb8a9202c1d7869040d30b5852da479b76d9c0491  waf-2.0.23
 
 # The waf script also contains its license, but is renamed `waf` in the extract
 # step, so this is a synonym for the above, to check WAF_LICENSE
-sha256  0a09ad26a2cfc69fa26ab871cb558165b60374b5a653ff556a0c6aca63a00df1  waf
+sha256  28a2e4583314a162cfcbffefb8a9202c1d7869040d30b5852da479b76d9c0491  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index 5cc0dc3714..2b1808ace4 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.0.22
+WAF_VERSION = 2.0.23
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 WAF_LICENSE = BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
