Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D849BCD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9086F40AF9;
	Tue,  3 Sep 2024 18:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bWKdu64pjwQ; Tue,  3 Sep 2024 18:38:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4497540AC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4497540AC4;
	Tue,  3 Sep 2024 18:38:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 051611BF59C
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1819940A1A
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yBTgQSbZ4P84 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C14C40A25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C14C40A25
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6647986ABC; Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 20:34:59 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 935111fd263119d65771a0b8f0a16d372d0b6462
X-Git-Newrev: 64cfac7087e38fffbf5a009e7c392cd80a1be753
X-Patchwork-Hint: ignore
Message-Id: <20240903183810.6647986ABC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/swaybg: bump to
 version 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=64cfac7087e38fffbf5a009e7c392cd80a1be753
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

See also: https://github.com/swaywm/swaybg/releases/tag/v1.2.1

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2143e8f8351c177d7fce87ccacba042afea94f93)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swaybg/swaybg.hash | 5 +++--
 package/swaybg/swaybg.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/swaybg/swaybg.hash b/package/swaybg/swaybg.hash
index 62bf048d61..e528349db9 100644
--- a/package/swaybg/swaybg.hash
+++ b/package/swaybg/swaybg.hash
@@ -1,3 +1,4 @@
-# Locally computed, tarball verified with GPG signature
-sha256  c0205b34f1fad94553b6cb2c2b983cc33186018026058cad0b841a00bc3087e3  swaybg-1.2.0.tar.gz
+# Locally calculated after checking pgp signature:
+# https://github.com/swaywm/swaybg/releases/download/v1.2.1/swaybg-1.2.1.tar.gz.sig
+sha256  6af1fdf0e57b1cc5345febed786b761fea0e170943a82639f94cfaed7df84f8f  swaybg-1.2.1.tar.gz
 sha256  95224d118a325daf31828afcca98cd958d53f0a7cdd856b50b1be8ac44832faf  LICENSE
diff --git a/package/swaybg/swaybg.mk b/package/swaybg/swaybg.mk
index 90a8cb5d80..87374e035e 100644
--- a/package/swaybg/swaybg.mk
+++ b/package/swaybg/swaybg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWAYBG_VERSION = 1.2.0
+SWAYBG_VERSION = 1.2.1
 SWAYBG_SITE = https://github.com/swaywm/swaybg/releases/download/v$(SWAYBG_VERSION)
 SWAYBG_LICENSE = MIT
 SWAYBG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
