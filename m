Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D90CE8D62
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3256F43295;
	Thu, 19 Sep 2024 09:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5iuXxCvH04dy; Thu, 19 Sep 2024 09:17:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBF474329E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBF474329E;
	Thu, 19 Sep 2024 09:17:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 045981BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3202D849BC
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjpE8NJaUt2E for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B73BA849D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B73BA849D1
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4C0283C66; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:39 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 878b994cd64a3e26b29a4e22b99dbaa983f7ecbb
X-Git-Newrev: ae67a5adbd21099d86ce586d0a422283a5ac3835
X-Patchwork-Hint: ignore
Message-Id: <20240919091606.B4C0283C66@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/bc: fix typos in
 patch descriptions
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae67a5adbd21099d86ce586d0a422283a5ac3835
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e2a0ab180c13ecb41b1c1aea65c9ca69fbe8bc90)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch                | 2 +-
 package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch | 2 +-
 package/bc/0004-no-gen-libmath.patch                                   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch b/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch
index 03d15f5524..5ff6125f67 100644
--- a/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch
+++ b/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch
@@ -3,7 +3,7 @@ From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Fri, 13 Sep 2019 13:45:02 -0500
 Subject: [PATCH] bc: use MAKEINFO variable for docs
 
-Use the appropiate MAKEINFO variable rather than the hardcoded makeinfo
+Use the appropriate MAKEINFO variable rather than the hardcoded makeinfo
 command directly, otherwise missing logic never works.
 
 Fixes:
diff --git a/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch b/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
index cc72e5cd69..1b4a7354d8 100644
--- a/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
+++ b/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
@@ -16,7 +16,7 @@ Quoting from the bug report:
      were correct.  I _think_ I got them all.  -iwj.
      -- Ian Jackson <iwj@ubuntu.com>  Tue,  4 Apr 2006 17:21:02 +0100
 
-Upsteam:
+Upstream:
 https://sources.debian.org/patches/bc/1.07.1-2/05_notice_read_write_errors.diff/
 
 [Reformatted to GIT for 1.0.7.1 by Matt W]
diff --git a/package/bc/0004-no-gen-libmath.patch b/package/bc/0004-no-gen-libmath.patch
index 7cd506be2c..15b7b9e5a8 100644
--- a/package/bc/0004-no-gen-libmath.patch
+++ b/package/bc/0004-no-gen-libmath.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] no gen libmath
 
 These rules are not cross-friendly so delete them.  libmath has been
 generated offline and included as part of this patch as the fbc tool
-used to generate that header is assuming the cross archtecture and
+used to generate that header is assuming the cross architecture and
 can't execute.
 
 Upstream:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
