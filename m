Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54478C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10F0783F28;
	Mon, 20 Feb 2023 23:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10F0783F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pp5Njk5pWimx; Mon, 20 Feb 2023 23:37:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FADC83F2D;
	Mon, 20 Feb 2023 23:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FADC83F2D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82F951BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 298A041597
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 298A041597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZP59Mp9LBWud for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B4614175F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B4614175F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68F2786495; Mon, 20 Feb 2023 20:52:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:59:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6893eabaa05e2ad4c3fe375196e1b84e3cee3326
X-Git-Newrev: d3ecb398b113439351e8e26122763028efce10cd
X-Patchwork-Hint: ignore
Message-Id: <20230220205239.68F2786495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pangomm: switch to
 https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3ecb398b113439351e8e26122763028efce10cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pangomm/pangomm.hash | 2 +-
 package/pangomm/pangomm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pangomm/pangomm.hash b/package/pangomm/pangomm.hash
index 3fba695831..0fb40e6568 100644
--- a/package/pangomm/pangomm.hash
+++ b/package/pangomm/pangomm.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/pangomm/2.48/pangomm-2.48.2.sha256sum
+# From https://download.gnome.org/sources/pangomm/2.48/pangomm-2.48.2.sha256sum
 sha256  e1d75522c53f462799875cd247f9b49c91ced4b1abe68387ac35b271392d4ea5  pangomm-2.48.2.tar.xz
 # Locally computed
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/pangomm/pangomm.mk b/package/pangomm/pangomm.mk
index af90d69c4e..e5b237197b 100644
--- a/package/pangomm/pangomm.mk
+++ b/package/pangomm/pangomm.mk
@@ -7,7 +7,7 @@
 PANGOMM_VERSION_MAJOR = 2.48
 PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).2
 PANGOMM_SOURCE = pangomm-$(PANGOMM_VERSION).tar.xz
-PANGOMM_SITE = http://ftp.gnome.org/pub/gnome/sources/pangomm/$(PANGOMM_VERSION_MAJOR)
+PANGOMM_SITE = https://download.gnome.org/sources/pangomm/$(PANGOMM_VERSION_MAJOR)
 PANGOMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 PANGOMM_LICENSE_FILES = COPYING COPYING.tools
 PANGOMM_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
