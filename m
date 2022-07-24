Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862B0C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1405C4160B;
	Sun, 24 Jul 2022 19:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1405C4160B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UOHpHgoFb6RT; Sun, 24 Jul 2022 19:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CF4E415CA;
	Sun, 24 Jul 2022 19:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CF4E415CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 374581BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97E4783EB5
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97E4783EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wdvEuz07AMF4 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 264C083EE9
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 264C083EE9
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 66F1685CBF; Sun, 24 Jul 2022 19:41:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c41f778a78af5a91fef223c89d35c9ae5a93309
X-Git-Newrev: 35bcf3018affc1431685035b49520622885b8e5a
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.66F1685CBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xrefresh: bump version
 to 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=35bcf3018affc1431685035b49520622885b8e5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xapp_xrefresh/xapp_xrefresh.hash | 10 ++++------
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash b/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
index 8eae8ed1bb..adb9a3b521 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002872.html
-md5 c56fa4adbeed1ee5173f464a4c4a61a6  xrefresh-1.0.6.tar.bz2
-sha1 11eb5b3f905631281d2cedd86a0b666bab0d9bdc  xrefresh-1.0.6.tar.bz2
-sha256 287dfb9bb7e8d780d07e672e3252150850869cb550958ed5f8401f0835cd6353  xrefresh-1.0.6.tar.bz2
-sha512 361e97fecfc2706d5eeab69df0d4dd4baa55b6783cfddabf51d8561b7c930d71ce6c217e0512c6564208d69b04f89c69ea8c0bfb2e4f6cc25b062b55e4db3674  xrefresh-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003188.html
+sha256  a9f1d635f2f42283d0174e94d09ab69190c227faa5ab542bfe15ed9607771b1e  xrefresh-1.0.7.tar.xz
+sha512  8fcbb01aa368944ca536f050ab194b21bbd6b2a56265a7ed5807882e5c2f9660105283cdba0ea35b3e4a17a015586aeb82906e081da030332dfc49169a191c31  xrefresh-1.0.7.tar.xz
 # Locally computed
-sha256 4f51c9a91cd277697cbea6604bf4cb240c1ed14cdba82550cb9cac8f1286f663 COPYING
+sha256  4f51c9a91cd277697cbea6604bf4cb240c1ed14cdba82550cb9cac8f1286f663 COPYING
diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
index 36a4feaad1..9affbd468e 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XREFRESH_VERSION = 1.0.6
-XAPP_XREFRESH_SOURCE = xrefresh-$(XAPP_XREFRESH_VERSION).tar.bz2
-XAPP_XREFRESH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XREFRESH_VERSION = 1.0.7
+XAPP_XREFRESH_SOURCE = xrefresh-$(XAPP_XREFRESH_VERSION).tar.xz
+XAPP_XREFRESH_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XREFRESH_LICENSE = MIT
 XAPP_XREFRESH_LICENSE_FILES = COPYING
 XAPP_XREFRESH_DEPENDENCIES = xlib_libX11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
