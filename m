Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53D5D41C2B
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36E0B80C2B;
	Wed, 13 Nov 2024 09:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQHbTZZbwjCa; Wed, 13 Nov 2024 09:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7FA78116F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7FA78116F;
	Wed, 13 Nov 2024 09:53:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BBF21531
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1146607B7
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eocEI07iWMBB for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8C8B60837
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8C8B60837
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D02DD8621E; Wed, 13 Nov 2024 09:53:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Nov 2024 21:52:41 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 651e7b4f65471e1b10f5beb7f4b1613f59cf906c
X-Git-Newrev: 9f47649745c7c5ab7588397864a8fc684d440302
X-Patchwork-Hint: ignore
Message-Id: <20241113095350.D02DD8621E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libldns: bump to
 version 1.8.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f47649745c7c5ab7588397864a8fc684d440302
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Switched _SITE to https.

Changelog: https://github.com/NLnetLabs/ldns/blob/1.8.4/Changelog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d9db8cfd787526df7b328875038a658a3021579a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libldns/libldns.hash | 8 ++++----
 package/libldns/libldns.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libldns/libldns.hash b/package/libldns/libldns.hash
index ff86ae348e..ffdfbedc13 100644
--- a/package/libldns/libldns.hash
+++ b/package/libldns/libldns.hash
@@ -1,7 +1,7 @@
-# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.3.tar.gz.sha1
-sha1  2796cc49636f68260c9662b60d5a7c9e6eed195c  ldns-1.8.3.tar.gz
-# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.3.tar.gz.sha256
-sha256  c3f72dd1036b2907e3a56e6acf9dfb2e551256b3c1bbd9787942deeeb70e7860  ldns-1.8.3.tar.gz
+# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.4-rc.1.tar.gz.sha1
+sha1  43d013b904e6df5ac5e28001cdc91bef537f3f6f  ldns-1.8.4.tar.gz
+# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.4.tar.gz.sha256
+sha256  838b907594baaff1cd767e95466a7745998ae64bc74be038dccc62e2de2e4247  ldns-1.8.4.tar.gz
 
 # Hash for license file:
 sha256  9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index d6af6a2b97..0740d09fab 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBLDNS_VERSION = 1.8.3
+LIBLDNS_VERSION = 1.8.4
 LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
-LIBLDNS_SITE = http://www.nlnetlabs.nl/downloads/ldns
+LIBLDNS_SITE = https://www.nlnetlabs.nl/downloads/ldns
 LIBLDNS_LICENSE = BSD-3-Clause
 LIBLDNS_LICENSE_FILES = LICENSE
 LIBLDNS_CPE_ID_VENDOR = nlnetlabs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
