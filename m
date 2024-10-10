Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565D0D2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1305C410E4;
	Thu, 10 Oct 2024 21:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kg_tj8OvUtFE; Thu, 10 Oct 2024 21:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D54A41442
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D54A41442;
	Thu, 10 Oct 2024 21:32:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 338C81BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79F6760BDD
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOnlHZOfO86L for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF4CC60AB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF4CC60AB2
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB1C785C67; Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 23:18:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d2e126decfb6be0af46630d203f71845428a14e
X-Git-Newrev: 581297cb08bf7d5553fd69bcf3234f27dacd5ca1
X-Patchwork-Hint: ignore
Message-Id: <20241010213043.AB1C785C67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-webob: bump to version 1.8.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=581297cb08bf7d5553fd69bcf3234f27dacd5ca1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-webob/python-webob.hash | 4 ++--
 package/python-webob/python-webob.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-webob/python-webob.hash b/package/python-webob/python-webob.hash
index a46c1dbc94..065a878d41 100644
--- a/package/python-webob/python-webob.hash
+++ b/package/python-webob/python-webob.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webob/json
-md5  10191c69fa5a2c00f3b9abfb8937b415  WebOb-1.8.7.tar.gz
-sha256  b64ef5141be559cfade448f044fa45c2260351edcb6a8ef6b7e00c7dcef0c323  WebOb-1.8.7.tar.gz
+md5  2372b45cf0e0a3970daaa901fc9d0f64  webob-1.8.8.tar.gz
+sha256  2abc1555e118fc251e705fc6dc66c7f5353bb9fbfab6d20e22f1c02b4b71bcee  webob-1.8.8.tar.gz
 # Locally computed sha256 checksums
 sha256  27bc4919e7e9e6b6cda40644517ca74d32203e32fba89ef832aba1ed93e457b3  docs/license.txt
diff --git a/package/python-webob/python-webob.mk b/package/python-webob/python-webob.mk
index 11ba104476..0240d3a456 100644
--- a/package/python-webob/python-webob.mk
+++ b/package/python-webob/python-webob.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBOB_VERSION = 1.8.7
-PYTHON_WEBOB_SOURCE = WebOb-$(PYTHON_WEBOB_VERSION).tar.gz
-PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/c7/45/ee5f034fb4ebe3236fa49e5a4fcbc54444dd22ecf33079cf56f9606d479d
+PYTHON_WEBOB_VERSION = 1.8.8
+PYTHON_WEBOB_SOURCE = webob-$(PYTHON_WEBOB_VERSION).tar.gz
+PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/a2/7a/ac5b1ab5636cc3bfc9bab1ed54ff4e8fdeb6367edd911f7337be2248b8ab
 PYTHON_WEBOB_SETUP_TYPE = setuptools
 PYTHON_WEBOB_LICENSE = MIT
 PYTHON_WEBOB_LICENSE_FILES = docs/license.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
