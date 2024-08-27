Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CF4E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 004C884117;
	Fri,  6 Sep 2024 20:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QRlZz6MTG9v4; Fri,  6 Sep 2024 20:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B43EB84A90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B43EB84A90;
	Fri,  6 Sep 2024 20:06:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 766F31BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E7B961119
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REv5ml0wlyNe for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 676DC61115
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 676DC61115
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 648C986C5A; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 18:28:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95221974c80fe860b52111f61526013d29fef37e
X-Git-Newrev: 4dff2511e6bf7ba93156f48614f91becc04ec534
X-Patchwork-Hint: ignore
Message-Id: <20240906195857.648C986C5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlitecpp: bump to version 3.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dff2511e6bf7ba93156f48614f91becc04ec534
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE.txt hash update due to bumped license year.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sqlitecpp/sqlitecpp.hash | 4 ++--
 package/sqlitecpp/sqlitecpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlitecpp/sqlitecpp.hash b/package/sqlitecpp/sqlitecpp.hash
index 1269abf61f..3ed6a3c40a 100644
--- a/package/sqlitecpp/sqlitecpp.hash
+++ b/package/sqlitecpp/sqlitecpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  71f990f9fb4b004533b6859ce40729af823b87fe691dd99ca084a7fd40db54b9  sqlitecpp-3.3.1.tar.gz
-sha256  635de1440f6064c6ca9ca325c163d4d0771e783c6d77783d9470eaf56e346c67  LICENSE.txt
+sha256  5aa8eda130d0689bd5ed9b2074714c2dbc610f710483c61ba6cf944cebfe03af  sqlitecpp-3.3.2.tar.gz
+sha256  ecb10f021c51e9fd1dabaebd8a8e977934d47d9e3c74094f333060be2d6e023b  LICENSE.txt
diff --git a/package/sqlitecpp/sqlitecpp.mk b/package/sqlitecpp/sqlitecpp.mk
index 5571d325c3..1cf8281997 100644
--- a/package/sqlitecpp/sqlitecpp.mk
+++ b/package/sqlitecpp/sqlitecpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITECPP_VERSION = 3.3.1
+SQLITECPP_VERSION = 3.3.2
 SQLITECPP_SITE = $(call github,SRombauts,SQLiteCpp,$(SQLITECPP_VERSION))
 SQLITECPP_LICENSE = MIT
 SQLITECPP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
