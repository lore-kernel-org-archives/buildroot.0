Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52350C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 11:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0837C40236;
	Sat, 25 Nov 2023 11:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0837C40236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ElGDkIlQ6nwI; Sat, 25 Nov 2023 11:32:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0602403EA;
	Sat, 25 Nov 2023 11:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0602403EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 142721BF27C
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 11:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A84280A51
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 11:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A84280A51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GUYgDAavbpMx for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 11:31:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64F7C817FF
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 11:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64F7C817FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54BF686C58; Sat, 25 Nov 2023 11:31:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 12:24:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 31d7d323808083e2b8e25a7fdbee08f5486ee291
X-Git-Newrev: c3f74b50daf957881f242872c501241f915e8d51
X-Patchwork-Hint: ignore
Message-Id: <20231125113128.54BF686C58@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pathvalidate:
 bump to version 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3f74b50daf957881f242872c501241f915e8d51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pathvalidate/python-pathvalidate.hash | 4 ++--
 package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index 828236304e..4442d82ac1 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathvalidate/json
-md5  541238984572fb21db2da2af1d70a993  pathvalidate-2.5.2.tar.gz
-sha256  5ff57d0fabe5ecb7a4f1e4957bfeb5ad8ab5ab4c0fa71f79c6bbc24bd9b7d14d  pathvalidate-2.5.2.tar.gz
+md5  2a76cbe4e08f58087f418d150a1461b5  pathvalidate-3.2.0.tar.gz
+sha256  5e8378cf6712bff67fbe7a8307d99fa8c1a0cb28aa477056f8fc374f0dff24ad  pathvalidate-3.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index 6ca8c0f2ad..243f541892 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 2.5.2
+PYTHON_PATHVALIDATE_VERSION = 3.2.0
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/60/f7/ff244fdd8ed98e98d4f9acecfe74a890e5e3245ce55253ef88db51e94652
+PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/27/93/e2b086c7aba96c70b5e7ef48251702fb95027638fb5a3e787d2efd65783e
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
