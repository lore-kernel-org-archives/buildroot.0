Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72669C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 12:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AD5340091;
	Wed,  7 Aug 2024 12:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtq0KwFn8fOH; Wed,  7 Aug 2024 12:18:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC5A0400BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC5A0400BB;
	Wed,  7 Aug 2024 12:18:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E506D1BF342
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 12:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF1B7401E1
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 12:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVat4sWyLsCF for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 12:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCAB64014D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCAB64014D
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 12:18:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9CE784557; Wed,  7 Aug 2024 12:18:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 14:17:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 202e644b2698ac9b2e7a85dd23acfa3df5f6bd74
X-Git-Newrev: d84d9241c8e0e4cbe872d4e8bb86dcfa3781f974
X-Patchwork-Hint: ignore
Message-Id: <20240807121849.A9CE784557@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpg123: update to 1.32.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d84d9241c8e0e4cbe872d4e8bb86dcfa3781f974
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the homepage for News and Changes:
http://mpg123.de/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpg123/mpg123.hash | 6 +++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 0fe4699606..5a83f29586 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.32.3/
-sha1  3a94848a620db7917c757cb21e261c711e44618f  mpg123-1.32.3.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.32.6/
+sha1  886c8c5f100caccfb4fefabc1c75ff6e2a834128  mpg123-1.32.6.tar.bz2
 # Locally calculated
-sha256  2d9913a57d4ee8f497a182c6e82582602409782a4fb481e989feebf4435867b4  mpg123-1.32.3.tar.bz2
+sha256  ccdd1d0abc31d73d8b435fc658c79049d0a905b30669b6a42a03ad169dc609e6  mpg123-1.32.6.tar.bz2
 # License file
 sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 4de5f99bdf..af036132d2 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.32.3
+MPG123_VERSION = 1.32.6
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
