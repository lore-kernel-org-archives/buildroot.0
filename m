Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12939C433EF
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 16:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1F8C8266C;
	Tue, 30 Nov 2021 16:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQBIabs0NJF4; Tue, 30 Nov 2021 16:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EA6280F00;
	Tue, 30 Nov 2021 16:12:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27C431BF2F0
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79D5B606B1
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHSEavxkB7Jk for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 16:11:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA99A615FC
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 16:11:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6B0D7920D9; Tue, 30 Nov 2021 16:07:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 17:06:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 563a3aa2397662e3b2adbddd077d187e8eedea7d
X-Git-Newrev: 75dd127b029752e6fe784f04865eae0503437c60
X-Patchwork-Hint: ignore
Message-Id: <20211130160702.6B0D7920D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/datatables: drop spurious space
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

commit: https://git.buildroot.net/buildroot/commit/?id=75dd127b029752e6fe784f04865eae0503437c60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious space added by commit
3995a68e2103a484f089c98b8d6ce9a81081762f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/datatables/datatables.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/datatables/datatables.mk b/package/datatables/datatables.mk
index 7bd3d83ac3..c20cdf1254 100644
--- a/package/datatables/datatables.mk
+++ b/package/datatables/datatables.mk
@@ -6,7 +6,7 @@
 
 DATATABLES_VERSION = 1.10.20
 DATATABLES_SITE = https://datatables.net/releases
-DATATABLES_SOURCE =  DataTables-$(DATATABLES_VERSION).zip
+DATATABLES_SOURCE = DataTables-$(DATATABLES_VERSION).zip
 DATATABLES_LICENSE = MIT
 DATATABLES_LICENSE_FILES = license.txt
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
