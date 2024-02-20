Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC30DC48BC4
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 21:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D3A260645;
	Tue, 20 Feb 2024 21:16:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oEvzJ7JAirzg; Tue, 20 Feb 2024 21:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9604B60666
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9604B60666;
	Tue, 20 Feb 2024 21:16:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB23B1BF475
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B87F160666
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXnXY7opvfO4 for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 21:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0337660645
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0337660645
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 21:16:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E165E879B6; Tue, 20 Feb 2024 21:16:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 22:15:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43ae599c9eeba74f4c9941435d9f8137723b86ec
X-Git-Newrev: 5c86121d8865d41c40ed17d0ca6b07d36a940a2e
X-Patchwork-Hint: ignore
Message-Id: <20240220211650.E165E879B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dos2unix: bump to version 7.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c86121d8865d41c40ed17d0ca6b07d36a940a2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of the COPYING.txt (update in year)

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dos2unix/dos2unix.hash | 6 +++---
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 032c8ea2d2..d4d682cd0c 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.0.tar.gz.asc
-sha256  7a3b01d01e214d62c2b3e04c3a92e0ddc728a385566e4c0356efa66fd6eb95af  dos2unix-7.5.0.tar.gz
-sha256  6009a35c7aaee9888fd4844972c37b84bce22e7407893727c70f4f3560ae3eac  COPYING.txt
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.2.tar.gz.asc
+sha256  264742446608442eb48f96c20af6da303cb3a92b364e72cb7e24f88239c4bf3a  dos2unix-7.5.2.tar.gz
+sha256  03b60fa2cf28b2c6dd585a13b32377c1f87b8f016db44ce2ab6bc7eb306220e2  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 6d1e70cf26..e30fc999d4 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.5.0
+DOS2UNIX_VERSION = 7.5.2
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
