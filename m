Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E45C83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 22:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 824E880C2E;
	Fri,  4 Jul 2025 22:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IREZyqe4-A5e; Fri,  4 Jul 2025 22:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0635C80BDB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0635C80BDB;
	Fri,  4 Jul 2025 22:22:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3A4C7AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 22:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D58C34007F
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 22:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38Zx8iEPz96D for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 22:22:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32F8540054
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32F8540054
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 22:22:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 110A885F90; Fri,  4 Jul 2025 22:22:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 00:15:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c56e7ef954b29d68d79d7a8110a9057457fd2a31
X-Git-Newrev: f7d94f8f3492a1ce9ee1e907eeb58a5ba98bcba3
X-Patchwork-Hint: ignore
Message-Id: <20250704222243.110A885F90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpqxx: bump to version 7.10.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f7d94f8f3492a1ce9ee1e907eeb58a5ba98bcba3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note the `COPYING` file has changed due to copyright year bumps.

See also: https://github.com/jtv/libpqxx/blob/7.10.1/NEWS

Signed-off-by: James Knight <git@jdknight.me>
[Julien: update change log url to use tag]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpqxx/libpqxx.hash | 4 ++--
 package/libpqxx/libpqxx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 7e13e7415b..5fb93cbe63 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e37d5774c39f6c802e32d7f418e88b8e530404fb54758516e884fc0ebdee6da4  libpqxx-7.9.2.tar.gz
-sha256  3dd057a614dd24688aafc38d4c41111140e17147cfd94f314a80af30879641b2  COPYING
+sha256  cfbbb1d93a0a3d81319ec71d9a3db80447bb033c4f6cee088554a88862fd77d7  libpqxx-7.10.1.tar.gz
+sha256  2ccd31347a87796860a6600f57bf97ff4d54c203ecce4ea040425ba79774cf5f  COPYING
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index c69b77260d..4364dd09a9 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPQXX_VERSION = 7.9.2
+LIBPQXX_VERSION = 7.10.1
 LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
