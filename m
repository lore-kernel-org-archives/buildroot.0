Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E73EC74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 09:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 163FF408A1;
	Sat, 18 Mar 2023 09:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 163FF408A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VaRo0nvr_Phx; Sat, 18 Mar 2023 09:33:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11E6B402C2;
	Sat, 18 Mar 2023 09:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11E6B402C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE29F1BF3A3
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 09:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84FD482170
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 09:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84FD482170
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nOGSrfzdqftT for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 09:33:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A41BB82164
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 09:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A41BB82164
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9444686FC3; Sat, 18 Mar 2023 09:33:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 10:27:26 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 0fac4a91fb99abc7864567e1c67874442281a2be
X-Git-Newrev: 141d359a105f3cacd0d1ec4878d7de3940d578c0
X-Patchwork-Hint: ignore
Message-Id: <20230318093319.9444686FC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/libmodsecurity:
 security bump to version 3.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=141d359a105f3cacd0d1ec4878d7de3940d578c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

https://github.com/SpiderLabs/ModSecurity/releases/tag/v3.0.8
https://coreruleset.org/20220919/crs-version-3-3-3-and-3-2-2-covering-several-cves/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1b20c52a5bb13fde04f4ad47fafd1daca664c2bb)
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
