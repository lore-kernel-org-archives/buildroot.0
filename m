Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98247CCFA1A
	for <buildroot@archiver.kernel.org>; Tue, 11 Nov 2025 10:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F04880E26;
	Tue, 11 Nov 2025 10:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xTWoesXEagp; Tue, 11 Nov 2025 10:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F5E280E47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F5E280E47;
	Tue, 11 Nov 2025 10:48:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74DC931C
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 10:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66E3540949
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 10:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87S_yi2Cl5dt for <buildroot@buildroot.org>;
 Tue, 11 Nov 2025 10:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CE1B4093C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CE1B4093C
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 10:48:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56E6A840AB; Tue, 11 Nov 2025 10:48:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Nov 2025 11:42:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd36d329f180436cc0e1a68c38ef9299424316cf
X-Git-Newrev: c530f9d846f50ba0e1b5e2df58117a4815a2bfc5
X-Patchwork-Hint: ignore
Message-Id: <20251111104830.56E6A840AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/valgrind: bump to version 3.26.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c530f9d846f50ba0e1b5e2df58117a4815a2bfc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license has been updated to the GNU General Public License, version 3.
(see https://sourceware.org/git/?p=valgrind.git;a=commit;h=3392155359822c0d4e8bb371862e92425054d02a)

Release notes:
https://sourceware.org/git/?p=valgrind.git;a=blob;f=NEWS;h=fdeebfaead9050b9fd43b6e7ba55d0d674367cb3;hb=218cee2feb2556b6b4b8991cf0977256b801e3e5

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/valgrind/valgrind.hash | 6 +++---
 package/valgrind/valgrind.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 848421f091..8e62256b9c 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,8 +1,8 @@
 # From https://valgrind.org/downloads/current.html
-sha1  4d2cc4d527213f81af573bca4d2cb93ccac7f274  valgrind-3.25.1.tar.bz2
+sha1  c32f135761724db05f018fff67e06c4edf328770  valgrind-3.26.0.tar.bz2
 # locally computed
-sha256  61deb8d0727b45c268efdc1b3b6c9e679cd97cbf5ee4b28d1dead7c8b7a271af  valgrind-3.25.1.tar.bz2
+sha256  8d54c717029106f1644aadaf802ab9692e53d93dd015cbd19e74190eba616bd7  valgrind-3.26.0.tar.bz2
 
 # License files
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
 sha256  56976e64523fa1e68db4e6f464f5b2cb89d7d08f54b1d012e317b8db286b3faf  COPYING.DOCS
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 73568932a0..dc8d73b943 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.25.1
+VALGRIND_VERSION = 3.26.0
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
-VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
+VALGRIND_LICENSE = GPL-3.0+, GFDL-1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
 VALGRIND_CPE_ID_VENDOR = valgrind
 VALGRIND_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
