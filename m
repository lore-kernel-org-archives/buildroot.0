Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C79DCCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 020AE83E15;
	Tue, 14 Oct 2025 18:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qcZElsPIYvy; Tue, 14 Oct 2025 18:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBBBC83E06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBBBC83E06;
	Tue, 14 Oct 2025 18:46:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0815D294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 299C5612FA
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYHit6yGKLLM for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A95761307
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A95761307
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 592C3870E4; Tue, 14 Oct 2025 18:45:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 20:44:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f53d6a83a9f7f0167a5b92646be741c963afb84a
X-Git-Newrev: 853e3609c148452e3daa66f301638d8474c138ef
X-Patchwork-Hint: ignore
Message-Id: <20251014184551.592C3870E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dtschema: bump version to
 2025.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=853e3609c148452e3daa66f301638d8474c138ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-dtschema/python-dtschema.hash | 4 ++--
 package/python-dtschema/python-dtschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
index b53830f4cb..29463ff5da 100644
--- a/package/python-dtschema/python-dtschema.hash
+++ b/package/python-dtschema/python-dtschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dtschema/json
-md5  e4ecd1925af81376865ce0169dc1146a  dtschema-2024.11.tar.gz
-sha256  bb7dd36ff9406ec89607b893cfc5e1ffa7ead76fd5c48df77eafc9b4d4196047  dtschema-2024.11.tar.gz
+md5  7d568f4e631d1f2f5ec32aea7851859c  dtschema-2025.8.tar.gz
+sha256  3c63b643fa76215b32cc6cbea9fd0dc7627dc71c67f3dca14fc04d70a7e1235e  dtschema-2025.8.tar.gz
 # Locally computed sha256 checksums
 sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
index 13ccc16e95..28b7ac3cdf 100644
--- a/package/python-dtschema/python-dtschema.mk
+++ b/package/python-dtschema/python-dtschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DTSCHEMA_VERSION = 2024.11
+PYTHON_DTSCHEMA_VERSION = 2025.8
 PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
-PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/b7/e2/260c0429118b1555ddc2d0d465b7ab36e76ab2454a3d1a916ef06dffccca
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/96/0d/ae12436b8de0d06cf5aa07787679bcefd24ba0c7a556edd5cdaef4a38022
 PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
 PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
 PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
