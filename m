Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F26AC46467
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 21:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 005694194C;
	Wed,  4 Jan 2023 21:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 005694194C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4-ea10Ar4XC; Wed,  4 Jan 2023 21:37:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8CDD4194B;
	Wed,  4 Jan 2023 21:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8CDD4194B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14D531BF964
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 21:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEF7982009
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 21:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEF7982009
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2tgOK1TMbJid for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 21:36:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 184F181BFA
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 21:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 184F181BFA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 055FD87566; Wed,  4 Jan 2023 21:36:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:22:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e49d4fe20cbdf6195f23e4e920b1314786e1dac1
X-Git-Newrev: 6bee8635d90f3f9e3d04e03a9db2f37a387e077c
X-Patchwork-Hint: ignore
Message-Id: <20230104213637.055FD87566@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpcap: bump to version 1.10.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6bee8635d90f3f9e3d04e03a9db2f37a387e077c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpcap/Config.in    | 2 +-
 package/libpcap/libpcap.hash | 4 ++--
 package/libpcap/libpcap.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpcap/Config.in b/package/libpcap/Config.in
index a5f64bdc81..7ffac64c46 100644
--- a/package/libpcap/Config.in
+++ b/package/libpcap/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBPCAP
 	  A system-independent library for user-level network packet
 	  capture.
 
-	  http://www.tcpdump.org/
+	  https://www.tcpdump.org/
diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 84c8e405df..b87d9d04ef 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.tcpdump.org/release/libpcap-1.10.1.tar.gz.sig
-sha256  ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4  libpcap-1.10.1.tar.gz
+# https://www.tcpdump.org/release/libpcap-1.10.2.tar.gz.sig
+sha256  db6d79d4ad03b8b15fb16c42447d093ad3520c0ec0ae3d331104dcfb1ce77560  libpcap-1.10.2.tar.gz
 
 # Hash for license file:
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 21422b2c0a..173207de63 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.10.1
+LIBPCAP_VERSION = 1.10.2
 LIBPCAP_SITE = https://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
