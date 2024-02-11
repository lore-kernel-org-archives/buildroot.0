Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4B8C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 17:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 170D040189;
	Sun, 11 Feb 2024 17:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRJYXjWfL9UX; Sun, 11 Feb 2024 17:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE97A4028D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE97A4028D;
	Sun, 11 Feb 2024 17:30:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 345511BF4D5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E98F82026
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RqbScwQ2mkHI for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 17:30:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C3EE82021
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C3EE82021
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:30:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23BE387757; Sun, 11 Feb 2024 17:30:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 18:26:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3efc611f531c708b0292061fd0049b4012724c09
X-Git-Newrev: d9e02b8896fee9a5e657231c30182750ef206cf7
X-Patchwork-Hint: ignore
Message-Id: <20240211173048.23BE387757@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpgme: bump to version 1.23.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9e02b8896fee9a5e657231c30182750ef206cf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see [1] and [2].

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=blob;f=NEWS;hb=refs/tags/gpgme-1.23.2
[2] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=shortlog;h=gpgme-1.23.2

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgpgme/libgpgme.hash | 4 ++--
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 5c47db76d5..64099df4c3 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  12f4c98ffa75bdbfc4934d38757f57ba718b5aa0  gpgme-1.22.0.tar.bz2
-sha256  9551e37081ad3bde81018a0d24f245c3f8206990549598fb31a97a68380a7b71  gpgme-1.22.0.tar.bz2
+sha1  b3a938939a9fb2182684aa9ba094c8e8ecd6167b  gpgme-1.23.2.tar.bz2
+sha256  9499e8b1f33cccb6815527a1bc16049d35a6198a6c5fae0185f2bd561bce5224  gpgme-1.23.2.tar.bz2
 # Locally calculated
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 036103b7fc..dd39b37aa2 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.22.0
+LIBGPGME_VERSION = 1.23.2
 LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
