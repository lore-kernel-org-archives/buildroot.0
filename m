Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D778CDD555
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1167541278;
	Wed, 18 Sep 2024 20:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DT6Fs_90Jf4; Wed, 18 Sep 2024 20:35:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 506854129F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 506854129F;
	Wed, 18 Sep 2024 20:35:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BC291BF97A
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D7BC401F6
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upZLZ3Q-nZbe for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 454A8411FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 454A8411FE
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 321D883BDD; Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 22:19:42 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2c96b9b395aa2944480dc50285d43a949a0625a5
X-Git-Newrev: 19c22c36d9cfcacefae142fb1d5235973814d926
X-Patchwork-Hint: ignore
Message-Id: <20240918203458.321D883BDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/tllist: update
 download URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=19c22c36d9cfcacefae142fb1d5235973814d926
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix download URL. Tarball is renamed, too.

Fixes:

 http://autobuild.buildroot.org/results/950/950688493021c12c4dea98ac4b220355d917ff69

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8194a727a211bb944d78eb0b82ab952fb8083a5a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tllist/tllist.hash | 2 +-
 package/tllist/tllist.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/tllist/tllist.hash b/package/tllist/tllist.hash
index 2806d62355..73d382767a 100644
--- a/package/tllist/tllist.hash
+++ b/package/tllist/tllist.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3f3fe2f7433719cec816c63937a7aa36e566bd317763ef46d11562073ab6361d  1.1.0.tar.gz
+sha256  a1f0ce0dc4fcb4ce59c37202a1d914c853a8bd2d7c5d57d623b15a8dd9778767  tllist-1.1.0.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/tllist/tllist.mk b/package/tllist/tllist.mk
index 69a34a65ab..26e21ccbe1 100644
--- a/package/tllist/tllist.mk
+++ b/package/tllist/tllist.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 TLLIST_VERSION = 1.1.0
-TLLIST_SOURCE = $(TLLIST_VERSION).tar.gz
-TLLIST_SITE = https://codeberg.org/dnkl/tllist/archive
+TLLIST_SITE = https://codeberg.org/dnkl/tllist/releases/download/$(TLLIST_VERSION)
 TLLIST_LICENSE = MIT
 TLLIST_LICENSE_FILES = LICENSE
 # header only
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
