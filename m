Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDDAE7717F
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 13:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 642128115B;
	Sun,  8 Dec 2024 13:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPJZwiNCLgMY; Sun,  8 Dec 2024 13:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59D1681162
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59D1681162;
	Sun,  8 Dec 2024 13:07:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BBF8979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15C7F4028F
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7mWrh8-VH20 for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 13:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EDF340141
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EDF340141
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09F3186B77; Sun,  8 Dec 2024 13:06:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Nov 2024 22:21:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f59f69e0e01e2ece4c2e57cc0c371e017c36fe29
X-Git-Newrev: 9105e685464ff12f34a8b852562793edd59dfc16
X-Patchwork-Hint: ignore
Message-Id: <20241208130652.09F3186B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: bump to version 1.17.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9105e685464ff12f34a8b852562793edd59dfc16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://github.com/containers/skopeo/releases/tag/v1.17.0

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
[Julien: add change log link]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index c523dea46a..684232b350 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9402e71f3fba979d0c0509240b963847bfeda2eac60be83eb5a628fd67d098e6  skopeo-1.16.1-go2.tar.gz
+sha256  e548c044c7b644ba455f482df387ec90aceea432b9c61a0bab0ec8534970eb69  skopeo-1.17.0-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 9859d774d4..1a83c84dbc 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.16.1
+SKOPEO_VERSION = 1.17.0
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
