Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73764CCA470
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 10:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C34C612D7;
	Thu,  9 Oct 2025 10:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8o0P2Q3Euyh; Thu,  9 Oct 2025 10:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B19561307
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B19561307;
	Thu,  9 Oct 2025 10:16:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 109EC119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C671611CA
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdVFJ5ZQ8tkW for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19355611AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19355611AA
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09F4B86E19; Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:32:00 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9f193731785830b967fd931a7a5f63b04d0b46ad
X-Git-Newrev: 3da3cee8fea00b2df50efca2539557308012092d
X-Patchwork-Hint: ignore
Message-Id: <20251009101600.09F4B86E19@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tor: bump version
 to 0.4.8.18
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3da3cee8fea00b2df50efca2539557308012092d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release notes:
https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
https://forum.torproject.org/t/alpha-and-stable-release-0-4-8-18-and-0-4-9-3-alpha/20578

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 66ef333884a93d8acea0286fcd9f6ee0b8e1c0f9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 55c915ef4d..95a3a26eb7 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.17.tar.gz.sha256sum
-sha256  79b4725e1d4b887b9e68fd09b0d2243777d5ce3cd471e538583bcf6f9d8cdb56  tor-0.4.8.17.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.18.tar.gz.sha256sum
+sha256  4aea6c109d4eff4ea2bafb905a7e6b0a965d14fe856214b02fcd9046b4d93af8  tor-0.4.8.18.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 399d4b481f..f9ff4fbca6 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.17
+TOR_VERSION = 0.4.8.18
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
