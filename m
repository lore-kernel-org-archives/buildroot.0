Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39321D33993
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F222740561;
	Mon, 28 Oct 2024 14:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yj-XQgiyJilv; Mon, 28 Oct 2024 14:41:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97F4A40683
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97F4A40683;
	Mon, 28 Oct 2024 14:41:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 627CBAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57AA540912
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-yToYTi_slM for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24CFC40966
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24CFC40966
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22009813EA; Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 14:48:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ecdb002030089deb17ef03031d6e17c693339e86
X-Git-Newrev: a95f22b0d6dd1b060fc77dc9752481a30a1fc121
X-Patchwork-Hint: ignore
Message-Id: <20241028144053.22009813EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wtforms: bump to version
 3.2.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a95f22b0d6dd1b060fc77dc9752481a30a1fc121
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-wtforms/python-wtforms.hash | 4 ++--
 package/python-wtforms/python-wtforms.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
index 3a1d932d3d..ba68361055 100644
--- a/package/python-wtforms/python-wtforms.hash
+++ b/package/python-wtforms/python-wtforms.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/wtforms/json
-md5  722bf234789979ed2ff06e8e9323fa0f  wtforms-3.1.2.tar.gz
-sha256  f8d76180d7239c94c6322f7990ae1216dae3659b7aa1cee94b6318bdffb474b9  wtforms-3.1.2.tar.gz
+md5  58a16ec4a96043b429c196bfafa5fd96  wtforms-3.2.1.tar.gz
+sha256  df3e6b70f3192e92623128123ec8dca3067df9cfadd43d59681e210cfb8d4682  wtforms-3.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cf40d60ff34f6b2b68a53d220f8b66567b5ac8dd1119b37b62fd15e9518fe59b  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 4f020151cd..69e051f150 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WTFORMS_VERSION = 3.1.2
+PYTHON_WTFORMS_VERSION = 3.2.1
 PYTHON_WTFORMS_SOURCE = wtforms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/6a/c7/96d10183c3470f1836846f7b9527d6cb0b6c2226ebca40f36fa29f23de60
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/01/e4/633d080897e769ed5712dcfad626e55dbd6cf45db0ff4d9884315c6a82da
 PYTHON_WTFORMS_SETUP_TYPE = hatch
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
