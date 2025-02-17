Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B36C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 20:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E67E1403C7;
	Mon, 17 Feb 2025 20:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZrj9rWSOTnH; Mon, 17 Feb 2025 20:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C794040300
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C794040300;
	Mon, 17 Feb 2025 20:21:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1701CC8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0611060DFA
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_WahSCvyci8 for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 20:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 468EA60D9C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 468EA60D9C
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:21:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 302D58770B; Mon, 17 Feb 2025 20:21:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 21:17:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad82b284271b7039144a290b503aba294c1e39bf
X-Git-Newrev: ee53f5fcbaabe17617fba300e78b965c81863f90
X-Patchwork-Hint: ignore
Message-Id: <20250217202123.302D58770B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpp-httplib: bump to version 0.19.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee53f5fcbaabe17617fba300e78b965c81863f90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://github.com/yhirose/cpp-httplib/releases/tag/v0.19.0

Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index 45c2214105..0984bd359b 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6ed5894bbbc4a34a0f4c5e962672d0003d2ea099bbadacc66f6dee2b213ff394  cpp-httplib-0.18.0.tar.gz
+sha256  c9b9e0524666e1cd088f0874c57c1ce7c0eaa8552f9f4e15c755d5201fc8c608  cpp-httplib-0.19.0.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 5a02b562b3..f3a8710d20 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.18.0
+CPP_HTTPLIB_VERSION = 0.19.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
