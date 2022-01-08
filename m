Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93092C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58A4560AA9;
	Sat,  8 Jan 2022 15:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gl5AMJJYIR9X; Sat,  8 Jan 2022 15:17:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6C0260A6F;
	Sat,  8 Jan 2022 15:17:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37C571BF95D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A44EC40897
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z4VRfTrCrLOQ for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03C0840942
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8038F82DEE; Sat,  8 Jan 2022 15:09:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 15:49:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a67ba062a01be9262926a689178fe5ea9ae89d2f
X-Git-Newrev: 2cb372e0851f149d2c0c70667be369a4c09a2bc2
X-Patchwork-Hint: ignore
Message-Id: <20220108150928.8038F82DEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libldns: bump version to 1.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2cb372e0851f149d2c0c70667be369a4c09a2bc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformatted hashes.

Changelog: https://github.com/NLnetLabs/ldns/blob/develop/Changelog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libldns/libldns.hash | 10 +++++-----
 package/libldns/libldns.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libldns/libldns.hash b/package/libldns/libldns.hash
index c8fb39d478..cab8b7dbdf 100644
--- a/package/libldns/libldns.hash
+++ b/package/libldns/libldns.hash
@@ -1,7 +1,7 @@
-# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.7.1.tar.gz.sha1
-sha1 d075a08972c0f573101fb4a6250471daaa53cb3e  ldns-1.7.1.tar.gz
-# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.7.1.tar.gz.sha256
-sha256 8ac84c16bdca60e710eea75782356f3ac3b55680d40e1530d7cea474ac208229  ldns-1.7.1.tar.gz
+# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.1.tar.gz.sha1
+sha1  df19a0404a608821b571525214a18988bc88bb46  ldns-1.8.1.tar.gz
+# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.1.tar.gz.sha256
+sha256  958229abce4d3aaa19a75c0d127666564b17216902186e952ca4aef47c6d7fa3  ldns-1.8.1.tar.gz
 
 # Hash for license file:
-sha256 9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
+sha256  9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 9c248bbc19..7deca978da 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLDNS_VERSION = 1.7.1
+LIBLDNS_VERSION = 1.8.1
 LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
 LIBLDNS_SITE = http://www.nlnetlabs.nl/downloads/ldns
 LIBLDNS_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
