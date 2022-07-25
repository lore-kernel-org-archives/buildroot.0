Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA342C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75B8383E48;
	Mon, 25 Jul 2022 22:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75B8383E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8eNMn2LwRcHJ; Mon, 25 Jul 2022 22:30:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86D9D83E1A;
	Mon, 25 Jul 2022 22:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86D9D83E1A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3043D1BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB0E941B3C
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB0E941B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B_FrjTvOflrM for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:29:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5650E41A5C
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5650E41A5C
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0F04B85E6B; Mon, 25 Jul 2022 22:15:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 00:14:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e20fc24b34bc73a2ac678528daf9e2596aa1101a
X-Git-Newrev: a027f14c8e4ee1bbe2e9258ce0305e3966e1b675
X-Patchwork-Hint: ignore
Message-Id: <20220725221521.0F04B85E6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pybind: bump version to
 2.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a027f14c8e4ee1bbe2e9258ce0305e3966e1b675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
[Arnout: don't remove original author from the patch]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-pybind11-commands.py-support-STAGING_DIR.patch           | 8 ++++----
 package/python-pybind/python-pybind.hash                          | 2 +-
 package/python-pybind/python-pybind.mk                            | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
index 021321a9b7..009f43cdbc 100644
--- a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
+++ b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
@@ -12,16 +12,16 @@ the current directory, if it is set.
 
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Upstream-Status: N/A, Buildroot specific
+Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
 ---
  pybind11/commands.py | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/pybind11/commands.py b/pybind11/commands.py
-index 11f81d2..8c4876d 100644
+index a29c8ca..de8a27c 100644
 --- a/pybind11/commands.py
 +++ b/pybind11/commands.py
-@@ -1,7 +1,8 @@
- # -*- coding: utf-8 -*-
+@@ -1,6 +1,7 @@
  import os
  
 -DIR = os.path.abspath(os.path.dirname(__file__))
@@ -29,7 +29,7 @@ index 11f81d2..8c4876d 100644
 +    os.path.abspath(os.path.dirname(__file__))
  
  
- def get_include(user=False):
+ def get_include(user: bool = False) -> str:  # pylint: disable=unused-argument
 -- 
 2.31.1
 
diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index d5b4b4829e..b4b3ff94d0 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  057fb68dafd972bc13afb855f3b0d8cf0fa1a78ef053e815d9af79be7ff567cb  python-pybind-2.9.0.tar.gz
+sha256  eacf582fa8f696227988d08cfc46121770823839fe9e301a20fbce67e7cd70ec  python-pybind-2.10.0.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 05fc593346..c5bee3d0a7 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.9.0
+PYTHON_PYBIND_VERSION = 2.10.0
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
