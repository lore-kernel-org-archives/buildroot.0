Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA02C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 06:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BD2F60F95;
	Fri,  3 Jun 2022 06:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id POzg4t1oWl-v; Fri,  3 Jun 2022 06:46:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D0B060A9D;
	Fri,  3 Jun 2022 06:46:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71CA71C116E
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 06:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EB93408E8
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 06:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 78IbCNX0dXdv for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 06:46:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 758F240871
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 06:46:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B735286ACD; Fri,  3 Jun 2022 06:34:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Jun 2022 08:46:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a482624320a0f22c4bdc6c3a6ddefc3c75a21339
X-Git-Newrev: bb7182c3e340509b804d8cad0a362cf0a34af879
X-Patchwork-Hint: ignore
Message-Id: <20220603063433.B735286ACD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mutt: bump to version 2.2.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bb7182c3e340509b804d8cad0a362cf0a34af879
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mutt 2.2.5 was released on May 16, 2022: this is a bug-fix release,
fixing two issues with libgsasl authentication.

Mutt 2.2.4 was released on April 30, 2022: this is a bug-fix release,
fixing some regressions with Maildir/mh mailbox path normalization that
were added in 2.2.0. Please see the UPDATING file for more details.

https://gitlab.com/muttmua/mutt/-/blob/mutt-2-2-5-rel/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 952e0b7bc0..1f6082ee35 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  978addcdab454f447ed7d1de84b5767e714c30714285bf82e4a1745071d18d89  mutt-2.2.3.tar.gz
+sha256  ff8b781159794adcca126b551d5e419174b7b38a582a159bfe4e13451a757e47  mutt-2.2.5.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 45ae36530a..2c6b087b92 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.3
+MUTT_VERSION = 2.2.5
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
