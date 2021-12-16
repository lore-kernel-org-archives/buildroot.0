Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFBEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E6CA4014B;
	Thu, 16 Dec 2021 18:26:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7_Jn_hKgfdI; Thu, 16 Dec 2021 18:26:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86D624017B;
	Thu, 16 Dec 2021 18:26:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39E951BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BE9983F06
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cL6094dSMPun for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2905183F0B
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B4908818E5; Thu, 16 Dec 2021 18:19:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 19:08:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8bee3950aa851620d6a954aebad1f984caa105a
X-Git-Newrev: dc929dfa4dce82d96f2b1e6bcbee71775f5052c1
X-Patchwork-Hint: ignore
Message-Id: <20211216181916.B4908818E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/leveldb: bump to version 1.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc929dfa4dce82d96f2b1e6bcbee71775f5052c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Refresh second and fourth patches
- Update indentation in hash file (two spaces)

https://github.com/google/leveldb/releases/tag/1.23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/leveldb/0002-CMake-install-libmemenv.a.patch           |  4 +++-
 .../leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch   | 10 ++++++----
 package/leveldb/leveldb.hash                                   |  4 ++--
 package/leveldb/leveldb.mk                                     |  2 +-
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/package/leveldb/0002-CMake-install-libmemenv.a.patch b/package/leveldb/0002-CMake-install-libmemenv.a.patch
index ab23a1881a..ea742b0c49 100644
--- a/package/leveldb/0002-CMake-install-libmemenv.a.patch
+++ b/package/leveldb/0002-CMake-install-libmemenv.a.patch
@@ -8,6 +8,8 @@ https://git.busybox.net/buildroot/commit/?id=8a10d9ce311c6cb0490d76921cae55618c2
 https://git.busybox.net/buildroot/commit/?id=16f847340d07dce620e4c3fc0a099aa79898d86a
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Fabrice : updated for 1.23]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  CMakeLists.txt | 26 +++++++++++++++++++++++++-
  1 file changed, 25 insertions(+), 1 deletion(-)
@@ -48,9 +50,9 @@ index a65afbf..83b2425 100644
    target_sources(leveldb
      PRIVATE
 @@ -418,7 +436,7 @@ endif(LEVELDB_BUILD_BENCHMARKS)
+ endif(LEVELDB_BUILD_BENCHMARKS)
  
  if(LEVELDB_INSTALL)
-   include(GNUInstallDirs)
 -  install(TARGETS leveldb
 +  install(TARGETS leveldb memenv
      EXPORT leveldbTargets
diff --git a/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch b/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch
index 2626e88652..714e1b0827 100644
--- a/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch
+++ b/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch
@@ -7,6 +7,8 @@ Upstream: https://github.com/google/leveldb/pull/686/commits/3e73a396a082efc76e0
 [Thomas: this commit allows to fix the detection of the snappy library
 in static link configurations]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Fabrice : updated for 1.23]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  CMakeLists.txt         | 12 ++++++++----
  cmake/FindSnappy.cmake | 31 +++++++++++++++++++++++++++++++
@@ -19,14 +21,14 @@ index 78fead6..2efccda 100644
 +++ b/CMakeLists.txt
 @@ -6,6 +6,9 @@ cmake_minimum_required(VERSION 3.9)
  # Keep the version below in sync with the one in db.h
- project(leveldb VERSION 1.22.0 LANGUAGES C CXX)
+ project(leveldb VERSION 1.23.0 LANGUAGES C CXX)
  
 +# Include local CMake modules.
 +list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
 +
- # This project can use C11, but will gracefully decay down to C89.
- set(CMAKE_C_STANDARD 11)
- set(CMAKE_C_STANDARD_REQUIRED OFF)
+ # C standard can be overridden when this is used as a sub-project.
+ if(NOT CMAKE_C_STANDARD)
+   # This project can use C11, but will gracefully decay down to C89.
 @@ -31,13 +34,14 @@ option(LEVELDB_INSTALL "Install LevelDB's header and library" ON)
  include(TestBigEndian)
  test_big_endian(LEVELDB_IS_BIG_ENDIAN)
diff --git a/package/leveldb/leveldb.hash b/package/leveldb/leveldb.hash
index c4a8499dec..068cb09b0a 100644
--- a/package/leveldb/leveldb.hash
+++ b/package/leveldb/leveldb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 55423cac9e3306f4a9502c738a001e4a339d1a38ffbee7572d4a07d5d63949b2  leveldb-1.22.tar.gz
-sha256 ccc19f1da0798ed666609b65a5b44dd8b3abe6fc08b9c0592eb76e82e174db19  LICENSE
+sha256  9a37f8a6174f09bd622bc723b55881dc541cd50747cbd08831c2a82d620f6d76  leveldb-1.23.tar.gz
+sha256  ccc19f1da0798ed666609b65a5b44dd8b3abe6fc08b9c0592eb76e82e174db19  LICENSE
diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index 684b618679..a8f9dc3a1b 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEVELDB_VERSION = 1.22
+LEVELDB_VERSION = 1.23
 LEVELDB_SITE = $(call github,google,leveldb,$(LEVELDB_VERSION))
 LEVELDB_LICENSE = BSD-3-Clause
 LEVELDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
