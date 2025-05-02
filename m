Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB44C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A467C840C0;
	Fri,  2 May 2025 11:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTE_VKT6XKli; Fri,  2 May 2025 11:13:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E31C9840C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E31C9840C1;
	Fri,  2 May 2025 11:13:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07305229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80BFD41E5D
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfO0h1Aa2O0Y for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEC6C417E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEC6C417E3
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCCBE864AD; Fri,  2 May 2025 11:11:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:10:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7f849d5f7536774c1d646cce68c90c2998f1ecfd
X-Git-Newrev: 1c8f3115639b3d710f8615dc5e44afc28e11173b
X-Patchwork-Hint: ignore
Message-Id: <20250502111135.BCCBE864AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/socat: bump to
 version 1.8.0.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1c8f3115639b3d710f8615dc5e44afc28e11173b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

List of changes in this release:
http://www.dest-unreach.org/socat/CHANGES

Refresh patch.

Update README hash for changes that are unrelated to license.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 51c58d7c0dcdd6d6a81f5227259a80b8cb684418)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/socat/0001-no-documentation.patch | 4 ++--
 package/socat/socat.hash                  | 6 +++---
 package/socat/socat.mk                    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/socat/0001-no-documentation.patch b/package/socat/0001-no-documentation.patch
index b4c3e1ffde..5dbce0576e 100644
--- a/package/socat/0001-no-documentation.patch
+++ b/package/socat/0001-no-documentation.patch
@@ -10,7 +10,7 @@ the package Makefile.in to not build/install its documentation.
 
 Upstream: N/A
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[baruch: update for 1.8.0.0; git patch format]
+[baruch: update for 1.8.0.0 and 1.8.0.3; git patch format]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
  Makefile.in | 7 ++-----
@@ -22,7 +22,7 @@ index c01b1a4a2306..fd89acb06f3c 100644
 +++ b/Makefile.in
 @@ -82,7 +82,7 @@ SHFILES = socat-chain.sh socat-mux.sh socat-broker.sh \
  TESTFILES = test.sh socks4echo.sh proxyecho.sh readline-test.sh \
- 	proxy.sh socks4a-echo.sh
+ 	proxy.sh socks4a-echo.sh socks5server-echo.sh
  
 -all: progs doc
 +all: progs
diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index 136dce4a71..b1c3d3cd11 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,8 +1,8 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5  7272fe53d51c63ca0e08e0339681803a  socat-1.8.0.2.tar.bz2
+md5  8ef0bc4f602636797917f8574c3b249e  socat-1.8.0.3.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256  adc07a9c2723527cf6568d2fb96559794cf9c254a4bc2edd36f7f3789e9f7625  socat-1.8.0.2.tar.bz2
+sha256  01eb017361d95bb3a6941e840b59e4463a3fabf92df4154ed02b16a2ed6a0095  socat-1.8.0.3.tar.bz2
 # Locally calculated
-sha256  a18cf021c6380e8ef212c7a95460aff2d96fe9e2146bb09058651bc3b86f4d43  README
+sha256  f51653b61cf2516c39e8f2edefc11604d0f9d14f0c6ae988bef228a1f0283ad2  README
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index aa9a94aec4..69f8f40452 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.8.0.2
+SOCAT_VERSION = 1.8.0.3
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
