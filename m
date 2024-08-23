Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35960C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 944F0840D9;
	Fri, 23 Aug 2024 17:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcHkZrCH5_uY; Fri, 23 Aug 2024 17:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E39A840E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E39A840E3;
	Fri, 23 Aug 2024 17:32:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C82231BF314
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B506F4016F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IqYp3Pt5lVX2 for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:32:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A5644015E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A5644015E
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:32:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8690786484; Fri, 23 Aug 2024 17:32:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:29:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b52487ee2f4e67a683d86d306f06937828f015a2
X-Git-Newrev: d54687cc0f61c085cf94b601a37bd4d475515cc2
X-Patchwork-Hint: ignore
Message-Id: <20240823173252.8690786484@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-msgpack: bump
 to version 1.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=d54687cc0f61c085cf94b601a37bd4d475515cc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog: https://github.com/msgpack/msgpack-python/blob/main/ChangeLog.rst#108

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 50462db8db..26599f2972 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  a5a4172b2e89812ec28267dd8942b77d  msgpack-1.0.7.tar.gz
-sha256  572efc93db7a4d27e404501975ca6d2d9775705c2d922390d878fcf768d92c87  msgpack-1.0.7.tar.gz
+md5  6f4d91b00537fd5069dc6bfc52ae5652  msgpack-1.0.8.tar.gz
+sha256  95c02b0e27e706e48d0e5426d1710ca78e0f0628d6e89d5b5a5b91a5f12274f3  msgpack-1.0.8.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 9cdf5263de..4e686a19a6 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.0.7
+PYTHON_MSGPACK_VERSION = 1.0.8
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/c2/d5/5662032db1571110b5b51647aed4b56dfbd01bfae789fa566a2be1f385d1
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/08/4c/17adf86a8fbb02c144c7569dc4919483c01a2ac270307e2d59e1ce394087
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
