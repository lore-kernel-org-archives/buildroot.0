Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56716C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 13:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEE3140AEF;
	Wed,  9 Mar 2022 13:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JyejbubfoK7Q; Wed,  9 Mar 2022 13:32:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4B4540A0C;
	Wed,  9 Mar 2022 13:32:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15D7E1BF869
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7086860BEB
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJS-QHIhDUjw for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 13:30:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 079E560C2D
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 13:30:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 84EE083915; Wed,  9 Mar 2022 13:21:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 20:49:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16ff948444c3978d63f483344a3d92d994c64312
X-Git-Newrev: f5a8485963dc0112c0201e712d599d31f0081035
X-Patchwork-Hint: ignore
Message-Id: <20220309132156.84EE083915@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opentracing-cpp: bump to version
 1.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5a8485963dc0112c0201e712d599d31f0081035
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/opentracing/opentracing-cpp/releases/tag/v1.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/opentracing-cpp/opentracing-cpp.hash | 4 ++--
 package/opentracing-cpp/opentracing-cpp.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/opentracing-cpp/opentracing-cpp.hash b/package/opentracing-cpp/opentracing-cpp.hash
index 591c0e4a0a..8cfaf5fd47 100644
--- a/package/opentracing-cpp/opentracing-cpp.hash
+++ b/package/opentracing-cpp/opentracing-cpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 015c4187f7a6426a2b5196f0ccd982aa87f010cf61f507ae3ce5c90523f92301 opentracing-cpp-1.5.1.tar.gz
-sha256 076d03156735d5ff2df2ea0f8b12351ef65e5e9222b5c8c6a35101dadb41e717 LICENSE
+sha256  5b170042da4d1c4c231df6594da120875429d5231e9baa5179822ee8d1054ac3  opentracing-cpp-1.6.0.tar.gz
+sha256  076d03156735d5ff2df2ea0f8b12351ef65e5e9222b5c8c6a35101dadb41e717  LICENSE
diff --git a/package/opentracing-cpp/opentracing-cpp.mk b/package/opentracing-cpp/opentracing-cpp.mk
index 0605cd5d96..12ce40fbed 100644
--- a/package/opentracing-cpp/opentracing-cpp.mk
+++ b/package/opentracing-cpp/opentracing-cpp.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-OPENTRACING_CPP_VERSION = 1.5.1
-OPENTRACING_CPP_SITE = $(call github,opentracing,opentracing-cpp,v$(OPENTRACING_CPP_VERSION))
+OPENTRACING_CPP_VERSION = 1.6.0
+OPENTRACING_CPP_SITE = \
+	$(call github,opentracing,opentracing-cpp,v$(OPENTRACING_CPP_VERSION))
 OPENTRACING_CPP_LICENSE = Apache-2.0
 OPENTRACING_CPP_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
