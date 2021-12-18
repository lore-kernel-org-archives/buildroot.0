Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB17C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 22:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44BA960B4D;
	Sat, 18 Dec 2021 22:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O9SrWRSYmLCM; Sat, 18 Dec 2021 22:50:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A13A3607C1;
	Sat, 18 Dec 2021 22:50:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F9341BF5AE
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F87284E21
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hjDm9BGQ2rrS for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 22:49:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1306B84E0C
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 22:49:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9328D7F903; Sat, 18 Dec 2021 22:44:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 23:48:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5efc8a0102f7470fef3120d6cf956f3e95d870f
X-Git-Newrev: eb3fec9d64e765d7485cf4b7b09bd18cc68dd328
X-Patchwork-Hint: ignore
Message-Id: <20211218224419.9328D7F903@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez-alsa: fix empty line
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb3fec9d64e765d7485cf4b7b09bd18cc68dd328
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following warning added by commit
3ba8e88e396f216ac8486580b8817aac92ae93b2:

package/bluez-alsa/bluez-alsa.mk:79: consecutive empty lines

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bluez-alsa/bluez-alsa.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index a1e550ab6c..f5e3aa1245 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -76,5 +76,4 @@ else
 BLUEZ_ALSA_CONF_OPTS += --without-libopenaptx --disable-aptx --disable-aptx-hd
 endif
 
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
