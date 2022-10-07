Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85C0C433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 15:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E00041D07;
	Fri,  7 Oct 2022 15:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E00041D07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2qI5VnP1bEtK; Fri,  7 Oct 2022 15:42:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B11841C75;
	Fri,  7 Oct 2022 15:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B11841C75
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30E2C1BF408
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AEB841900
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AEB841900
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DjajrmBf_0pP for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 15:42:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04CA741C74
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 15:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04CA741C74
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E592D86B90; Fri,  7 Oct 2022 15:42:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Oct 2022 17:40:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d843d9cc0064d6690cfc000e579f575e2c0cc4d
X-Git-Newrev: 82c6e87d5eaaf5b32aa340ab384f88539238cbe1
X-Patchwork-Hint: ignore
Message-Id: <20221007154207.E592D86B90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brltty: bump to version 6.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=82c6e87d5eaaf5b32aa340ab384f88539238cbe1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

README hash changed due to version update:
https://github.com/brltty/brltty/commit/4bb7f50767b8b99ea75aebda82c84b8e0df167b3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/brltty/brltty.hash | 4 ++--
 package/brltty/brltty.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
index cec074d8ce..9fc63714bc 100644
--- a/package/brltty/brltty.hash
+++ b/package/brltty/brltty.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  bc7573b0d0ab865c36607945b64c209312405571788f3b409397726f6143eaa6  brltty-6.4.tar.xz
+sha256  2f173535291ba39b5a9fc8d80c349234333d92042d95d6dd88796c98a02f316b  brltty-6.5.tar.xz
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  LICENSE-LGPL
-sha256  429be921e6bf783303a1f94cbb7f29dc4f0839e47efe38150b808f886028f4df  README
+sha256  c00c876cb4581a6b54fcc176f7e694896e5b52c4b015615566a787e8bc89fe69  README
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 600bf596df..dc5a38cddb 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRLTTY_VERSION = 6.4
+BRLTTY_VERSION = 6.5
 BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
 BRLTTY_SITE = http://brltty.com/archive
 BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
