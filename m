Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5F0C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B512770D44;
	Fri, 28 Feb 2025 17:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rweZdpNc9FLw; Fri, 28 Feb 2025 17:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B98A0703B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B98A0703B3;
	Fri, 28 Feb 2025 17:19:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10FBD1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9398145A57
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RVrGq_UZNrDN for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D3724651F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D3724651F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6780D873D5; Fri, 28 Feb 2025 16:30:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 18:24:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 605d17e56fe7800f3fc7cae8bbed7a3f1201bdea
X-Git-Newrev: ca5618a42f9f183ec71f31c1b09976d56c80cd0b
X-Patchwork-Hint: ignore
Message-Id: <20250228163042.6780D873D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/restclient-cpp: bump
 to version 0.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca5618a42f9f183ec71f31c1b09976d56c80cd0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

ChangeLog:
https://github.com/mrtazz/restclient-cpp/blob/main/CHANGELOG.md

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/restclient-cpp/restclient-cpp.hash | 2 +-
 package/restclient-cpp/restclient-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/restclient-cpp/restclient-cpp.hash b/package/restclient-cpp/restclient-cpp.hash
index 96c6d6c9e0..55f3b3589b 100644
--- a/package/restclient-cpp/restclient-cpp.hash
+++ b/package/restclient-cpp/restclient-cpp.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  d62ba618f9a938652fd53b483289e8662a99451839e59058c8beb286dfbc65ec  restclient-cpp-0.5.2.tar.gz
+sha256  ca450e15d9b9724234d234686f22862eef97b776cbebb433382830974949d6f2  restclient-cpp-0.5.3.tar.gz
 sha256  1c2f79e825a39eb61d8919044776627f4d079ff38975410a3bde340154fc94a4  LICENSE
diff --git a/package/restclient-cpp/restclient-cpp.mk b/package/restclient-cpp/restclient-cpp.mk
index 1ba9ed8139..6a0c8627af 100644
--- a/package/restclient-cpp/restclient-cpp.mk
+++ b/package/restclient-cpp/restclient-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESTCLIENT_CPP_VERSION = 0.5.2
+RESTCLIENT_CPP_VERSION = 0.5.3
 RESTCLIENT_CPP_SITE = $(call github,mrtazz,restclient-cpp,$(RESTCLIENT_CPP_VERSION))
 RESTCLIENT_CPP_LICENSE = MIT
 RESTCLIENT_CPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
