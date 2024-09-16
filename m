Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA0BC3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7059860A71;
	Mon, 16 Sep 2024 10:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22zQljq2SOno; Mon, 16 Sep 2024 10:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EBB0606D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EBB0606D3;
	Mon, 16 Sep 2024 10:01:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71A8E1BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B38E606D3
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MPvoVai8MbD for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0CEF60594
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0CEF60594
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:01:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87D6C83778; Mon, 16 Sep 2024 10:01:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 11:42:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03e8d86f457809f5f5ac3200f0b2612d86b4c006
X-Git-Newrev: faf00146427e6f3ce18bc35030ea330d7384e0e7
X-Patchwork-Hint: ignore
Message-Id: <20240916100146.87D6C83778@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jsonschema: bump to version
 4.23.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=faf00146427e6f3ce18bc35030ea330d7384e0e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-jsonschema/python-jsonschema.hash | 4 ++--
 package/python-jsonschema/python-jsonschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
index 645a6657fe..79d64f4846 100644
--- a/package/python-jsonschema/python-jsonschema.hash
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema/json
-md5  e758f0f6a8f3f59d754e7e35ea9f0792  jsonschema-4.20.0.tar.gz
-sha256  4f614fd46d8d61258610998997743ec5492a648b33cf478c1ddc23ed4598a5fa  jsonschema-4.20.0.tar.gz
+md5  a2cb5fee4da011118708ab275b34f30b  jsonschema-4.23.0.tar.gz
+sha256  d71497fef26351a33265337fa77ffeb82423f3ea21283cd9467bb03999266bc4  jsonschema-4.23.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4f92a015a13c4d1a040bef018aa13430b4f1bc73b41b16bb846c346766de7439  COPYING
 sha256  837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  json/LICENSE
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 9e8b6e18b8..21e4adab48 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_VERSION = 4.20.0
+PYTHON_JSONSCHEMA_VERSION = 4.23.0
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/a8/74/77bf12d3dd32b764692a71d4200f03429c41eee2e8a9225d344d91c03aff
+PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/38/2e/03362ee4034a4c917f697890ccd4aec0800ccf9ded7f511971c75451deec
 PYTHON_JSONSCHEMA_SETUP_TYPE = pep517
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
