Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B26C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA888268B;
	Mon, 27 Jun 2022 22:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BA888268B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xl8hopcvu33q; Mon, 27 Jun 2022 22:22:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C14282656;
	Mon, 27 Jun 2022 22:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C14282656
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CFD11BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 274F44016B
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 274F44016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eReIDewdoNVt for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:21:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60E7F400D7
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60E7F400D7
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 068EA8769A; Mon, 27 Jun 2022 22:09:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 00:21:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bb0753345aa4d1b550230c25a28c527f51ac110
X-Git-Newrev: 282d6982413aba2fc96fe2e337741424e5fe3dc5
X-Patchwork-Hint: ignore
Message-Id: <20220627220920.068EA8769A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dos2unix: bump to version 7.4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=282d6982413aba2fc96fe2e337741424e5fe3dc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of COPYING.txt (update in year)
- Update indentation in hash file (two spaces)

https://waterlan.home.xs4all.nl/dos2unix/NEWS.txt
https://waterlan.home.xs4all.nl/dos2unix/ChangeLog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dos2unix/dos2unix.hash | 6 +++---
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 493011fce4..a16c1aecac 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.2.tar.gz.asc
-sha256	6035c58df6ea2832e868b599dfa0d60ad41ca3ecc8aa27822c4b7a9789d3ae01  dos2unix-7.4.2.tar.gz
-sha256	db8888b7d1454348aca0c6ca851327245ef60e57afa8a6555761c8b95d24af77  COPYING.txt
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.3.tar.gz.asc
+sha256  b68db41956daf933828423aa30510e00c12d29ef5916e715e8d4e694fe66ca72  dos2unix-7.4.3.tar.gz
+sha256  275ce1371734904b275e83bf760e3e6d2a520614545a3850c9568d1892b940fd  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 1f3e79ec4e..f16a527f2e 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.4.2
+DOS2UNIX_VERSION = 7.4.3
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
