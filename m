Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E1BCCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EF956131F;
	Tue, 14 Oct 2025 18:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cs0n0wbg_uEg; Tue, 14 Oct 2025 18:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 625B5612FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 625B5612FB;
	Tue, 14 Oct 2025 18:45:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53D2D294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA82E612FB
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHA-JVpO0BVk for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09095612FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09095612FA
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA647870CF; Tue, 14 Oct 2025 18:45:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 20:44:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f98a4ca3a2eb801585dc3e50c812833c0aee4630
X-Git-Newrev: ffb71b5ecc3b13eb143bd6e92312b7d222c38fae
X-Patchwork-Hint: ignore
Message-Id: <20251014184550.EA647870CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bluezero: bump version to
 0.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ffb71b5ecc3b13eb143bd6e92312b7d222c38fae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/ukBaz/python-bluezero/commit/a4b2731affa3806fa74509e6c0049dfc6474359f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-bluezero/python-bluezero.hash | 4 ++--
 package/python-bluezero/python-bluezero.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bluezero/python-bluezero.hash b/package/python-bluezero/python-bluezero.hash
index 150a384223..6cf334b08c 100644
--- a/package/python-bluezero/python-bluezero.hash
+++ b/package/python-bluezero/python-bluezero.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bluezero/json
-md5  8bace06486618fceca632aedc2733027  bluezero-0.9.0.tar.gz
-sha256  2512935e094e3afd21ca9d4cb1b9aaa88a524e9538ae81305b2086f09f0eee17  bluezero-0.9.0.tar.gz
+md5  2c567d4a6bf2bf03c9131b69695700ac  bluezero-0.9.1.tar.gz
+sha256  82488a9dc264f6114bb9727cc7e8939fa3a8d08fd71384cdab31419a80d25f97  bluezero-0.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  59319e80b4caa94ace4817c9f84aa16abc9d4d2b5f7866251b5fda92e87ccdef  LICENSE
diff --git a/package/python-bluezero/python-bluezero.mk b/package/python-bluezero/python-bluezero.mk
index 81e7363fc7..071085c644 100644
--- a/package/python-bluezero/python-bluezero.mk
+++ b/package/python-bluezero/python-bluezero.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLUEZERO_VERSION = 0.9.0
+PYTHON_BLUEZERO_VERSION = 0.9.1
 PYTHON_BLUEZERO_SOURCE = bluezero-$(PYTHON_BLUEZERO_VERSION).tar.gz
-PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/7b/9c/bfb3e1f92dd39bf3de8fc483a102bfae763fbf156177b77ed96b8a38bbb1
+PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/ca/09/2aec91949397d15acb794648d65646e27f0e9f999a0da962e73023198663
 PYTHON_BLUEZERO_SETUP_TYPE = setuptools
 PYTHON_BLUEZERO_LICENSE = MIT
 PYTHON_BLUEZERO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
