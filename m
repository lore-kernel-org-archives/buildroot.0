Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D51E77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 09:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 675E740748;
	Thu,  9 Jan 2025 09:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fll0MH8q6-oW; Thu,  9 Jan 2025 09:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6E7E4073D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6E7E4073D;
	Thu,  9 Jan 2025 09:24:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39097940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFF0640605
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxJD7sBMJ-am for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 09:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B52E40B26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B52E40B26
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:24:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F25B3821EE; Thu,  9 Jan 2025 09:24:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jan 2025 10:18:06 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a007e8fefd6a205afd8b3ce4d3fdef58f61e7901
X-Git-Newrev: 92bb20468a0e4913632fd07c7b2adcd4790d8a47
X-Patchwork-Hint: ignore
Message-Id: <20250109092421.F25B3821EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/zic: bump version
 to 2024b
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

commit: https://git.buildroot.net/buildroot/commit/?id=92bb20468a0e4913632fd07c7b2adcd4790d8a47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Release notes:
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/IZ7AO6WRE3W3TWBL5IR6PMQUL433BQIE/

Rebased the patch and updated the hash URL.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c994deab9fd357af0c1afadeba0944fe6322c073)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zic/0001-remove-dependency-check-on-version-file.patch | 8 ++++----
 package/zic/zic.hash                                           | 4 ++--
 package/zic/zic.mk                                             | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/zic/0001-remove-dependency-check-on-version-file.patch b/package/zic/0001-remove-dependency-check-on-version-file.patch
index cba7ed679e..1eb1074c31 100644
--- a/package/zic/0001-remove-dependency-check-on-version-file.patch
+++ b/package/zic/0001-remove-dependency-check-on-version-file.patch
@@ -15,18 +15,18 @@ Signed-off-by: Martin Bark <martin@barkynet.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 1b714a8..00d2c09 100644
+index 0087b459..4773a977 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -615,7 +615,7 @@ INSTALL:	ALL install date.1
+@@ -673,7 +673,7 @@ INSTALL:	ALL install date.1
  # Otherwise, use $(VERSION) unless it is "unknown" and there is already
  # a 'version' file, in which case reuse the existing 'version' contents
  # and append "-dirty" if the contents do not already end in "-dirty".
 -version:	$(VERSION_DEPS)
 +version:
  		{ (type git) >/dev/null 2>&1 && \
- 		  V=`git describe --match '[0-9][0-9][0-9][0-9][a-z]*' \
- 				--abbrev=7 --dirty` || \
+ 		  V=$$(git describe --match '[0-9][0-9][0-9][0-9][a-z]*' \
+ 				--abbrev=7 --dirty) || \
 -- 
 2.7.4
 
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 80c96ed793..124b724e6e 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2024-February/000081.html
-sha512  46da8bfa762c7d109db93e5c060789097fc0e1e38bdad5bb8fec886ef47f138bd03b913a743cd5f7e23dc359a72bfd63e7ffc0de199d2b51e6a174361dbdc43c  tzcode2024a.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/IZ7AO6WRE3W3TWBL5IR6PMQUL433BQIE/
+sha512  0e4e872d6c6d9e2ce8c4e567fcbb7658942b8544157d1e48673d9cb989f3af3379fa58e7a71ab98f4a8f2ac6727de1f8c4cd1981053409ebd8989345dc640026  tzcode2024b.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 8abcec9360..9382fa4187 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2024a
+ZIC_VERSION = 2024b
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
