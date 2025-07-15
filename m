Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37309C83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 18:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D9CF61548;
	Wed, 16 Jul 2025 18:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W81bUm9Nxj8j; Wed, 16 Jul 2025 18:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3100F6151D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3100F6151D;
	Wed, 16 Jul 2025 18:38:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CA5C11AA
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC9FD40F36
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIwL8mOfh1uQ for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 18:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22EC94005F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22EC94005F
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 202DB86450; Wed, 16 Jul 2025 18:38:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 23:50:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad46554dc0b47fae12ae1476a826403b484ed27a
X-Git-Newrev: 413b9774a4bceda35c4e0c67f4d5aea78ee38924
X-Patchwork-Hint: ignore
Message-Id: <20250716183803.202DB86450@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/slirp4netns: bump to version 1.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=413b9774a4bceda35c4e0c67f4d5aea78ee38924
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://github.com/rootless-containers/slirp4netns/releases/tag/v1.3.3

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/slirp4netns/slirp4netns.hash | 2 +-
 package/slirp4netns/slirp4netns.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/slirp4netns/slirp4netns.hash b/package/slirp4netns/slirp4netns.hash
index 1751566185..cb9088e8e8 100644
--- a/package/slirp4netns/slirp4netns.hash
+++ b/package/slirp4netns/slirp4netns.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c98ef2679c7b8c96eed95409138a22904a0550494d191385637e953534d15c75  slirp4netns-1.3.2.tar.gz
+sha256  8d24539967850bada944d56459eb9e9167357d57b39e864d95ed7d6c0dd0298d  slirp4netns-1.3.3.tar.gz
 sha256  58db3cfabf8ec806bc060e54ab5466a31de4a3ae80fe4a8aa02fb6b1c053c93f  COPYING
diff --git a/package/slirp4netns/slirp4netns.mk b/package/slirp4netns/slirp4netns.mk
index 5923957c25..ab63120305 100644
--- a/package/slirp4netns/slirp4netns.mk
+++ b/package/slirp4netns/slirp4netns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SLIRP4NETNS_VERSION = 1.3.2
+SLIRP4NETNS_VERSION = 1.3.3
 SLIRP4NETNS_SITE = $(call github,rootless-containers,slirp4netns,v$(SLIRP4NETNS_VERSION))
 SLIRP4NETNS_LICENSE = GPL-2.0
 SLIRP4NETNS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
