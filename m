Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AD1CCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 19:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E8C884A0A;
	Thu, 23 Oct 2025 19:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWNXOW25ZP97; Thu, 23 Oct 2025 19:57:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F40849FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F40849FD;
	Thu, 23 Oct 2025 19:57:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 791B543F
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 19:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FCE341F4D
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 19:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oq1G-Z2K33-Z for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 19:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A60DD40FD7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A60DD40FD7
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 19:56:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E1C2877A9; Thu, 23 Oct 2025 19:56:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Oct 2025 21:41:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1193da9a8ae92048152e015e9efd013f323de6b
X-Git-Newrev: 9540896a77d1f910fc81c4163ef8a110ebd914e4
X-Patchwork-Hint: ignore
Message-Id: <20251023195659.9E1C2877A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libminiupnpc: bump version to 2.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9540896a77d1f910fc81c4163ef8a110ebd914e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license hash due to copyright year bump:
https://github.com/miniupnp/miniupnp/commit/5ebfc34f9601f0fddfcfdd1521ea63d9bb97b339

Changelog:
https://github.com/miniupnp/miniupnp/blob/miniupnpc_2_3_3/miniupnpc/Changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libminiupnpc/libminiupnpc.hash | 4 ++--
 package/libminiupnpc/libminiupnpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libminiupnpc/libminiupnpc.hash b/package/libminiupnpc/libminiupnpc.hash
index 4f7e7c7aa1..de252310fc 100644
--- a/package/libminiupnpc/libminiupnpc.hash
+++ b/package/libminiupnpc/libminiupnpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b0c3a27056840fd0ec9328a5a9bac3dc5e0ec6d2e8733349cf577b0aa1e70ac1  miniupnpc-2.2.7.tar.gz
-sha256  7480ae23b082c05ad9823896163d78f3a96f1beadce51f29c96cf898545c27e5  LICENSE
+sha256  d52a0afa614ad6c088cc9ddff1ae7d29c8c595ac5fdd321170a05f41e634bd1a  miniupnpc-2.3.3.tar.gz
+sha256  52bdad87d7aefe3eab35cb02426aa748510f9398a1e2d520d93bcbb18f10dd11  LICENSE
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 3bd4ee6a9f..7eea4318c6 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMINIUPNPC_VERSION = 2.2.7
+LIBMINIUPNPC_VERSION = 2.3.3
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
