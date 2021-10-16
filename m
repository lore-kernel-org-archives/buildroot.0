Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70636C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:30:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3D6061245
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3D6061245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B91734050C;
	Sat, 16 Oct 2021 08:30:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hA9rlkTHjyaW; Sat, 16 Oct 2021 08:30:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 254BA404E4;
	Sat, 16 Oct 2021 08:30:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA23B1BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7F26401DF
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BS7fD1w9qj3E for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:29:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEB7D400BE
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:29:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 62B6D95C5B; Sat, 16 Oct 2021 08:26:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 10:26:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6eb905376d0af595b01aa8007cac1d4de7175b7
X-Git-Newrev: 6e403cef49778717d168026d9f5a4ae0dce09a08
X-Patchwork-Hint: ignore
Message-Id: <20211016082647.62B6D95C5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lockfile-progs: bump to version
 0.1.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e403cef49778717d168026d9f5a4ae0dce09a08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lockfile-progs/lockfile-progs.hash | 6 +++---
 package/lockfile-progs/lockfile-progs.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lockfile-progs/lockfile-progs.hash b/package/lockfile-progs/lockfile-progs.hash
index fc3d4b68bc..bf318350f3 100644
--- a/package/lockfile-progs/lockfile-progs.hash
+++ b/package/lockfile-progs/lockfile-progs.hash
@@ -1,5 +1,5 @@
-# From https://snapshot.debian.org/archive/debian/20180903T205652Z/pool/main/l/lockfile-progs/lockfile-progs_0.1.18.tar.gz
-sha256	a42995a4b97e6188efc90fcc1a761163c4b2cff5c81b936f85c84301ddb05ce6	lockfile-progs_0.1.18.tar.gz
+# From https://snapshot.debian.org/archive/debian/20210903T205304Z/pool/main/l/lockfile-progs/lockfile-progs_0.1.19.dsc
+sha256  2c5704b01c8f474f82921780e4592a927b2bf6a6d7616354a6c5d7cd5664857e  lockfile-progs_0.1.19.tar.gz
 
 # Hash for license file
-sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index d2f8f61188..6045aa713d 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LOCKFILE_PROGS_VERSION = 0.1.18
+LOCKFILE_PROGS_VERSION = 0.1.19
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
-LOCKFILE_PROGS_SITE = http://snapshot.debian.org/archive/debian/20180903T205652Z/pool/main/l/lockfile-progs
+LOCKFILE_PROGS_SITE = http://snapshot.debian.org/archive/debian/20210903T205304Z/pool/main/l/lockfile-progs
 LOCKFILE_PROGS_DEPENDENCIES = liblockfile
 LOCKFILE_PROGS_LICENSE = GPL-2.0
 LOCKFILE_PROGS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
