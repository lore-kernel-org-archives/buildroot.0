Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC2ED41C27
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91A4F811FB;
	Wed, 13 Nov 2024 09:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSDahGmqrgm9; Wed, 13 Nov 2024 09:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6A5D811C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6A5D811C5;
	Wed, 13 Nov 2024 09:55:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6F971531
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7FF16083F
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVwz9gRX0AEX for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02ADF6000A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02ADF6000A
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E576C86283; Wed, 13 Nov 2024 09:55:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Nov 2024 22:06:06 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 2f6c9f86326dbcc20fca7c2ad7e81f7e4719377b
X-Git-Newrev: 6b141aac099a6e4d7e9b86701cb59e14091384a8
X-Patchwork-Hint: ignore
Message-Id: <20241113095504.E576C86283@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/jsoncpp: bump
 version to 1.9.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b141aac099a6e4d7e9b86701cb59e14091384a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Release notes:
https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d7dbcfb9826c92a9b1a73c0c842034eddd93250a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jsoncpp/jsoncpp.hash | 2 +-
 package/jsoncpp/jsoncpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jsoncpp/jsoncpp.hash b/package/jsoncpp/jsoncpp.hash
index 99266ae42d..0fa9b89422 100644
--- a/package/jsoncpp/jsoncpp.hash
+++ b/package/jsoncpp/jsoncpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f409856e5920c18d0c2fb85276e24ee607d2a09b5e7d5f0a371368903c275da2  jsoncpp-1.9.5.tar.gz
+sha256  f93b6dd7ce796b13d02c108bc9f79812245a82e577581c4c9aabe57075c90ea2  jsoncpp-1.9.6.tar.gz
 sha256  cec0db5f6d7ed6b3a72647bd50aed02e13c3377fd44382b96dc2915534c042ad  LICENSE
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 5ef62befbc..9915907ea8 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.9.5
+JSONCPP_VERSION = 1.9.6
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
