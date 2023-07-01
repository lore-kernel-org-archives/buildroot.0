Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0645EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0484F60FDD;
	Sat,  1 Jul 2023 14:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0484F60FDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z7MAzkSy8E83; Sat,  1 Jul 2023 14:41:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA86660F92;
	Sat,  1 Jul 2023 14:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA86660F92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47C771BF349
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E83D60B3C
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E83D60B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SxKGzBRp65Gl for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:40:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3420C60B46
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3420C60B46
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 235BF85FF7; Sat,  1 Jul 2023 14:40:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 16:37:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 227c42b8c3e0fada026e17a2b6e8d0d7a4450a3f
X-Git-Newrev: 9fc0d3a4e7363a69f6bfc013bbdba045cf3e02b9
X-Patchwork-Hint: ignore
Message-Id: <20230701144050.235BF85FF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/syslog-ng: bump version to 4.2.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9fc0d3a4e7363a69f6bfc013bbdba045cf3e02b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated upstream URL of patch file.

Release notes:
https://axoflow.com/axosyslog-release-4-2/
https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.2.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                              | 1 -
 package/syslog-ng/0001-fix-build-on-uclibc.patch | 3 ++-
 package/syslog-ng/syslog-ng.conf                 | 2 +-
 package/syslog-ng/syslog-ng.hash                 | 2 +-
 package/syslog-ng/syslog-ng.mk                   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 373711b6bc..847f823ed0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1476,7 +1476,6 @@ package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
 package/suricata/S99suricata Shellcheck
 package/swupdate/swupdate.sh Shellcheck
 package/sylpheed/0001-harden-link-checker-before-accepting-click.patch Upstream
-package/syslog-ng/0001-fix-build-on-uclibc.patch Upstream
 package/sysprof/0001-define-NT_GNU_BUILD_ID.patch Upstream
 package/sysrepo/S51sysrepo-plugind Indent Shellcheck
 package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch Upstream
diff --git a/package/syslog-ng/0001-fix-build-on-uclibc.patch b/package/syslog-ng/0001-fix-build-on-uclibc.patch
index dbb9b66b5c..07c3f0721c 100644
--- a/package/syslog-ng/0001-fix-build-on-uclibc.patch
+++ b/package/syslog-ng/0001-fix-build-on-uclibc.patch
@@ -9,8 +9,9 @@ pthread_spin_trylock so check for this function before using it
 Fixes:
  - http://autobuild.buildroot.org/results/0a6de11c030a4f39e402917809fc6d33fb463d1b
 
+Upstream: https://github.com/buytenh/ivykis/pull/22
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/buytenh/ivykis/pull/17]
 ---
  configure.ac   | 3 +++
  src/spinlock.h | 4 ++++
diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index f4b74dc8c1..a3cfa8dacf 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 4.1
+@version: 4.2
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 8ab4d5ac3b..a917331580 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  d7df3cfa32d1a750818d94b8ea582dea54c37226e7b55a88c3d2f3a543d8f20e  syslog-ng-4.1.1.tar.gz
+sha256  092bd17fd47002c988aebdf81d0ed3f3cfd0e82b388d2453bcaa5e67934f4dda  syslog-ng-4.2.0.tar.gz
 sha256  c75dcbfc17ccf742f12042a370f825a40951085d2352dfc9d07e715dae3ca9bd  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index ecc8eeddce..39433185b4 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 4.1.1
+SYSLOG_NG_VERSION = 4.2.0
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
