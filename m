Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92478C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 07:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03D13613DC;
	Tue,  7 Jun 2022 07:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YzWv4zlrL-q9; Tue,  7 Jun 2022 07:27:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC880613D8;
	Tue,  7 Jun 2022 07:27:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD34E1BF2C1
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 07:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C927C841FD
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 07:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FkSVQt0voKyL for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 07:27:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBA41841FC
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 07:27:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C51D286DF3; Tue,  7 Jun 2022 07:15:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 09:26:27 +0200
Subject: [git commit] DEVELOPERS: remove Manuel Vögele
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6081e7e53d5c07dc3f2ef7f5bf1d78772fdc16c1
X-Git-Newrev: 487ac12ff993e0e401aaf2e15272901d2b280fd5
X-Patchwork-Hint: ignore
Message-Id: <20220607071513.C51D286DF3@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============2129498976137918541=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2129498976137918541==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=487ac12ff993e0e401aaf2e15272901d2b280fd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Manuel Vögele has privately requested to be removed from the
DEVELOPERS file as he is no longer involved with Buildroot
usage/development.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index aa18de83bc..1fec764812 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1780,10 +1780,6 @@ F:	package/mpv/
 F:	package/rpi-firmware/
 F:	package/rpi-userland/
 
-N:	Manuel Vögele <develop@manuel-voegele.de>
-F:	package/python-pyqt5/
-F:	package/python-requests-toolbelt/
-
 N:	Marcin Bis <marcin@bis.org.pl>
 F:	package/bluez5_utils/
 F:	package/cc-tool/

--===============2129498976137918541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2129498976137918541==--
