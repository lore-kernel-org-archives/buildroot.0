Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0334D24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE2F24136B;
	Thu, 10 Oct 2024 21:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNAD0ykjHqia; Thu, 10 Oct 2024 21:32:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79CDA41588
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79CDA41588;
	Thu, 10 Oct 2024 21:32:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0870D1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FB2F404F0
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Do_udPXzp_1Z for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:30:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A681A412E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A681A412E6
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A076285C59; Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 23:18:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ace041182c979dc4b0d25eb7925e7f224f76296b
X-Git-Newrev: 5d2e126decfb6be0af46630d203f71845428a14e
X-Patchwork-Hint: ignore
Message-Id: <20241010213043.A076285C59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-webargs: bump to version
 8.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d2e126decfb6be0af46630d203f71845428a14e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to flit build backend.

License hash changed due to year removal:
https://github.com/marshmallow-code/webargs/commit/0917b88a60385cb12a9fa543ca5b7f6a0d6bb336

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-webargs/python-webargs.hash | 6 +++---
 package/python-webargs/python-webargs.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-webargs/python-webargs.hash b/package/python-webargs/python-webargs.hash
index 10bb3651f0..3416a441dd 100644
--- a/package/python-webargs/python-webargs.hash
+++ b/package/python-webargs/python-webargs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webargs/json
-md5  9fff29294a5db748eca791da2b93e370  webargs-8.2.0.tar.gz
-sha256  99d68940c452e07726485a15fef43f12f8ae6c0c5b391bcba76065d4527fb85d  webargs-8.2.0.tar.gz
+md5  bb65a1f2964f24f77650b8a14ddfbdb1  webargs-8.6.0.tar.gz
+sha256  b8d098ab92bd74c659eca705afa31d681475f218cb15c1e57271fa2103c0547a  webargs-8.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5973e5dcc20b65e4eb4b4acdf273bb78a18522914ab626f496f1b070f7e6294d  LICENSE
+sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
diff --git a/package/python-webargs/python-webargs.mk b/package/python-webargs/python-webargs.mk
index ce270842c1..9edca07a15 100644
--- a/package/python-webargs/python-webargs.mk
+++ b/package/python-webargs/python-webargs.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_WEBARGS_VERSION = 8.2.0
+PYTHON_WEBARGS_VERSION = 8.6.0
 PYTHON_WEBARGS_SOURCE = webargs-$(PYTHON_WEBARGS_VERSION).tar.gz
-PYTHON_WEBARGS_SITE = https://files.pythonhosted.org/packages/4b/7d/fece8e6547b3edde8953b1c84a63da02e1a88efcb9d7d485e4d1b25d9c47
-PYTHON_WEBARGS_SETUP_TYPE = setuptools
+PYTHON_WEBARGS_SITE = https://files.pythonhosted.org/packages/8c/51/e9ee5d8315864adf65e92f858f826514538e30db542d4782dd94c2418464
+PYTHON_WEBARGS_SETUP_TYPE = flit
 PYTHON_WEBARGS_LICENSE = MIT
 PYTHON_WEBARGS_LICENSE_FILES = LICENSE
 PYTHON_WEBARGS_CPE_ID_VENDOR = webargs_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
