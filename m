Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D146BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C21B42360;
	Sun, 12 Dec 2021 12:24:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rsITTqbiExm9; Sun, 12 Dec 2021 12:24:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6A344235D;
	Sun, 12 Dec 2021 12:24:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E6481BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A36DB4052F
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QWEJ_TsBWQac for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BA3C40530
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D700782B66; Sun, 12 Dec 2021 12:17:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:21:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0987512a28a862e84d977b336cac02fbdc99fadc
X-Git-Newrev: 79791023ee4e257b0cedccae4fab940530759243
X-Patchwork-Hint: ignore
Message-Id: <20211212121714.D700782B66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lsof: bump to version 4.94.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=79791023ee4e257b0cedccae4fab940530759243
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/lsof-org/lsof/releases/tag/4.94.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lsof/lsof.hash | 4 ++--
 package/lsof/lsof.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index c7432ffbe8..9e72023d30 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	3df912bd966fc24dc73ddea3e36a61d79270b21b085936a4caabca56e5b486a2	lsof-4.93.2.tar.gz
-sha256	32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1	dialects/linux/dproto.h
+sha256  c41709c2543ecf9de1e950795790a9786a2f225e51c3cc53d6a9a256f872472b  lsof_4.94.0.linux.tar.bz2
+sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1  dialects/linux/dproto.h
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 6aa829c2c0..ff09d64345 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.93.2
-LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
+LSOF_VERSION = 4.94.0
+LSOF_SOURCE = lsof_$(LSOF_VERSION).linux.tar.bz2
+LSOF_SITE = https://github.com/lsof-org/lsof/releases/download/$(LSOF_VERSION)
 LSOF_LICENSE = lsof license
 # License is repeated in each file, this is a relatively small one.
 # It is also defined in 00README, but that contains a lot of other cruft.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
