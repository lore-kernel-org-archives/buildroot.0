Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0A1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41D6660EC1;
	Sun, 17 Jul 2022 13:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41D6660EC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JI6MT-r78zU4; Sun, 17 Jul 2022 13:22:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 039DD60BEB;
	Sun, 17 Jul 2022 13:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 039DD60BEB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 801F21BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43892840B2
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43892840B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bT-gh6MGUpKE for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:20:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2523283F1B
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2523283F1B
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E506283BD0; Sun, 17 Jul 2022 13:06:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 15:15:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33fae36e29447b4947c3d4d000b50eb9b4ee6d87
X-Git-Newrev: 4bc955207ea7190f938c258a41c447b6adb023b9
X-Patchwork-Hint: ignore
Message-Id: <20220717130654.E506283BD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update to version 0.23.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=4bc955207ea7190f938c258a41c447b6adb023b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Minor bug fixes and corrections; add fmt 9.0.0 support.

Full change log:
  https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.8/NEWS

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 353df25b39..e5f587fefc 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  960dcbac717c388f5dcc4fd945e3af19a476f2b15f367e9653d4c7a948768211  mpd-0.23.7.tar.xz
+sha256  86bb569bf3b519821f36f6bb5564e484e85d2564411b34b200fe2cd3a04e78cf  mpd-0.23.8.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 20c8f77fa8..e265a9fc4f 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.23
-MPD_VERSION = $(MPD_VERSION_MAJOR).7
+MPD_VERSION = $(MPD_VERSION_MAJOR).8
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
