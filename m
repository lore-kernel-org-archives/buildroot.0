Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65268EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99DCC418F8;
	Tue, 25 Jul 2023 21:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99DCC418F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6rOcoU2vLwpq; Tue, 25 Jul 2023 21:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5677D41912;
	Tue, 25 Jul 2023 21:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5677D41912
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B41F51BF980
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E0EC608A5
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E0EC608A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6qwMwBmc_vhC for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:00:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE49160864
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 21:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE49160864
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 977C382DC8; Tue, 25 Jul 2023 21:00:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 22:49:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7644af3c04b3229465d0a8b72d24737dca7384c
X-Git-Newrev: 1ea6f04f8bf6ddb93ad3e248a588ac9f3032def0
X-Patchwork-Hint: ignore
Message-Id: <20230725210022.977C382DC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland-protocols: bump to version
 1.32
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ea6f04f8bf6ddb93ad3e248a588ac9f3032def0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 45c62a396b..d039cd6fba 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-November/042524.html
-sha256  a07fa722ed87676ec020d867714bc9a2f24c464da73912f39706eeef5219e238  wayland-protocols-1.31.tar.xz
-sha512  402ce1915300e29afe554d77965ee0a28a5f22fdb5b901c4c640e59b9f3a9c11094e1edae87eea1e76eea557f6faf0c34a0c28ee7f6babb4dc3719329c4e25bf  wayland-protocols-1.31.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2023-July/042836.html
+sha256  7459799d340c8296b695ef857c07ddef24c5a09b09ab6a74f7b92640d2b1ba11  wayland-protocols-1.32.tar.xz
+sha512  90bbd52daf342b98823ddeed04e349ae242d2eaf925ab8d603cceb36c980c83b5681bb890961e0d49584cb5c2e60a33abf8821770c6ab87956383630bd5b7966  wayland-protocols-1.32.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 54f9ed8a3a..2cfaa830e5 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.31
+WAYLAND_PROTOCOLS_VERSION = 1.32
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
