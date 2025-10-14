Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBD6CCD195
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 22:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A460612D7;
	Tue, 14 Oct 2025 22:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13pHn_zoBvvD; Tue, 14 Oct 2025 22:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A1D1611CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A1D1611CA;
	Tue, 14 Oct 2025 22:00:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CE541C9
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C905E811F5
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4-JvJHVSg3j for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17B89811EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17B89811EA
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E99D387103; Tue, 14 Oct 2025 22:00:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 23:58:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3356edb0c4373a98d819b28ee7d36032dbc74a1
X-Git-Newrev: f5bba8e3d82ec17156be4a3c8e029221117d7f77
X-Patchwork-Hint: ignore
Message-Id: <20251014220001.E99D387103@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyyaml: bump version to
 6.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5bba8e3d82ec17156be4a3c8e029221117d7f77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyyaml/python-pyyaml.hash | 6 +++---
 package/python-pyyaml/python-pyyaml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyyaml/python-pyyaml.hash b/package/python-pyyaml/python-pyyaml.hash
index 47bd6d1ef9..96450f0858 100644
--- a/package/python-pyyaml/python-pyyaml.hash
+++ b/package/python-pyyaml/python-pyyaml.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/PyYAML/json
-md5  9600ee49b2b4e1a0237cf4173b6dc594  pyyaml-6.0.2.tar.gz
-sha256  d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e  pyyaml-6.0.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyyaml/json
+md5  dbc6f815cd75160ccf12e470be1c8d6e  pyyaml-6.0.3.tar.gz
+sha256  d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f  pyyaml-6.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  8d3928f9dc4490fd635707cb88eb26bd764102a7282954307d3e5167a577e8a4  LICENSE
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 1101b59276..bfbf5276a6 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYYAML_VERSION = 6.0.2
+PYTHON_PYYAML_VERSION = 6.0.3
 PYTHON_PYYAML_SOURCE = pyyaml-$(PYTHON_PYYAML_VERSION).tar.gz
-PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17
+PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2
 PYTHON_PYYAML_SETUP_TYPE = setuptools
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
