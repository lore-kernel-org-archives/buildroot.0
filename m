Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3523ECCD18E
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 22:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C464960FB1;
	Tue, 14 Oct 2025 22:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zreinOgSUvXi; Tue, 14 Oct 2025 22:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5630861122
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5630861122;
	Tue, 14 Oct 2025 22:00:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3381C4C4
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22A1D60E9D
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtqqIz02ZiNC for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 22:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EEB260EC6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EEB260EC6
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 511CE87104; Tue, 14 Oct 2025 22:00:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 23:58:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59006ecfe79519236a0a8ce427d40103d2a0e32e
X-Git-Newrev: 593f46dcdcfa95f587efa05a57e796f20293d70b
X-Patchwork-Hint: ignore
Message-Id: <20251014220001.511CE87104@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyasn1: bump version to
 0.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=593f46dcdcfa95f587efa05a57e796f20293d70b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/pyasn1/pyasn1/blob/v0.6.1/CHANGES.rst

Updated project URL according to https://pypi.org/project/pyasn1/

Updated license hash due to copyright year bump:
https://github.com/pyasn1/pyasn1/commit/acb78299d1270a2fea0d11e5509777b7c5777f3f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyasn1/Config.in          | 2 +-
 package/python-pyasn1/python-pyasn1.hash | 6 +++---
 package/python-pyasn1/python-pyasn1.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pyasn1/Config.in b/package/python-pyasn1/Config.in
index fea63813b9..fb576ffb71 100644
--- a/package/python-pyasn1/Config.in
+++ b/package/python-pyasn1/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_PYASN1
 	help
 	  ASN.1 types and codecs.
 
-	  https://github.com/etingof/pyasn1
+	  https://github.com/pyasn1/pyasn1
diff --git a/package/python-pyasn1/python-pyasn1.hash b/package/python-pyasn1/python-pyasn1.hash
index 4347a43c46..4268d82c38 100644
--- a/package/python-pyasn1/python-pyasn1.hash
+++ b/package/python-pyasn1/python-pyasn1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1/json
-md5  dffae4ff9f997a83324b3f33fe62be54  pyasn1-0.4.8.tar.gz
-sha256  aef77c9fb94a3ac588e87841208bdec464471d9871bd5050a287cc9a475cd0ba  pyasn1-0.4.8.tar.gz
+md5  75cdc260597f112fdfefec85379e710d  pyasn1-0.6.1.tar.gz
+sha256  6f580d2bdd84365380830acf45550f2511469f673cb4a5ae3857a3170128b034  pyasn1-0.6.1.tar.gz
 # Locally computed sha256 checksums
-sha256  22c5cc6922ab5d69fba32d8c5ee4cdd14981508cb53afc0ebd85593847fd95a5  LICENSE.rst
+sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.rst
diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
index 60050bef18..7a5cde40fb 100644
--- a/package/python-pyasn1/python-pyasn1.mk
+++ b/package/python-pyasn1/python-pyasn1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_VERSION = 0.4.8
+PYTHON_PYASN1_VERSION = 0.6.1
 PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
-PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/a4/db/fffec68299e6d7bad3d504147f9094830b704527a7fc098b721d38cc7fa7
+PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/ba/e9/01f1a64245b89f039897cb0130016d79f77d52669aae6ee7b159a6c4c018
 PYTHON_PYASN1_SETUP_TYPE = setuptools
 PYTHON_PYASN1_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
