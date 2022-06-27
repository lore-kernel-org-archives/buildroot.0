Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90742C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BA5582BE5;
	Mon, 27 Jun 2022 22:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BA5582BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3FdXKWVKc8d9; Mon, 27 Jun 2022 22:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E644682BC3;
	Mon, 27 Jun 2022 22:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E644682BC3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA92E1BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 796AD415A8
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 796AD415A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SxGN7QbWr9Ex for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:40:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C328415C2
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C328415C2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A3526876FF; Mon, 27 Jun 2022 22:28:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 00:39:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cdbec6e6ee75c90b4554d9bb0660ce2a4934f2e
X-Git-Newrev: 22a333f91e0a976603e98516e7f683ad0b345cc2
X-Patchwork-Hint: ignore
Message-Id: <20220627222807.A3526876FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spice-protocol: bump to version
 0.14.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=22a333f91e0a976603e98516e7f683ad0b345cc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.freedesktop.org/spice/spice-protocol/-/blob/v0.14.4/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spice-protocol/spice-protocol.hash | 4 ++--
 package/spice-protocol/spice-protocol.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spice-protocol/spice-protocol.hash b/package/spice-protocol/spice-protocol.hash
index f02cf7f0e2..cd74c84ec7 100644
--- a/package/spice-protocol/spice-protocol.hash
+++ b/package/spice-protocol/spice-protocol.hash
@@ -1,5 +1,5 @@
-# From https://www.spice-space.org/download/releases/spice-protocol-0.14.3.tar.xz.sha256sum
-sha256  f986e5bc2a1598532c4897f889afb0df9257ac21c160c083703ae7c8de99487a  spice-protocol-0.14.3.tar.xz
+# From https://www.spice-space.org/download/releases/spice-protocol-0.14.4.tar.xz.sha256sum
+sha256  04ffba610d9fd441cfc47dfaa135d70096e60b1046d2119d8db2f8ea0d17d912  spice-protocol-0.14.4.tar.xz
 
 # Hash for license file
 sha256  eb55ea746be694c449224c7ddce6340648b075fd377281712a19094e7fb7ef92  COPYING
diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
index 172d45687d..dbeeb90b1d 100644
--- a/package/spice-protocol/spice-protocol.mk
+++ b/package/spice-protocol/spice-protocol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPICE_PROTOCOL_VERSION = 0.14.3
+SPICE_PROTOCOL_VERSION = 0.14.4
 SPICE_PROTOCOL_SOURCE = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.xz
 SPICE_PROTOCOL_SITE = http://www.spice-space.org/download/releases
 SPICE_PROTOCOL_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
