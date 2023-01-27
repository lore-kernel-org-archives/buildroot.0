Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0257C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99A2061AD6;
	Tue, 21 Feb 2023 01:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99A2061AD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7eCwftT5iA27; Tue, 21 Feb 2023 01:14:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1FBA6F963;
	Tue, 21 Feb 2023 01:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1FBA6F963
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 092961BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 147376FBCE
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 147376FBCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GN9JE_qEgopn for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18D0D6FBAE
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18D0D6FBAE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1075D81979; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 13:46:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ef2af4b67f3403fc0feaca8a07d1733f17c6b316
X-Git-Newrev: 1b20c52a5bb13fde04f4ad47fafd1daca664c2bb
X-Patchwork-Hint: ignore
Message-Id: <20230220205241.1075D81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libmodsecurity: bump
 to version 3.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b20c52a5bb13fde04f4ad47fafd1daca664c2bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/SpiderLabs/ModSecurity/releases/tag/v3.0.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodsecurity/libmodsecurity.hash | 4 ++--
 package/libmodsecurity/libmodsecurity.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index 087157d162..7ba0ef7f18 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.7/modsecurity-v3.0.7.tar.gz.sha256
-sha256  cfd8b7e7e6a0e9ca4e19b9adeb07594ba75eba16a66da5e9b0974c0117c21a34  modsecurity-v3.0.7.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.8/modsecurity-v3.0.8.tar.gz.sha256
+sha256  e241c89b3cd7e58a863d0d0d6b9b8ba4d33ffb0f51171044c258c62e3e7956c7  modsecurity-v3.0.8.tar.gz
 # Localy calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 916ba8fbcb..e83fda895f 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.7
+LIBMODSECURITY_VERSION = 3.0.8
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
