Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03E2C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 440504EC54;
	Mon, 20 Feb 2023 22:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 440504EC54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yH_-7AoDhkVY; Mon, 20 Feb 2023 22:17:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 067094EF9F;
	Mon, 20 Feb 2023 22:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 067094EF9F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE20B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E446C61168
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E446C61168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GRMfhhr4Bmsh for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C5826113B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C5826113B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2CBE8648F; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:29:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4b2f08f587a7e779745d0f89ac576ef6026b0b05
X-Git-Newrev: 027ad7bbd6fd6ab57781f0730e9587acb26efc76
X-Patchwork-Hint: ignore
Message-Id: <20230220205201.F2CBE8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-hatch-vcs: bump
 to version 0.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=027ad7bbd6fd6ab57781f0730e9587acb26efc76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-hatch-vcs/python-hatch-vcs.hash | 4 ++--
 package/python-hatch-vcs/python-hatch-vcs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatch-vcs/python-hatch-vcs.hash b/package/python-hatch-vcs/python-hatch-vcs.hash
index e57eeddd2f..6e5fe1de13 100644
--- a/package/python-hatch-vcs/python-hatch-vcs.hash
+++ b/package/python-hatch-vcs/python-hatch-vcs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatch_vcs/json
-md5  e56b6d0c05cfb9b59d493c67f94d6e48  hatch_vcs-0.2.0.tar.gz
-sha256  9913d733b34eec9bb0345d0626ca32165a4ad2de15d1ce643c36d09ca908abff  hatch_vcs-0.2.0.tar.gz
+md5  c2f2cbe6851b7b2969cb4aa24c4b9b2f  hatch_vcs-0.3.0.tar.gz
+sha256  cec5107cfce482c67f8bc96f18bbc320c9aa0d068180e14ad317bbee5a153fee  hatch_vcs-0.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  117aa5006d8475562f04442ab06dd2a4c501af3a77255eae0deef1f0c2499a1a  LICENSE.txt
diff --git a/package/python-hatch-vcs/python-hatch-vcs.mk b/package/python-hatch-vcs/python-hatch-vcs.mk
index 55c6461751..ef5f6541cd 100644
--- a/package/python-hatch-vcs/python-hatch-vcs.mk
+++ b/package/python-hatch-vcs/python-hatch-vcs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCH_VCS_VERSION = 0.2.0
+PYTHON_HATCH_VCS_VERSION = 0.3.0
 PYTHON_HATCH_VCS_SOURCE = hatch_vcs-$(PYTHON_HATCH_VCS_VERSION).tar.gz
-PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/ac/13/b3d83564c0cc0f1d45b4ea2a78b87b383a8165797613fedf11f1a7e49b48
+PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/04/33/b68d68e532392d938472d16a03e4ce0ccd749ea31b42d18f8baa6547cbfd
 PYTHON_HATCH_VCS_LICENSE = MIT
 PYTHON_HATCH_VCS_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCH_VCS_SETUP_TYPE = pep517
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
