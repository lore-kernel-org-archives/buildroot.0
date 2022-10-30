Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E663C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99373402EF;
	Sun, 30 Oct 2022 21:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99373402EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ila62OHaueJF; Sun, 30 Oct 2022 21:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87DF1402C5;
	Sun, 30 Oct 2022 21:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87DF1402C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 779921BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51E3E812AC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51E3E812AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l4x_zSh0iLeE for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:25:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A928812D8
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A928812D8
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:25:33 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout05.t-online.de (Postfix) with SMTP id 4DDEE795B
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:25:30 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.145]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1opFoA-37Zsbx0; Sun, 30 Oct 2022 22:25:30 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:50744)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1opFo9-00080D-2e
 for buildroot@buildroot.org; Sun, 30 Oct 2022 22:25:29 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 22:25:29 +0100
Message-Id: <20221030212529.364240-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667165130-737F181F-46DAD3B8/0/0 CLEAN NORMAL
X-TOI-MSGID: b38602a7-5660-474b-91bb-86a318c7253e
Subject: [Buildroot] [PATCH 1/1] package/exim: fix typo in comment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/exim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index e0fcd83fb0..9c54eeec44 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -20,7 +20,7 @@ define exim-config-change # variable-name, variable-value
 		$(@D)/Local/Makefile
 endef
 
-# Comment-out a variable. Has no effect if it does not exits.
+# Comment-out a variable. Has no effect if it does not exist.
 define exim-config-unset # variable-name
 	$(SED) 's,^\([[:space:]]*$1[[:space:]]*=.*$$\),# \1,' \
 		$(@D)/Local/Makefile
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
