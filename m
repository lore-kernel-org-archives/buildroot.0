Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E19C3DA7F
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 09:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E20E38444A;
	Sat, 10 Aug 2024 09:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8ue6p4DDhDH; Sat, 10 Aug 2024 09:53:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C60648437C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C60648437C;
	Sat, 10 Aug 2024 09:53:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 840AE1BF5F8
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 09:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F01A41374
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 09:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCHyF3Y5o4w4 for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 09:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE7F741370
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE7F741370
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 09:53:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA5F784A82; Sat, 10 Aug 2024 09:53:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 11:11:08 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 200326a1944cc8092838b9f5aa3e8a56431aa83e
X-Git-Newrev: 1c98218005276dd2607526495f9ed9446384af4f
X-Patchwork-Hint: ignore
Message-Id: <20240810095325.CA5F784A82@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gcc: bump 12.x
 series to 12.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c98218005276dd2607526495f9ed9446384af4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

https://gcc.gnu.org/gcc-12/changes.html describes the changes of gcc
12.4 as follows:

  This is the list of problem reports (PRs) from GCC's bug tracking
  system that are known to be fixed in the 12.4 release. This list
  might not be complete (that is, it is possible that some PRs that
  have been fixed are not listed here).

With a link to
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=12.4

There are 654 relevant commits (ignoring the "daily bumps") between
gcc 12.3.0 and 12.4.0, which is too much to list exhaustively here.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit b4454720908e79252ea98bcbe4de86e4bbd4de77)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                                   | 2 +-
 .../0001-disable-split-stack-for-non-thread-builds.patch              | 0
 .../0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch      | 0
 .../0003-xtensa-add-.note.GNU-stack-section-on-linux.patch            | 0
 package/gcc/Config.in.host                                            | 2 +-
 package/gcc/gcc.hash                                                  | 4 ++--
 6 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e349e31812..dfe71f1505 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -418,7 +418,7 @@ package/gamin/0002-no-const-return.patch Sob Upstream
 package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch Upstream
 package/gcc/11.4.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch Upstream
 package/gcc/11.4.0/0004-disable-split-stack-for-non-thread-builds.patch Upstream
-package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch Upstream
+package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch Upstream
 package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch Upstream
diff --git a/package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch
similarity index 100%
rename from package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch
diff --git a/package/gcc/12.3.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch b/package/gcc/12.4.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
similarity index 100%
rename from package/gcc/12.3.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
rename to package/gcc/12.4.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
diff --git a/package/gcc/12.3.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch b/package/gcc/12.4.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
similarity index 100%
rename from package/gcc/12.3.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
rename to package/gcc/12.4.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8efea378fb..33f2477bfc 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -77,7 +77,7 @@ config BR2_GCC_VERSION
 	string
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "11.4.0"    if BR2_GCC_VERSION_11_X
-	default "12.3.0"    if BR2_GCC_VERSION_12_X
+	default "12.4.0"    if BR2_GCC_VERSION_12_X
 	default "13.3.0"    if BR2_GCC_VERSION_13_X
 	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 964fbc97df..d8d5566a97 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b
 sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3cd7bf795e72fcbead59cdef5b6c152862f5d35cd9fbfe6902101ce648  gcc-10.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-11.4.0/sha512.sum
 sha512  a5018bf1f1fa25ddf33f46e720675d261987763db48e7a5fdf4c26d3150a8abcb82fdc413402df1c32f2e6b057d9bae6bdfa026defc4030e10144a8532e60f14  gcc-11.4.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.3.0/sha512.sum
-sha512  8fb799dfa2e5de5284edf8f821e3d40c2781e4c570f5adfdb1ca0671fcae3fb7f794ea783e80f01ec7bfbf912ca508e478bd749b2755c2c14e4055648146c204  gcc-12.3.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.4.0/sha512.sum
+sha512  5bd29402cad2deb5d9388d0236c7146414d77e5b8d5f1c6c941c7a1f47691c3389f08656d5f6e8e2d6717bf2c81f018d326f632fb468f42925b40bd217fc4853  gcc-12.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-13.3.0/sha512.sum
 sha512  ed5f2f4c6ed2c796fcf2c93707159e9dbd3ddb1ba063d549804dd68cdabbb6d550985ae1c8465ae9a336cfe29274a6eb0f42e21924360574ebd8e5d5c7c9a801  gcc-13.3.0.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
