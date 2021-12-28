Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF7AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 13:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32EEE8190B;
	Tue, 28 Dec 2021 13:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8auzHPRjHnKX; Tue, 28 Dec 2021 13:14:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93E94818EC;
	Tue, 28 Dec 2021 13:14:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A90081BF363
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A582C81310
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5LP2FRlg5Rj0 for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 13:13:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF8D9818C0
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 13:13:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8476982BA6; Tue, 28 Dec 2021 13:08:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 14:13:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d097a59417399b01e4bcd406395a7a5c76686ae
X-Git-Newrev: 2cecfe94f889165f3a5169598ed7e0388941a6cd
X-Patchwork-Hint: ignore
Message-Id: <20211228130805.8476982BA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtorrent-rasterbar: bump to
 version 1.2.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=2cecfe94f889165f3a5169598ed7e0388941a6cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/arvidn/libtorrent/blob/v1.2.15/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtorrent-rasterbar/libtorrent-rasterbar.hash | 2 +-
 package/libtorrent-rasterbar/libtorrent-rasterbar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
index 8198a1ff9d..3f59642b72 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c3744ac9fa41f6e6ebf79538a2ea678df76a2cbbaf3ac6ae2c05455314e5cce8  libtorrent-rasterbar-1.2.12.tar.gz
+sha256  c8ad8638684c0a903ebabc30490079e31b1a6a638da2adec5a8bef6a0e62214b  libtorrent-rasterbar-1.2.15.tar.gz
 sha256  f3a5dd1558cce616b12edad521427ec8976ce2bb0af33f7f359cfa648bf55ad8  COPYING
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index 7f60252e9b..914e0cbca3 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTORRENT_RASTERBAR_VERSION = 1.2.12
+LIBTORRENT_RASTERBAR_VERSION = 1.2.15
 LIBTORRENT_RASTERBAR_SITE = \
 	https://github.com/arvidn/libtorrent/releases/download/v$(LIBTORRENT_RASTERBAR_VERSION)
 LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
