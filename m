Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B036D13579
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1391640001;
	Sun, 27 Oct 2024 18:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yO1A__nLwOmU; Sun, 27 Oct 2024 18:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6768401DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6768401DF;
	Sun, 27 Oct 2024 18:41:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FE45971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E72F40163
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1VyqYTucLLY for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCD334012F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCD334012F
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA84C83C0E; Sun, 27 Oct 2024 18:41:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:13:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b45f59e9bbcba91e731c8a7c34bf9af9fdb7847
X-Git-Newrev: d9db8cfd787526df7b328875038a658a3021579a
X-Patchwork-Hint: ignore
Message-Id: <20241027184107.BA84C83C0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libldns: bump to version 1.8.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d9db8cfd787526df7b328875038a658a3021579a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched _SITE to https.

Changelog: https://github.com/NLnetLabs/ldns/blob/1.8.4/Changelog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
