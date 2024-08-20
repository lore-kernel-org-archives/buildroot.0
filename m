Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E06E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36E7181297;
	Fri,  6 Sep 2024 20:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHx41lDLhyJ6; Fri,  6 Sep 2024 20:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F34548118E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F34548118E;
	Fri,  6 Sep 2024 20:01:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BCEE1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC3C6409A9
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whFlwMpZ4Mcr for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9BA8407A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9BA8407A1
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6C0C7FC34; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 23:47:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7d717145c6c796758a391ddde9e14ed2236b4d2
X-Git-Newrev: 3527691d0b6a3212e5a794cf723f13b0fcdbbc8d
X-Patchwork-Hint: ignore
Message-Id: <20240906195855.A6C0C7FC34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/babeld: bump version to 1.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=3527691d0b6a3212e5a794cf723f13b0fcdbbc8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update Homepage and Download URL.
For changes see here:
https://github.com/jech/babeld/blob/master/CHANGES

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/babeld/Config.in   | 2 +-
 package/babeld/babeld.hash | 2 +-
 package/babeld/babeld.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/babeld/Config.in b/package/babeld/Config.in
index c7010e1fb1..80d2708230 100644
--- a/package/babeld/Config.in
+++ b/package/babeld/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_BABELD
 	  Babel is a loop-avoiding distance-vector routing protocol for
 	  IPv6 and IPv4 with fast convergence properties.
 
-	  http://www.pps.univ-paris-diderot.fr/~jch/software/babel/
+	  https://www.irif.fr/~jch/software/babel/
diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
index 2e0513efa0..3eb5d22081 100644
--- a/package/babeld/babeld.hash
+++ b/package/babeld/babeld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  154f00e0a8bf35d6ea9028886c3dc5c3c342dd1a367df55ef29a547b75867f07  babeld-1.9.2.tar.gz
+sha256  d085ccccfb06a11d7fa5b54c51d9c410f5f3b0a9389f584951336ff178f293b8  babeld-1.13.tar.gz
 sha256  b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index 785fa2bce9..67ff553b8b 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BABELD_VERSION = 1.9.2
-BABELD_SITE = http://www.pps.univ-paris-diderot.fr/~jch/software/files
+BABELD_VERSION = 1.13
+BABELD_SITE = https://www.irif.fr/~jch/software/files
 BABELD_LICENSE = MIT
 BABELD_LICENSE_FILES = LICENCE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
