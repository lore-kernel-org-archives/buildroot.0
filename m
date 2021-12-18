Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AAEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 21:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B3634017C;
	Sat, 18 Dec 2021 21:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oZWL4AvqICup; Sat, 18 Dec 2021 21:44:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45A3E40157;
	Sat, 18 Dec 2021 21:44:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 349ED1BF2A0
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30F1284DD8
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:44:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zDHzJFf_uBPq for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 21:44:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 537E684DD6
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 21:44:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 00B03825C3; Sat, 18 Dec 2021 21:39:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 22:43:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff58dc6c35ac9e128c676780d7cd333abf4cd446
X-Git-Newrev: 7923af15dd24383fe74757d10492ea511d748303
X-Patchwork-Hint: ignore
Message-Id: <20211218213901.00B03825C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lsscsi: bump to version 0.32
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

commit: https://git.buildroot.net/buildroot/commit/?id=7923af15dd24383fe74757d10492ea511d748303
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://sg.danny.cz/scsi/lsscsi.ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lsscsi/lsscsi.hash | 2 +-
 package/lsscsi/lsscsi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsscsi/lsscsi.hash b/package/lsscsi/lsscsi.hash
index d444c7e059..d2df600523 100644
--- a/package/lsscsi/lsscsi.hash
+++ b/package/lsscsi/lsscsi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  12bf1973014803c6fd6d547e7594a4c049f0eef3bf5d22190d4be29d7c09f3ca  lsscsi-0.31.tgz
+sha256  0a800e9e94dca2ab702d65d72777ae8cae078e3d74d0bcbed64ba0849e8029a1  lsscsi-0.32.tgz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/lsscsi/lsscsi.mk b/package/lsscsi/lsscsi.mk
index e9a5255397..716b6b74fb 100644
--- a/package/lsscsi/lsscsi.mk
+++ b/package/lsscsi/lsscsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSSCSI_VERSION = 0.31
+LSSCSI_VERSION = 0.32
 LSSCSI_SOURCE = lsscsi-$(LSSCSI_VERSION).tgz
 LSSCSI_SITE = http://sg.danny.cz/scsi
 LSSCSI_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
