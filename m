Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40042D24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02BDB412EA;
	Thu, 10 Oct 2024 21:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7v9_LVgJ9sCr; Thu, 10 Oct 2024 21:31:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E93E941324
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E93E941324;
	Thu, 10 Oct 2024 21:31:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEC931BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D329F81EED
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFfLHV9jGNZn for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5237E81F66
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5237E81F66
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:30:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CF0085C67; Thu, 10 Oct 2024 21:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 23:17:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb08b12f32c7acee5b004f5be2d41953ce25feac
X-Git-Newrev: 8df1f9005f9eaff590fe14211132e2360b70a5b9
X-Patchwork-Hint: ignore
Message-Id: <20241010213042.3CF0085C67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-argcomplete: bump to
 version 3.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8df1f9005f9eaff590fe14211132e2360b70a5b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-argcomplete/python-argcomplete.hash | 4 ++--
 package/python-argcomplete/python-argcomplete.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-argcomplete/python-argcomplete.hash b/package/python-argcomplete/python-argcomplete.hash
index 88bd7c9565..73ee60f268 100644
--- a/package/python-argcomplete/python-argcomplete.hash
+++ b/package/python-argcomplete/python-argcomplete.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/argcomplete/json
-md5  5e5bb2e193a5581cb06abae2de3dd3d8  argcomplete-3.5.0.tar.gz
-sha256  4349400469dccfb7950bb60334a680c58d88699bff6159df61251878dc6bf74b  argcomplete-3.5.0.tar.gz
+md5  d41f3c39f4be81d29bb6166e8e57116a  argcomplete-3.5.1.tar.gz
+sha256  eb1ee355aa2557bd3d0145de7b06b2a45b0ce461e1e7813f5d066039ab4177b4  argcomplete-3.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.rst
diff --git a/package/python-argcomplete/python-argcomplete.mk b/package/python-argcomplete/python-argcomplete.mk
index 1773f98914..0118cbb9d6 100644
--- a/package/python-argcomplete/python-argcomplete.mk
+++ b/package/python-argcomplete/python-argcomplete.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGCOMPLETE_VERSION = 3.5.0
+PYTHON_ARGCOMPLETE_VERSION = 3.5.1
 PYTHON_ARGCOMPLETE_SOURCE = argcomplete-$(PYTHON_ARGCOMPLETE_VERSION).tar.gz
-PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/75/33/a3d23a2e9ac78f9eaf1fce7490fee430d43ca7d42c65adabbb36a2b28ff6
+PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/5f/39/27605e133e7f4bb0c8e48c9a6b87101515e3446003e0442761f6a02ac35e
 PYTHON_ARGCOMPLETE_SETUP_TYPE = setuptools
 PYTHON_ARGCOMPLETE_LICENSE = Apache-2.0
 PYTHON_ARGCOMPLETE_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
