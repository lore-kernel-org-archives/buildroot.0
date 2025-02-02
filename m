Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700F4C0218F
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 22:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CED460824;
	Sun,  2 Feb 2025 22:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVDOUGxw0ZwM; Sun,  2 Feb 2025 22:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BC50608F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BC50608F5;
	Sun,  2 Feb 2025 22:30:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3990C12A
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 22:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 265EA60A8E
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 22:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJRwxcXHEf8V for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 22:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A4E660A66
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A4E660A66
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 22:30:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 460468681A; Sun,  2 Feb 2025 22:30:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 2 Feb 2025 23:27:03 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7481c699144a2080279922af4c4ccade7c21bbc8
X-Git-Newrev: ca095b02058c14c0605534464a38b29d763eeab5
X-Patchwork-Hint: ignore
Message-Id: <20250202223006.460468681A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/socat: bump to
 version 1.8.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca095b02058c14c0605534464a38b29d763eeab5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

For change log, see:
http://www.dest-unreach.org/socat/CHANGES

Update README hash for changes unrelated to license.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
[Julien: add change log URL]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c47dc84328455d092cf62f3a5f2581472fab85d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/socat/socat.hash | 6 +++---
 package/socat/socat.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index 2a14d75303..70c6e6a8f1 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,8 +1,8 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5  51f9ecdf5d942d0a3c150ea400eb89ef  socat-1.8.0.0.tar.bz2
+md5  e53a6e8e8594ac87476fe4ae361bbcd1  socat-1.8.0.1.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256  e1de683dd22ee0e3a6c6bbff269abe18ab0c9d7eb650204f125155b9005faca7  socat-1.8.0.0.tar.bz2
+sha256  6a283565db7cf86292c6f70504c58abb03e29888adeed5a6c5f3457e803c1b81  socat-1.8.0.1.tar.bz2
 # Locally calculated
-sha256  de9d702354b2e748ea87eb20d18c3d90ebede5dc6d2fc3c2e0645d139a5181bc  README
+sha256  6c07bae42bf0a919c9dd6583f76cc9020a472652dcdad3e84923074a1f412d75  README
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 7f634c28f0..84d9cd3cf8 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.8.0.0
+SOCAT_VERSION = 1.8.0.1
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
