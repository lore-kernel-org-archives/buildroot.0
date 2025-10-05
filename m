Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D25DCAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 17:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E7EF60A5B;
	Sun,  5 Oct 2025 17:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9hHgccpV0rz; Sun,  5 Oct 2025 17:19:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71A9460EB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71A9460EB2;
	Sun,  5 Oct 2025 17:19:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B34C5909
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B3D260A5B
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvN0CuVxBRae for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 17:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF0D560EB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF0D560EB2
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:19:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE2B4868F3; Sun,  5 Oct 2025 17:19:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Oct 2025 18:47:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d44150c69e0189ae1d0bb2cdb60a0c5012a8425c
X-Git-Newrev: a7ba7ee832c06a56e4d00cd629c6f9be16cf615e
X-Patchwork-Hint: ignore
Message-Id: <20251005171925.CE2B4868F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccache: bump version to 4.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7ba7ee832c06a56e4d00cd629c6f9be16cf615e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://ccache.dev/releasenotes.html#_ccache_4_12_1

Updated license hash due to upstream commits:
https://github.com/ccache/ccache/commit/df37867663000135eb0e80a7baad1fcf5b96b571
https://github.com/ccache/ccache/commit/bd2147f30307ab62dbdb8252e9c6f2ef2b1ec44f
https://github.com/ccache/ccache/commit/9ee66d6f93e2aaba974eb1871b71411fee92990a
https://github.com/ccache/ccache/commit/fbdcabc521aa2fba8ea600e8e45ab26d161b79f3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index ad617a3501..88377109db 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  d5a340e199977b7b1e89c0add794132c977fdc2ecc7ca5451e03d43627a1b1be  ccache-4.11.3.tar.xz
+sha256  42e6c4b260cffd92dfa755e26390f45f5842e8c1a5f64f2b2e68adfbe82d1542  ccache-4.12.1.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
-sha256  115fd61246934e8581b1ef9263017cae89e61b5f11599d7f7d6b98f69a700e66  LICENSE.adoc
+sha256  fc33d985529cdb5ea484ee46d6df4de6a6bca25ebdd3f3211c9d15f1c59dc75a  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 963ecd835e..75ef404d27 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.11.3
+CCACHE_VERSION = 4.12.1
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
