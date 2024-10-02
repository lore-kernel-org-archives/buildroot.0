Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332F4CF8540
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E90F240190;
	Wed,  2 Oct 2024 21:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cl2BSi_6yP4s; Wed,  2 Oct 2024 21:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF1B840261
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF1B840261;
	Wed,  2 Oct 2024 21:20:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 075A81BF5EA
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB2EA61129
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvnmPWY_lIO6 for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:20:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31622607C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31622607C3
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:20:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D59AD84BC9; Wed,  2 Oct 2024 21:20:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 23:18:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e5fd24c8b7438672c475d0559200ff72c4b1cc7
X-Git-Newrev: 540a0a567a4d3f092bb5a2ff7f4fdd1042533c51
X-Patchwork-Hint: ignore
Message-Id: <20241002212024.D59AD84BC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libilbc: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=540a0a567a4d3f092bb5a2ff7f4fdd1042533c51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libilbc/libilbc.hash | 2 +-
 package/libilbc/libilbc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libilbc/libilbc.hash b/package/libilbc/libilbc.hash
index be88d6f9c3..dbd1795765 100644
--- a/package/libilbc/libilbc.hash
+++ b/package/libilbc/libilbc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fe4827a548e96f0549dd8f30eb6a48c6c55fd4535de6c8e9c6e4f38bea6190bf  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07.tar.gz
+sha256  a09a244e5e24607303478aa9995765d2b26c52b15c2721cae5a83c109ed51ed3  libilbc-51d3cf8e157c3c80d7169b738073865eca83f5a3.tar.gz
 sha256  b7f4cbb4a12cd11a3d1aeda9bd17c99f59b054de4b3ee53045531cd2fa74dd2a  gips_iLBClicense.pdf
diff --git a/package/libilbc/libilbc.mk b/package/libilbc/libilbc.mk
index d8139ba205..089215f204 100644
--- a/package/libilbc/libilbc.mk
+++ b/package/libilbc/libilbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBILBC_VERSION = 829b08c7902ceb87a261279fabb36b6d523c6e07
+LIBILBC_VERSION = 51d3cf8e157c3c80d7169b738073865eca83f5a3
 LIBILBC_SITE = $(call github,freeswitch,libilbc,$(LIBILBC_VERSION))
 LIBILBC_LICENSE = Global IP Sound iLBC Public License v2.0
 LIBILBC_LICENSE_FILES = gips_iLBClicense.pdf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
