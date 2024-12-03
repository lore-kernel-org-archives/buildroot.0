Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F52E74AD2
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 20:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD5B341EA4;
	Tue,  3 Dec 2024 20:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnaAQ-8UeTwZ; Tue,  3 Dec 2024 20:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2A7441EA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2A7441EA6;
	Tue,  3 Dec 2024 20:58:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AB961DAA
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C24B41EA6
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iteIb0xV54iG for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FC1C41EA4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FC1C41EA4
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:58:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 412EE86879; Tue,  3 Dec 2024 20:58:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Dec 2024 21:44:07 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f20396a248bb5f7cfa94bedfa7810355edb51af5
X-Git-Newrev: 71b2565cd05a2682821d19ec84d7f3a2ddc02337
X-Patchwork-Hint: ignore
Message-Id: <20241203205852.412EE86879@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcap: bump version
 to 2.73
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=71b2565cd05a2682821d19ec84d7f3a2ddc02337
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release note, see:
https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.7yd7ab9ppagk

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcap/libcap.hash | 2 +-
 package/libcap/libcap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index dd9bc75a02..ec59f224bb 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  23a6ef8aadaf1e3e875f633bb2d116cfef8952dba7bc7c569b13458e1952b30f  libcap-2.70.tar.xz
+sha256  6405f6089cf4cdd8c271540cd990654d78dd0b1989b2d9bda20f933a75a795a5  libcap-2.73.tar.xz
 
 # Hash for license file:
 sha256  68467e731f4744bd6e0bb69e8df9c3a994e09cd6b203d0c41327ac6d079c581d  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index a1b2636c5d..5a6ed5b494 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.70
+LIBCAP_VERSION = 2.73
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
