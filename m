Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8115AC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDEE65053A;
	Fri, 28 Feb 2025 17:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWPEVyk3j14q; Fri, 28 Feb 2025 17:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBC85506B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBC85506B7;
	Fri, 28 Feb 2025 17:07:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1051668
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C47F742EC1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAMy6nbhjT_J for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 117A442EFC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 117A442EFC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D5558616F; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 2 Feb 2025 12:35:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2d9ccb307a5fddf476ed03c6add76238f9aac08d
X-Git-Newrev: 1bc34cded87ea5565f692ee5e79ae05fb82cc8f9
X-Patchwork-Hint: ignore
Message-Id: <20250228163024.0D5558616F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libbroadvoice: switch
 to github
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

commit: https://git.buildroot.net/buildroot/commit/?id=1bc34cded87ea5565f692ee5e79ae05fb82cc8f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/Installation/Linux/Deprecated-Installation-Instructions/25460805/
"FreeSWITCH project has been moved to GitHub"

Updated hash due to switch to github.

Fixes:
https://autobuild.buildroot.org/results/b4ea75a8bf113409b6c890d422b99c2bb49c3ecf/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libbroadvoice/libbroadvoice.hash | 2 +-
 package/libbroadvoice/libbroadvoice.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libbroadvoice/libbroadvoice.hash b/package/libbroadvoice/libbroadvoice.hash
index 1644fb4ba1..9115a38e07 100644
--- a/package/libbroadvoice/libbroadvoice.hash
+++ b/package/libbroadvoice/libbroadvoice.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  74b7c9bbf90d2d8d8ec9befe73066f5c0d734498f586f6c870eb24dff2edcad7  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564-git4.tar.gz
+sha256  39fd8a5f76598f2cb23b759bcd458a45a99e6ff830471576a2485c98b2ab1e48  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564.tar.gz
 sha256  2550586c993ce4a8c23c8b11968ea36192116a896a2504799cc65307d769c094  COPYING
diff --git a/package/libbroadvoice/libbroadvoice.mk b/package/libbroadvoice/libbroadvoice.mk
index 9c6b4e292d..69e235e84e 100644
--- a/package/libbroadvoice/libbroadvoice.mk
+++ b/package/libbroadvoice/libbroadvoice.mk
@@ -9,8 +9,7 @@ LIBBROADVOICE_VERSION = f65b0f50c8c767229fbf1758370880abc0d78564
 # "This library is based on the Broadcom reference code, but has been
 # heavily modified so that it builds into a proper library, with a clean
 # usable interface, on a range of platforms."
-LIBBROADVOICE_SITE = https://freeswitch.org/stash/scm/sd/libbroadvoice.git
-LIBBROADVOICE_SITE_METHOD = git
+LIBBROADVOICE_SITE = $(call github,freeswitch,libbroadvoice,$(LIBBROADVOICE_VERSION))
 LIBBROADVOICE_LICENSE = LGPL-2.1
 LIBBROADVOICE_LICENSE_FILES = COPYING
 LIBBROADVOICE_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
