Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5FAC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F58C410D5;
	Mon, 20 Feb 2023 22:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F58C410D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kQjtkOUj7Qup; Mon, 20 Feb 2023 22:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28F0240877;
	Mon, 20 Feb 2023 22:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28F0240877
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFEE71BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F26C56117B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F26C56117B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ZPCFpgJuIx2 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2631061074
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2631061074
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20D288648F; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:29:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cfd2cb65f2345aa3cda8926c0ec64537f9e4f27b
X-Git-Newrev: 0894b7f78b17a2ddb4e922c5ee63379fe00a7259
X-Patchwork-Hint: ignore
Message-Id: <20230220205203.20D288648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pybind: bump to
 version 2.10.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0894b7f78b17a2ddb4e922c5ee63379fe00a7259
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pybind/python-pybind.hash | 2 +-
 package/python-pybind/python-pybind.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index b4b3ff94d0..530cbf64af 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  eacf582fa8f696227988d08cfc46121770823839fe9e301a20fbce67e7cd70ec  python-pybind-2.10.0.tar.gz
+sha256  111014b516b625083bef701df7880f78c2243835abdb263065b6b59b960b6bad  python-pybind-2.10.1.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index c5bee3d0a7..e89d77147e 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.10.0
+PYTHON_PYBIND_VERSION = 2.10.1
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
