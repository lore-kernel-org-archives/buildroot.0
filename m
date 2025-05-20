Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EE3C3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E040C404E1;
	Tue, 20 May 2025 17:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5tXafEJrZ6_X; Tue, 20 May 2025 17:34:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBDA240524
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBDA240524;
	Tue, 20 May 2025 17:34:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60922D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53324403E6
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0IDBQle8yEg for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 823254015F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 823254015F
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:34:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A19A8750A; Tue, 20 May 2025 17:34:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 19:33:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3ff4826a53b0ebaaea517f71acfe0eacf71a0b99
X-Git-Newrev: 969bdb9d2e1857589292122adbc75073b1b30cd5
X-Patchwork-Hint: ignore
Message-Id: <20250520173429.6A19A8750A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sudo: bump version to
 1.9.16p2
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

commit: https://git.buildroot.net/buildroot/commit/?id=969bdb9d2e1857589292122adbc75073b1b30cd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change summary since version 1.9.15p5, see:
https://www.sudo.ws/releases/stable/#1.9.16p2

For detailed change log, see:
https://www.sudo.ws/releases/changelog/
https://github.com/sudo-project/sudo/commits/SUDO_1_9_16p2/

Removed patch which is included in this release.

Updated license hash due to copyright year bump and whitespace fixes:
https://github.com/sudo-project/sudo/commits/SUDO_1_9_16p2/LICENSE.md

Note: Sudo 1.9.16p2 includes fixes to compile with C23/gcc-15.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add links to change logs in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ptrace-fix-build-without-precess_vm_readv.patch | 41 ----------------------
 package/sudo/sudo.hash                             |  4 +--
 package/sudo/sudo.mk                               |  4 +--
 3 files changed, 4 insertions(+), 45 deletions(-)

diff --git a/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch b/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch
deleted file mode 100644
index 446f1d1797..0000000000
--- a/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 5bbfaa8e68b5ee6f27d4fbfa3c4e789341724f9c Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 17 Feb 2024 17:52:45 +0100
-Subject: [PATCH] src/exec_ptrace: fix build without precess_vm_readv()
-
-Commit 32f4b98f6b4a (sudo frontend: silence most -Wconversion warnings.)
-broke the build on C libraries that miss process_vm_readv(), like
-uClibc-ng.
-
-Indeed, the ssize_t nwritten is declared guarded by HAVE_PROCESS_VM_READV,
-but is then re-assigned and used a few lines below, outside any guard.
-
-Fix that by always declaring the object, as it is always needed.
-
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Upstream: https://github.com/sudo-project/sudo/commit/5bbfaa8e68b5ee6f27d4fbfa3c4e789341724f9c
----
- src/exec_ptrace.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/exec_ptrace.c b/src/exec_ptrace.c
-index 9dd36c275..3d44b82e2 100644
---- a/src/exec_ptrace.c
-+++ b/src/exec_ptrace.c
-@@ -878,11 +878,12 @@ ptrace_write_vec(pid_t pid, struct sudo_ptrace_regs *regs, char **vec,
-     unsigned long addr, unsigned long strtab)
- {
-     const unsigned long strtab0 = strtab;
-+    ssize_t nwritten;
-     size_t i;
-     debug_decl(ptrace_write_vec, SUDO_DEBUG_EXEC);
-
- #ifdef HAVE_PROCESS_VM_READV
--    ssize_t nwritten = ptrace_writev_vec(pid, regs, vec, addr, strtab);
-+    nwritten = ptrace_writev_vec(pid, regs, vec, addr, strtab);
-     if (nwritten != -1 || errno != ENOSYS)
- 	debug_return_ssize_t(nwritten);
- #endif /* HAVE_PROCESS_VM_READV */
---
-2.43.0
-
diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 066d3b9de6..ed4e527f36 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: https://www.sudo.ws/getting/download/
-sha256  558d10b9a1991fb3b9fa7fa7b07ec4405b7aefb5b3cb0b0871dbc81e3a88e558  sudo-1.9.15p5.tar.gz
+sha256  976aa56d3e3b2a75593307864288addb748c9c136e25d95a9cc699aafa77239c  sudo-1.9.16p2.tar.gz
 # Locally calculated
-sha256  ea33b3971e8e4d9657cd6794a952aaa71b22bd16745f1645455b6ead010e0a28  LICENSE.md
+sha256  a6e4ec823f2ba58f840b0ff5fc5459e4893f46a91bbcd6b2a2d91315de5a2d2b  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 7961a99002..1fe713ab2d 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUDO_VERSION_MAJOR = 1.9.15
-SUDO_VERSION_MINOR = p5
+SUDO_VERSION_MAJOR = 1.9.16
+SUDO_VERSION_MINOR = p2
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
